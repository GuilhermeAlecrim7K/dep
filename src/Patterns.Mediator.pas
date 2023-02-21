unit Patterns.Mediator;

interface

uses
  SysUtils, Classes, Generics.Collections;

type

  IMediator<T> = interface
  ['{82DECF74-45A1-44A5-A0B0-B0DC3391223C}']
    procedure Notify(AIdentifier: T; const ADescription, ADetails: String);
  end;

implementation

end.
