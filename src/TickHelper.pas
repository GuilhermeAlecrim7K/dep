unit TickHelper;
  
interface
  
uses
  SysUtils, Classes, CustomTypes;

type
  TTickHelper = record helper for Tick
    function InHours: LongWord;
    function InMinutes: LongWord;
    function InSeconds: LongWord;
    function FormatToHHMMSS: String;
  end;

implementation

{ TTickHelper }

function TTickHelper.InHours: LongWord;
begin
  Result := Self div 3600;
end;

function TTickHelper.InMinutes: LongWord;
begin
  Result := Self mod 3600 div 60;
end;

function TTickHelper.InSeconds: LongWord;
begin
  Result := Self mod 3600 mod 60;
end;

function TTickHelper.FormatToHHMMSS: String;
begin
  Result := Format('%d:%2.2d:%2.2d',[Self.InHours, Self.InMinutes, Self.InSeconds]);
end;

end.
