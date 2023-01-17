unit CustomTypes;
  
interface
  
uses
  SysUtils, Classes;

type

  Tick = LongWord;

  TProcOnTick = procedure(AActivityTickCount, ACategoryTickCount: Tick) of object;

  {$SCOPEDENUMS ON}
  TCategories = (Interval, Bug, Feature, Refactoring, Others);
  {$SCOPEDENUMS OFF}

const
  TCategoryNames: array [TCategories] of string =
    ('Pausa', 'Bug', 'Implementação', 'Melhoria', 'Outro');

implementation  
  
end.
