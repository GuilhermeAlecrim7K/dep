unit Tickable;

interface

uses
  SysUtils, Classes, CustomTypes, Generics.Collections, Patterns.Visitor;

type

  ITickable = interface(IVisitable)
  ['{EED058F7-DAA2-495A-8A58-07BECF2279A0}']
    function Tick: Tick;
    function GetTotalTickCount: Tick;
  end;

implementation

end.
