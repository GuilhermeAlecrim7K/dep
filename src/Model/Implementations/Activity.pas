unit Activity;
  
interface
  
uses
  SysUtils, Classes, Activities, CustomTypes, Patterns.Visitor;

type
  TActivity = class(TInterfacedObject, IActivity)
  private
    FDescription: String;
    FDetails: TStringList;
    FTickCount: Tick;
    function GetDetails: String;
  public
    constructor Create(const ADescription, ADetails: String);
    destructor Destroy; override;
    function Tick: Tick;
    function GetTotalTickCount: Tick;
    procedure AddDetails(const ADetails: String);
    procedure Accept(AVisitor: IVisitor);
  published
    property Description: String read FDescription;
    property Details: String read GetDetails;
  end;

implementation

{ TActivity }

constructor TActivity.Create(const ADescription, ADetails: String);
begin
  inherited Create;
  FTickCount := 0;
  FDescription := ADescription;
  FDetails := TStringList.Create;
  FDetails.Delimiter := '|';
  FDetails.QuoteChar := #0;
  FDetails.StrictDelimiter := True;
  AddDetails(ADetails);
end;

destructor TActivity.Destroy;
begin
  FDetails.Free;
end;

function TActivity.Tick: Tick;
begin
  Result := FTickCount;
  Inc(FTickCount);
end;

function TActivity.GetTotalTickCount: Tick;
begin
  Result := FTickCount;
end;

procedure TActivity.AddDetails(const ADetails: String);
begin
  FDetails.Add(FormatDateTime('[c] - ', Now) + ADetails);
end;

procedure TActivity.Accept(AVisitor: IVisitor);
begin
  AVisitor.Visit(Self, TActivity);
end;

function TActivity.GetDetails: String;
begin
  Result := FDetails.DelimitedText;
end;

end.
