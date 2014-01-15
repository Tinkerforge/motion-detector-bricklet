<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletMotionDetector.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletMotionDetector;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change to your UID

// Callback function for end of detection cycle
function cb_detection_cycle_ended()
{
    echo "Detection Cycle Ended (next detection possible in ~3 seconds)\n";
}

// Callback function for detected motion
function cb_motion_detected()
{
    echo "Motion Detected\n";
}

$ipcon = new IPConnection(); // Create IP connection
$md = new BrickletMotionDetector(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register detected callback to function cb_motion_detected
$md->registerCallback(BrickletMotionDetector::CALLBACK_MOTION_DETECTED, 'cb_motion_detected');

// Register detection cycle ended callback to function cb_detection_cycle_ended
$md->registerCallback(BrickletMotionDetector::CALLBACK_DETECTION_CYCLE_ENDED, 'cb_detection_cycle_ended');

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
