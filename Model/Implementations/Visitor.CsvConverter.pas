unit Visitor.CsvConverter;
  
interface
  
uses
  SysUtils, Classes, Patterns.Visitor, Generics.Collections,
  Category, Mediator.Categories, Activity;

type
  TCsvConverter = class(TInterfacedObject, IVisitor)
  private
    FDirectory: String;
    FData: TObjectList<TStringList>;
    FCurCategory: TCategory;
    procedure VisitTCategory(ACategory: TCategory);
    procedure VisitTActivity(AActivity: TActivity);
    procedure SaveFile;
  public
    constructor Create(const ADirectory: String);
    destructor Destroy; override;
    procedure Visit(AVisitable: TObject; AClass: TClass);
  end;
  
implementation

uses
  CustomTypes, TickHelper;

{ TCsvConverter }

constructor TCsvConverter.Create(const ADirectory: String);
begin
  inherited Create;
  FDirectory := IncludeTrailingPathDelimiter(ADirectory);
  FData := TObjectList<TStringList>.Create(True);
end;

destructor TCsvConverter.Destroy;
begin
  try
    SaveFile;  
  finally
    FData.Free;
    inherited Destroy;
  end;
end;

procedure TCsvConverter.SaveFile;
var
  lStringList: TStringList;
  lFile: TextFile;
  function GetFileName: String;
  begin
    Result := FDirectory + FormatDateTime('yyyy-mm', Date) + '.csv';
  end;
begin
  AssignFile(lFile, GetFileName);
  try
    if FileExists(GetFileName) then
      Append(lFile)
    else
      Rewrite(lFile);
    for lStringList in FData do
      Writeln(lFile, lStringList.DelimitedText);
  finally
    CloseFile(lFile);
  end;
end;

procedure TCsvConverter.Visit(AVisitable: TObject; AClass: TClass);
begin
  if AClass = TCategory then
    VisitTCategory(AVisitable as TCategory)
  else if AClass = TActivity then
    VisitTActivity(AVisitable as TActivity)
end;
  
procedure TCsvConverter.VisitTActivity(AActivity: TActivity);
begin
  FData.Add(TStringList.Create);
  FData.Last.Delimiter := ';';
  FData.Last.QuoteChar := '"';
  FData.Last.Add(FormatDateTime('ddddd', Date));
  FData.Last.Add(FCurCategory.CategoryName);
  FData.Last.Add(AActivity.Description);
  FData.Last.Add(AActivity.Details);
  FData.Last.Add(AActivity.GetTotalTickCount.FormatToHHMMSS);
end;

procedure TCsvConverter.VisitTCategory(ACategory: TCategory);
begin
  FCurCategory := ACategory;
end;

end.
