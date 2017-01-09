#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Motion Detector Bricklet

# Handle incoming motion detected callbacks
tinkerforge dispatch motion-detector-bricklet $uid motion-detected\
 --execute "echo Motion Detected" &

# Handle incoming detection cycle ended callbacks
tinkerforge dispatch motion-detector-bricklet $uid detection-cycle-ended\
 --execute "echo Detection Cycle Ended (next detection possible in ~3 seconds)" &

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
