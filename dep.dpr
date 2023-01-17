program dep;

uses
  Vcl.Forms,
  Ini in 'Ini.pas',
  Main.View in 'View\Main.View.pas' {frmMain},
  Main.Controller in 'Controller\Main.Controller.pas',
  ActivityDetails.View in 'View\ActivityDetails.View.pas' {frmActivityDetails},
  Patterns.Mediator in 'Model\Interfaces\Patterns.Mediator.pas',
  Mediator.Categories in 'Model\Implementations\Mediator.Categories.pas',
  Patterns.Visitor in 'Model\Interfaces\Patterns.Visitor.pas',
  Tickable in 'Model\Interfaces\Tickable.pas',
  Categories in 'Model\Interfaces\Categories.pas',
  Activities in 'Model\Interfaces\Activities.pas',
  Category in 'Model\Implementations\Category.pas',
  Activity in 'Model\Implementations\Activity.pas',
  Visitor.CsvConverter in 'Model\Implementations\Visitor.CsvConverter.pas',
  CustomTypes in 'Model\CustomTypes.pas',
  TickHelper in 'Model\TickHelper.pas';

{$R *.res}  

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
