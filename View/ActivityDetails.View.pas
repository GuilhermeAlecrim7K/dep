unit ActivityDetails.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, CustomTypes;

type
  TfrmActivityDetails = class(TForm)
    memDetails: TMemo;
    lblDetails: TLabel;
    bitbtnConfirm: TBitBtn;
    bitbtnCancel: TBitBtn;
    cbxDescription: TComboBox;
    lblDescription: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPreviousActivitiesDescriptions: TStringList;
    FCategory: TCategories;
    procedure SaveSettings;
  public
    property Category: TCategories read FCategory write FCategory;
  end;

var
  frmActivityDetails: TfrmActivityDetails;

implementation

uses
  Ini;

{$R *.dfm}

{ TfrmActivityDetails }

procedure TfrmActivityDetails.FormCreate(Sender: TObject);
begin
  FPreviousActivitiesDescriptions := TStringList.Create;
  FPreviousActivitiesDescriptions.Delimiter := ';';
  FPreviousActivitiesDescriptions.QuoteChar := '"';
  FPreviousActivitiesDescriptions.StrictDelimiter := True;
  FPreviousActivitiesDescriptions.CaseSensitive := False;
  FPreviousActivitiesDescriptions.Sorted := False;
  FPreviousActivitiesDescriptions.Duplicates := dupIgnore;
end;

procedure TfrmActivityDetails.FormShow(Sender: TObject);
begin
  FPreviousActivitiesDescriptions.DelimitedText := IniFile.ReadString('TfrmActivityDetails', 'PreviousActivities.' + TCategoryNames[Category], EmptyStr);
  cbxDescription.Items.Clear;
  cbxDescription.Items.AddStrings(FPreviousActivitiesDescriptions);
  if cbxDescription.Items.Count > 0 then
    cbxDescription.ItemIndex := 0;
  cbxDescription.SetFocus;
end;

procedure TfrmActivityDetails.FormDestroy(Sender: TObject);
begin
  if ModalResult = mrOk then
    SaveSettings;
  FPreviousActivitiesDescriptions.Free;
  inherited;
end;

procedure TfrmActivityDetails.SaveSettings;
const
  ArbitraryCbxLimit = 15;
begin
  if FPreviousActivitiesDescriptions.IndexOf(cbxDescription.Text) >= 0 then
    Exit;

  FPreviousActivitiesDescriptions.Insert(0, cbxDescription.Text);
  if FPreviousActivitiesDescriptions.Count > ArbitraryCbxLimit then
    FPreviousActivitiesDescriptions.Delete(FPreviousActivitiesDescriptions.Count - 1);
  IniFile.WriteString('TfrmActivityDetails', 'PreviousActivities.' + TCategoryNames[Category], FPreviousActivitiesDescriptions.DelimitedText);
  IniFile.UpdateFile;
end;

end.
