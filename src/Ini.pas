unit Ini;

interface

uses
  SysUtils, Classes, inifiles, Main.View;

type
  TDepIni = class(TMemIniFile)
  public
    procedure LoadSettings(MainForm: TfrmMain);
    procedure SaveSettings(MainForm: TfrmMain);
  end;

var
  IniFile: TDepIni;

implementation

uses
  Vcl.Forms, IOUtils;

{ TDepIni }

procedure TDepIni.LoadSettings(MainForm: TfrmMain);
begin
  MainForm.Left := ReadInteger('frmMain', 'Left', MainForm.Left);
  MainForm.Top := ReadInteger('frmMain', 'Top', MainForm.Top);
  MainForm.FilesPath := ReadString('frmMain', 'FilesPath', IncludeTrailingPathDelimiter(TPath.GetDocumentsPath));
end;

procedure TDepIni.SaveSettings(MainForm: TfrmMain);
begin
  WriteInteger('frmMain', 'Left', MainForm.Left);
  WriteInteger('frmMain', 'Top', MainForm.Top);
  WriteString('frmMain', 'FilesPath', MainForm.FilesPath);
  UpdateFile;
end;

initialization
  IniFile := TDepIni.Create(ChangeFileExt(Application.ExeName, '.ini'));

finalization
  IniFile.Free;

end.
