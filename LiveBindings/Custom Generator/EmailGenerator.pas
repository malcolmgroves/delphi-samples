unit EmailGenerator;

// Sample data generator for TPrototypeBindSource or TDataGeneratorAdapter.  To make these generaters available at
// design time, add this unit to a package and install the package.
interface

implementation

uses Data.Bind.ObjectScope, Data.Bind.GenData, Generics.Collections, SysUtils;

type
  TEmailAddressGenerator = class(TDelegateValueGenerator)
  protected
    function CreateDelegate: TValueGeneratorDelegate; override;
  end;

const
  sEmailAddresses = 'EmailAddresses';

const
  CDomainExtensions: array[0..18] of string =
  (
    'com', 'org', 'net', 'mobi', 'info',
    'com.au', 'org.au', 'net.au',
    'com.sg', 'org.sg', 'net.sg',
    'com.cn', 'net.cn', 'gov.cn',
    'co.jp', 'ed.jp',
    'co.uk', 'gov.uk', 'net.uk'
  );

function LoadAddresses: TArray<string>;
  function RandomString(Length : Integer) : string;
  const
    s = 'abcdefghijklmnopqrstuvwxyz';
  var
    I, strLength: Integer;
  begin
    strLength := System.Length(s);
    Result := '';

    for I := 0 to Length do
      Result := Result + s[Random(strLength) + 1];
  end;
var
  LList: TList<string>;
  LAddress : string;
  I: Integer;
begin
  Randomize;
  LList := TList<string>.Create;
  try
    for I := 0 to 200 do
    begin

      LAddress := Format('%s@%s.%s', [RandomString(Random(8) + 3),
                                      RandomString(Random(8) + 3),
                                      CDomainExtensions[Random(18)]]);
      LList.Add(LAddress);
    end;
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;


function TEmailAddressGenerator.CreateDelegate: TValueGeneratorDelegate;
begin
  Result := nil;
  case FieldType of
    ftString:
      Result := TTypedListValueGeneratorDelegate<string>.Create(Options,
          LoadAddresses);
  else
    Assert(False);
  end;
end;

initialization
  RegisterValueGenerator(sEmailAddresses, [ftString],
    TValueGeneratorDescription.Create(TEmailAddressGenerator, 'Email%d', 'EmailGenerator'));
finalization
  UnRegisterValueGenerator(sEmailAddresses, [ftString], '');
end.

