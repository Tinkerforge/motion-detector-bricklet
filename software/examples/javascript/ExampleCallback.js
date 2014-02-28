var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'kgD'; // Change to your UID

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var md = new Tinkerforge.BrickletMotionDetector(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        console.log('Error: '+error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

// Register detected callback
md.on(Tinkerforge.BrickletMotionDetector.CALLBACK_MOTION_DETECTED,
    // Callback function for detected motion
    function() {
        console.log('Motion Detected');
    }
);
// Register detection cycle ended callback
md.on(Tinkerforge.BrickletMotionDetector.CALLBACK_DETECTION_CYCLE_ENDED,
    // Callback function for end of detection cycle
    function() {
        console.log('Detection Cycle Ended (next detection possible in ~3 seconds)');
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
