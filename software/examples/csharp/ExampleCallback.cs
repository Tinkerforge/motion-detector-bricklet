using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change to your UID

	// Callback function for end of detection cycle
	static void DetectionCycleEndedCB(BrickletMotionDetector sender)
	{
		System.Console.WriteLine("Detection Cycle Ended (next detection possible in ~3 seconds)");
	}

	// Callback function for detected motion
	static void MotionDetectedCB(BrickletMotionDetector sender)
	{
		System.Console.WriteLine("Motion Detected");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletMotionDetector md = new BrickletMotionDetector(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register detected callback to function MotionDetectedCB
		md.MotionDetected += MotionDetectedCB;

		// Register detection cycle ended callback to function DetectionCycleEndedCB
		md.DetectionCycleEnded += DetectionCycleEndedCB;

		System.Console.WriteLine("Press enter to exit");
		System.Console.ReadLine();
		ipcon.Disconnect();
	}
}
