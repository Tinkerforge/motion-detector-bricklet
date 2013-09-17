#!/bin/sh
# connects to localhost:4223 by default, use --host and --port to change it

# change to your UID
uid=XYZ

# handle incoming detected motion and  end of detection cycle callbacks
# note: this chaining of two dispatches assumes that a detected callback is
#       always followed by a detection cycle ended callback
tinkerforge dispatch motion-detector-bricklet $uid motion-detected\
 --execute "echo Motion Detected;
            tinkerforge dispatch --duration exit-after-first motion-detector-bricklet $uid detection-cycle-ended\
             --execute 'echo Detection Cycle Ended \(next detection possible in \~3 seconds\)'"
