unit Category;
  
interface
  
uses
  SysUtils, Classes, Generics.Collections, Categories, Activities, Patterns.Visitor, CustomTypes;

type
  TCategory = class(TInterfacedObject, ICategory)
  private
    FCategory: TCategories;
    FTotalTickCount: Tick;
    FActivities: TDictionary<String,IActivity>;
    FCurActivity: IActivity;
    procedure CreateNewActivity(const ADescription, ADetails: String);
    procedure UpdateActivity(const ADescription, ADetails: String);
    function GetCategoryName: String;
  public
    constructor Create(ACategory: TCategories);
    destructor Destroy; override;
    procedure StartNewActivity(const ADescription, ADetails: String);
    function Tick: Tick;
    function GetTotalTickCount: Tick;
    procedure Accept(AVisitor: IVisitor);
  published
    property CategoryName: String read GetCategoryName;
  end;
  
implementation

uses
  Activity;

{ TCategory }

constructor TCategory.Create(ACategory: TCategories);
begin
  inherited Create;
  FCategory := ACategory;
  FTotalTickCount := 0;
  FActivities := TDictionary<String,IActivity>.Create;
end;

destructor TCategory.Destroy;
begin
  FActivities.Free;
end;

procedure TCategory.StartNewActivity(const ADescription, ADetails: String);
begin
  if FActivities.ContainsKey(AnsiUpperCase(ADescription)) then
    UpdateActivity(ADescription, ADetails)
  else
    CreateNewActivity(ADescription, ADetails);
  FCurActivity := FActivities.Items[AnsiUpperCase(ADescription)];
end;

procedure TCategory.CreateNewActivity(const ADescription, ADetails: String);
begin
  FActivities.Add(AnsiUpperCase(ADescription), TActivity.Create(ADescription, ADetails));
end;

procedure TCategory.UpdateActivity(const ADescription, ADetails: String);
begin
  FActivities.Items[AnsiUpperCase(ADescription)].AddDetails(ADetails);
end;

function TCategory.Tick: Tick;
begin
  Inc(FTotalTickCount);
  Result := FCurActivity.Tick;
end;

function TCategory.GetTotalTickCount: Tick;
begin
  Result := FTotalTickCount;
end;

procedure TCategory.Accept(AVisitor: IVisitor);
var
  lActivity: IActivity;
begin
  AVisitor.Visit(Self, TCategory);
  for lActivity in FActivities.Values do
    lActivity.Accept(AVisitor);
end;

function TCategory.GetCategoryName;
begin
  Result := TCategoryNames[FCategory];
end;
  
end.
