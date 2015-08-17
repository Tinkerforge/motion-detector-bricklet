program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotionDetector;

type
  TExample = class
  private
    ipcon: TIPConnection;
    md: TBrickletMotionDetector;
  public
    procedure MotionDetectedCB(sender: TBrickletMotionDetector);
    procedure DetectionCycleEndedCB(sender: TBrickletMotionDetector);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change to your UID }

var
  e: TExample;

{ Callback function for detected motion }
procedure TExample.MotionDetectedCB(sender: TBrickletMotionDetector);
begin
  WriteLn('Motion Detected');
end;

{ Callback function for end of detection cycle }
procedure TExample.DetectionCycleEndedCB(sender: TBrickletMotionDetector);
begin
  WriteLn('Detection Cycle Ended (next detection possible in ~3 seconds)');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  md := TBrickletMotionDetector.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register detected callback to function MotionDetectedCB }
  md.OnMotionDetected := {$ifdef FPC}@{$endif}MotionDetectedCB;

  { Register detection cycle ended callback to function DetectionCycleEndedCB }
  md.OnDetectionCycleEnded := {$ifdef FPC}@{$endif}DetectionCycleEndedCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
