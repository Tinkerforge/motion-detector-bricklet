package main

import (
	"fmt"
	"github.com/tinkerforge/go-api-bindings/ipconnection"
	"github.com/tinkerforge/go-api-bindings/motion_detector_bricklet"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Motion Detector Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	md, _ := motion_detector_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	md.RegisterMotionDetectedCallback(func() {
		fmt.Println("Motion Detected")
	})

	md.RegisterDetectionCycleEndedCallback(func() {
		fmt.Println("Detection Cycle Ended (next detection possible in ~3 seconds)")
	})

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
