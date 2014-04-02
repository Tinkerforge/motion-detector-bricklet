#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletMotionDetector;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'jXm'; # Change to your UID

# Callback function for end of detection cycle
sub cb_detection_cycle_ended
{
    print "Detection Cycle Ended (next detection possible in ~3 seconds)\n";
}

# Callback function for detected motion
sub cb_motion_detected
{
    print "Motion Detected\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $md = Tinkerforge::BrickletMotionDetector->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register detected callback to function cb_motion_detected
$md->register_callback($md->CALLBACK_MOTION_DETECTED, 'cb_motion_detected');

# Register detection cycle ended callback to function cb_detection_cycle_ended
$md->register_callback($md->CALLBACK_DETECTION_CYCLE_ENDED, 'cb_detection_cycle_ended');

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();

