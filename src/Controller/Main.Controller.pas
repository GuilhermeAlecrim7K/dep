unit Main.Controller;
  
interface
  
uses
  SysUtils, Classes, Patterns.Mediator, Mediator.Categories, Generics.Collections,
  VCL.Controls, Vcl.StdCtrls, ActivityDetails.View, Tickable, CustomTypes;

type
  TMainController = class
  private
    FMediator: TCategoriesMediator;
    FCurCategoryBeingTicked: TCategories;
    FCurActivityTimerLabel: TLabel;
    FCurCategoryTimerLabel: TLabel;
    FCurActivityDescriptionLabel: TLabel;
    procedure OnTick(AActivityTickCount, ACategoryTickCount: Tick);
    procedure StartIdleTime;
    procedure SetupTickCounter(ACategory: TCategories);
    procedure Update(ACategory: TCategories; const ADescription, ADetails: String);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Notify(ACategory: TCategories);
    procedure SaveAsCsv(const ADirectory: String);
  end;
  
implementation

uses
  Main.View, TickHelper, Visitor.CsvConverter;
  
{ TMainController }

constructor TMainController.Create;
begin
  inherited Create;
  FCurCategoryBeingTicked := TCategories.Interval;
  FCurActivityTimerLabel := frmMain.lblCurActivityElapsedTime;
  FCurActivityDescriptionLabel := frmMain.lblCurActivityDescription;
  FMediator := TCategoriesMediator.Create(OnTick);
end;

destructor TMainController.Destroy;
begin
  FMediator.Free;
  inherited Destroy;
end;

procedure TMainController.Notify(ACategory: TCategories);
begin
  if FCurCategoryBeingTicked = ACategory then
    StartIdleTime
  else
    SetupTickCounter(ACategory);
end;

procedure TMainController.StartIdleTime;
begin
  FCurCategoryBeingTicked := TCategories.Interval;
  FCurCategoryTimerLabel := nil;
  FCurActivityDescriptionLabel.Caption := ('Pausa');
  FMediator.Notify(FCurCategoryBeingTicked, 'Pausa', '');
end;

procedure TMainController.SetupTickCounter(ACategory: TCategories);
var
  frmActivityDetails: TfrmActivityDetails;
begin
  FCurCategoryBeingTicked := ACategory;
  frmActivityDetails := TfrmActivityDetails.Create(nil);
  try
    frmActivityDetails.Category := ACategory;
    if frmActivityDetails.ShowModal = mrOk then
      Update(ACategory, frmActivityDetails.cbxDescription.Text, frmActivityDetails.memDetails.Lines.Text);
  finally
    frmActivityDetails.Free;
  end;
end;

procedure TMainController.Update(ACategory: TCategories; const ADescription, ADetails: String);
begin
  FCurCategoryTimerLabel := frmMain.GetCategoryTimerLabel(ACategory);
  FCurActivityDescriptionLabel.Caption := 'Atividade em andamento: ' + ADescription;
  FMediator.Notify(ACategory, ADescription, ADetails);
end;

procedure TMainController.OnTick(AActivityTickCount, ACategoryTickCount: Tick);
begin
  FCurActivityTimerLabel.Caption := AActivityTickCount.FormatToHHMMSS;
  if Assigned(FCurCategoryTimerLabel) then
    FCurCategoryTimerLabel.Caption := ACategoryTickCount.FormatToHHMMSS;
end;

procedure TMainController.SaveAsCsv(const ADirectory: String);
begin
  FMediator.Accept(TCsvConverter.Create(ADirectory));
end;

end.
