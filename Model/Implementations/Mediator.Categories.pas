unit Mediator.Categories;

interface

uses
  SysUtils, Classes, Patterns.Mediator, Generics.Collections, Tickable,
  Vcl.ExtCtrls, CustomTypes, Categories, Patterns.Visitor;

type
  TCategoriesMediator = class(TInterfacedObject, IMediator<TCategories>)
  private
    FTimer: TTimer;
    FCurrentCategoryBeingTicked: ICategory;
    FCategories: TDictionary<TCategories,ICategory>;
    FOnTick: TProcOnTick;
    procedure SetupCategories;
    procedure SetupTimer;
    procedure OnTimer(Sender: TObject);
  public
    constructor Create(OnTick: TProcOnTick);
    destructor Destroy; override;
    procedure Notify(ACategory: TCategories; const ADescription, ADetails: String);
    procedure Accept(AVisitor: IVisitor);
  end;

implementation

uses
  Category;

{ TCategoriesMediator }

constructor TCategoriesMediator.Create(OnTick: TProcOnTick);
begin
  inherited Create;
  FOnTick := OnTick;
  SetupCategories;
  SetupTimer;
end;

destructor TCategoriesMediator.Destroy;
begin
  FTimer.Free;
  FCategories.Free;
  inherited Destroy;
end;

procedure TCategoriesMediator.SetupCategories;
begin
  FCategories := TDictionary<TCategories,ICategory>.Create(5);
  FCategories.Add(TCategories.Interval, TCategory.Create(TCategories.Interval));
  FCategories.Add(TCategories.Bug, TCategory.Create(TCategories.Bug));
  FCategories.Add(TCategories.Feature, TCategory.Create(TCategories.Feature));
  FCategories.Add(TCategories.Refactoring, TCategory.Create(TCategories.Refactoring));
  FCategories.Add(TCategories.Others, TCategory.Create(TCategories.Others));
  FCategories.TrimExcess;
end;

procedure TCategoriesMediator.SetupTimer;
const
  OneSecond = 1000;
begin
  FTimer := TTimer.Create(nil);
  FTimer.Enabled := False;
  FTimer.Interval := OneSecond;
  FTimer.OnTimer := OnTimer;
end;

procedure TCategoriesMediator.OnTimer(Sender: TObject);
begin
  FTimer.Enabled := True;
  FOnTick(FCurrentCategoryBeingTicked.Tick, FCurrentCategoryBeingTicked.GetTotalTickCount);
end;

procedure TCategoriesMediator.Notify(ACategory: TCategories; const ADescription, ADetails: String);
begin
  FCurrentCategoryBeingTicked := FCategories.Items[ACategory];
  FCurrentCategoryBeingTicked.StartNewActivity(ADescription, ADetails);
  FTimer.Enabled := True;
end;

procedure TCategoriesMediator.Accept(AVisitor: IVisitor);
var
  lCategory: ICategory;
begin
  for lCategory in FCategories.Values do
    lCategory.Accept(AVisitor);
end;

end.
