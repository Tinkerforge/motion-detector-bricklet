/* motion-detector-bricklet
 * Copyright (C) 2013 Olaf Lüke <olaf@tinkerforge.com>
 *
 * motion-detector.c: Implementation of Motion Detector Bricklet messages
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "motion-detector.h"

#include "bricklib/bricklet/bricklet_communication.h"
#include "bricklib/utility/util_definitions.h"
#include "bricklib/utility/init.h"
#include "brickletlib/bricklet_entry.h"
#include "brickletlib/bricklet_debug.h"
#include "config.h"

void invocation(const ComType com, const uint8_t *data) {
	switch(((MessageHeader*)data)->fid) {
		case FID_GET_MOTION_DETECTED: {
			get_motion_detected(com, (GetMotionDetected*)data);
			return;
		}

		default: {
			BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_NOT_SUPPORTED, com);
			return;
		}
	}
}

void get_motion_detected(const ComType com, const GetMotionDetected *data) {
	GetMotionDetectedReturn gmdr;
	gmdr.header        = data->header;
	gmdr.header.length = sizeof(GetMotionDetectedReturn);
	gmdr.motion        = BC->motion;

	BA->send_blocking_with_timeout(&gmdr, sizeof(GetMotionDetectedReturn), com);
	logbli("get_motion_detected: %d\n\r", BC->motion);
}

void constructor(void) {
	_Static_assert(sizeof(BrickContext) <= BRICKLET_CONTEXT_MAX_SIZE, "BrickContext too big");

	BC->motion = MOTION_NOT_DETECTED;
	BC->motion_detected = false;
	BC->detection_cycle_ended = false;
	BC->debounce = 0;

    PIN_DETECT.type = PIO_INPUT;
    PIN_DETECT.attribute = PIO_DEFAULT;
    BA->PIO_Configure(&PIN_DETECT, 1);

    PIN_LED.type = PIO_OUTPUT_1;
    PIN_LED.attribute = PIO_DEFAULT;
    BA->PIO_Configure(&PIN_LED, 1);
}

void destructor(void) {
    PIN_DETECT.type = PIO_INPUT;
    PIN_DETECT.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_DETECT, 1);
}

void tick(const uint8_t tick_type) {
	if(tick_type & TICK_TASK_TYPE_CALCULATION) {
		if(BC->debounce > 0) {
			BC->debounce--;
			return;
		}

		if(PIN_DETECT.pio->PIO_PDSR & PIN_DETECT.mask) {
			if(BC->motion != MOTION_DETECTED) {
				BC->motion = MOTION_DETECTED;
				BC->debounce = MOTION_DEBOUNCE;
				BC->motion_detected = true;

				PIN_LED.pio->PIO_CODR = PIN_LED.mask;
			}
		} else {
			if(BC->motion != MOTION_NOT_DETECTED) {
				BC->motion = MOTION_NOT_DETECTED;
				BC->debounce = MOTION_DEBOUNCE;
				BC->detection_cycle_ended = true;

				PIN_LED.pio->PIO_SODR = PIN_LED.mask;
			}
		}
	}

	if(tick_type & TICK_TASK_TYPE_MESSAGE) {
		if(BC->motion_detected) {
			MotionDetected md;
			BA->com_make_default_header(&md, BS->uid, sizeof(MotionDetected), FID_MOTION_DETECTED);
			BA->send_blocking_with_timeout(&md,
										   sizeof(MotionDetected),
										   *BA->com_current);

			BC->motion_detected = false;
			logbli("MotionDetected\n\r");
		}

		if(BC->detection_cycle_ended) {
			DetectionCycleEnded dce;
			BA->com_make_default_header(&dce, BS->uid, sizeof(DetectionCycleEnded), FID_DETECTION_CYCLE_ENDED);
			BA->send_blocking_with_timeout(&dce,
										   sizeof(DetectionCycleEnded),
										   *BA->com_current);

			BC->detection_cycle_ended = false;
			logbli("DetectionCycleEnded\n\r");
		}
	}
}
