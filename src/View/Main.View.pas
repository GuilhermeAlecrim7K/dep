unit Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonGroup, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Main.Controller, Tickable, CustomTypes, Vcl.Menus;

type
  TfrmMain = class(TForm)
    spdbtnOutro: TSpeedButton;
    pnlButtons: TPanel;
    spdbtnMelhoria: TSpeedButton;
    spdbtnImplementacao: TSpeedButton;
    spdbtnBug: TSpeedButton;
    pnlTimer: TPanel;
    lblCurActivityElapsedTime: TLabel;
    pnlTotalElapsedTimeTracker: TPanel;
    lblOutroTracker: TLabel;
    lblMelhoriaTracker: TLabel;
    lblImplementacaoTracker: TLabel;
    lblBugTracker: TLabel;
    bitbtnExit: TBitBtn;
    lblDate: TLabel;
    lblCurActivityDescription: TLabel;
    mmnMain: TMainMenu;
    mniSettings: TMenuItem;
    mniFilesPath: TMenuItem;
    procedure spdbtnBugClick(Sender: TObject);
    procedure spdbtnImplementacaoClick(Sender: TObject);
    procedure spdbtnMelhoriaClick(Sender: TObject);
    procedure spdbtnOutroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mniFilesPathClick(Sender: TObject);
  private
    FFilesPath: String;
    FController: TMainController;
    procedure CategoryButtonClick(ACategory: TCategories);
  public
    function GetCategoryTimerLabel(ACategory: TCategories): TLabel;
    property FilesPath: String read FFilesPath write FFilesPath;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Ini, IOUtils;

{$R *.dfm}

function TfrmMain.GetCategoryTimerLabel(ACategory: TCategories): TLabel;
begin
  case ACategory of
    TCategories.Bug: 
      Result := lblBugTracker;
    TCategories.Feature: 
      Result := lblImplementacaoTracker;
    TCategories.Refactoring: 
      Result := lblMelhoriaTracker;
    TCategories.Others:
      Result := lblOutroTracker;
  else
    Result := nil;
  end;
end;

{$WARN SYMBOL_PLATFORM OFF}
procedure TfrmMain.mniFilesPathClick(Sender: TObject);
var
  lFileOpenDialog: TFileOpenDialog;
begin
  FormStyle := fsNormal;
  lFileOpenDialog := TFileOpenDialog.Create(Self);
  try
    lFileOpenDialog.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
    lFileOpenDialog.OkButtonLabel := 'Selecionar';
    lFileOpenDialog.DefaultFolder := FilesPath;
    lFileOpenDialog.FileName := FilesPath;
    if lFileOpenDialog.Execute then
    begin
      FilesPath := IncludeTrailingPathDelimiter(lFileOpenDialog.FileName);
      IniFile.WriteString('frmMain', 'FilesPath', FilesPath);
    end;
  finally
    lFileOpenDialog.Free;
    FormStyle := fsStayOnTop;
  end;
end;
{$WARN SYMBOL_PLATFORM ON}

procedure TfrmMain.CategoryButtonClick(ACategory: TCategories);
begin
  FormStyle := fsNormal;
  FController.Notify(ACategory);
  FormStyle := fsStayOnTop;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FController.SaveAsCsv(FilesPath);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  IniFile.LoadSettings(Self);
  FController := TMainController.Create;
  lblDate.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Date);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FController.Free;
  IniFile.SaveSettings(Self);
end;

procedure TfrmMain.spdbtnBugClick(Sender: TObject);
begin
  CategoryButtonClick(TCategories.Bug);
end;

procedure TfrmMain.spdbtnImplementacaoClick(Sender: TObject);
begin
  CategoryButtonClick(TCategories.Feature);
end;

procedure TfrmMain.spdbtnMelhoriaClick(Sender: TObject);
begin
  CategoryButtonClick(TCategories.Refactoring);
end;

procedure TfrmMain.spdbtnOutroClick(Sender: TObject);
begin
  CategoryButtonClick(TCategories.Others);
end;

end.
