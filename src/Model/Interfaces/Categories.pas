unit Categories;
  
interface
  
uses
  SysUtils, Classes, Tickable;

type

  ICategory = interface(ITickable)
  ['{BFF9DAA1-5B91-431F-8B4E-C73D2E7BFFBC}']
    procedure StartNewActivity(const ADescription, ADetails: String);
  end;
  
implementation
  

  
end.
