/* motion-detector-bricklet
 * Copyright (C) 2013 Olaf Lüke <olaf@tinkerforge.com>
 *
 * motion-detector.h: Implementation of Motion Detector Bricklet messages
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

#ifndef MOTION_DETECTOR_H
#define MOTION_DETECTOR_H

#include <stdint.h>
#include "bricklib/com/com_common.h"

#define MOTION_DEBOUNCE 250

#define FID_GET_MOTION_DETECTED   1
#define FID_MOTION_DETECTED       2
#define FID_DETECTION_CYCLE_ENDED 3

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) StandardMessage;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetMotionDetected;

typedef struct {
	MessageHeader header;
	uint8_t motion;
} __attribute__((__packed__)) GetMotionDetectedReturn;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) MotionDetected;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) DetectionCycleEnded;

void get_motion_detected(const ComType com, const GetMotionDetected *data);

void invocation(const ComType com, const uint8_t *data);
void constructor(void);
void destructor(void);
void tick(const uint8_t tick_type);

#endif
