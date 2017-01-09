<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletMotionDetector.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletMotionDetector;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Motion Detector Bricklet

// Callback function for motion detected callback
function cb_motionDetected()
{
    echo "Motion Detected\n";
}

// Callback function for detection cycle ended callback
function cb_detectionCycleEnded()
{
    echo "Detection Cycle Ended (next detection possible in ~3 seconds)\n";
}

$ipcon = new IPConnection(); // Create IP connection
$md = new BrickletMotionDetector(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register motion detected callback to function cb_motionDetected
$md->registerCallback(BrickletMotionDetector::CALLBACK_MOTION_DETECTED,
                      'cb_motionDetected');

// Register detection cycle ended callback to function cb_detectionCycleEnded
$md->registerCallback(BrickletMotionDetector::CALLBACK_DETECTION_CYCLE_ENDED,
                      'cb_detectionCycleEnded');

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
