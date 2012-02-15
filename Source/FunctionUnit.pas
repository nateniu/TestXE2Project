unit FunctionUnit;

interface
uses
  SysUtils;

 function ConcateName(FirstName, LastName: PChar): Integer; stdcall;
implementation
  function ConcateName(FirstName, LastName: PChar): Integer;
  var
    Name: String;
  begin
    Name := String(FirstName) + String(LastName);
    result := StrToIntDef(Name,0);
  end;
end.


