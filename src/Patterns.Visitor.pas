unit Patterns.Visitor;

interface

uses
  SysUtils, Classes;

type
  IVisitor = interface
  ['{189C3009-D14F-476A-ACAB-6915D56CE0AD}']
    procedure Visit(AVisitable: TObject; AClass: TClass);
  end;

  IVisitable = interface
    procedure Accept(AVisitor: IVisitor);
  end;

implementation



end.
