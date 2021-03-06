using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Motion Detector Bricklet

	// Callback function for motion detected callback
	static void MotionDetectedCB(BrickletMotionDetector sender)
	{
		Console.WriteLine("Motion Detected");
	}

	// Callback function for detection cycle ended callback
	static void DetectionCycleEndedCB(BrickletMotionDetector sender)
	{
		Console.WriteLine("Detection Cycle Ended (next detection possible in ~3 seconds)");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletMotionDetector md = new BrickletMotionDetector(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register motion detected callback to function MotionDetectedCB
		md.MotionDetectedCallback += MotionDetectedCB;

		// Register detection cycle ended callback to function DetectionCycleEndedCB
		md.DetectionCycleEndedCallback += DetectionCycleEndedCB;

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
