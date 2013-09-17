Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    ' Callback function for end of detection cycle
    Sub DetectionCycleEndedCB(ByVal sender As BrickletMotionDetector)
        System.Console.WriteLine("Detection Cycle Ended (next detection possible in ~3 seconds)")
    End Sub

    ' Callback function for detected motion
    Sub MotionDetectedCB(ByVal sender As BrickletMotionDetector)
        System.Console.WriteLine("Motion Detected")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim md As New BrickletMotionDetector(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd

        ' Register detected callback to function MotionDetectedCB
        AddHandler md.MotionDetected, AddressOf MotionDetectedCB

        ' Register detection cycle ended callback to function DetectionCycleEndedCB
        AddHandler md.DetectionCycleEnded, AddressOf DetectionCycleEndedCB

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadKey()
        ipcon.Disconnect()
    End Sub
End Module
