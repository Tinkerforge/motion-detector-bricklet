Imports System
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    ' Callback subroutine for motion detected callback
    Sub MotionDetectedCB(ByVal sender As BrickletMotionDetector)
        Console.WriteLine("Motion Detected")
    End Sub

    ' Callback subroutine for detection cycle ended callback
    Sub DetectionCycleEndedCB(ByVal sender As BrickletMotionDetector)
        Console.WriteLine("Detection Cycle Ended (next detection possible in ~3 seconds)")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim md As New BrickletMotionDetector(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register motion detected callback to subroutine MotionDetectedCB
        AddHandler md.MotionDetected, AddressOf MotionDetectedCB

        ' Register detection cycle ended callback to subroutine DetectionCycleEndedCB
        AddHandler md.DetectionCycleEnded, AddressOf DetectionCycleEndedCB

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
