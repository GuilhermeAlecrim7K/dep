unit Activities;
  
interface
  
uses
  SysUtils, Classes, Tickable;

type
  IActivity = interface(ITickable)
  ['{8588162F-1AFD-4A29-B1D9-BC60A54BB286}']
    procedure AddDetails(const ADetails: String);
  end;
  
implementation
  

  
end.
