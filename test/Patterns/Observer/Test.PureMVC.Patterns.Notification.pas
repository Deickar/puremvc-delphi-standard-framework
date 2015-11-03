unit Test.PureMVC.Patterns.Notification;

{
  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework,
  PureMVC.Patterns.Observer,
  PureMVC.Interfaces.INotification,
  PureMVC.Interfaces.IObserver;

type
  TestTNotification = class(TTestCase)
  private
  published
    procedure BodyAccessors;
    procedure NameAccessors;
    procedure TestConstructor;
    procedure TestToString;
  end;

implementation

uses
  SysUtils,
  PureMVC.Patterns.Notification;

procedure TestTNotification.NameAccessors;
var
  Note: INotification;
begin
  Note := TNotification.Create('TestNote');
  CheckEquals('TestNote', Note.Name);
end;

procedure TestTNotification.BodyAccessors;
var
  Note: INotification;
begin
  Note := TNotification.Create;
  Note.Body := 5;
  CheckEquals(5, Note.Body.AsInteger);
end;

procedure TestTNotification.TestConstructor;
var
  Note: INotification;
begin
  Note := TNotification.Create('TestNote', Self, 5, 'TestNoteType');
  CheckSame(Self, Note.Sender);
  CheckEquals('TestNote', Note.Name);
  CheckEquals(5, Note.Body.AsInteger);
  CheckEquals('TestNoteType', Note.Kind.AsString);
end;

procedure TestTNotification.TestToString;
var
  Note: INotification;
  ToStr: string;
begin
  Note := TNotification.Create('TestNote', Self, '1,3,5', 'TestType');
  ToStr := Format(TNotification.ToStrFmt, ['TestNote', Format('(%s @ %p)', [Self.ClassName, Pointer(Self)]), '1,3,5', 'TestType']);
  CheckEquals(ToStr, Note.ToString);
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTNotification.Suite);

end.