unit CurrencyToStrMethod;

interface

implementation
uses System.Bindings.Methods, System.SysUtils, MethodUtils;

const
  sIDCurrencyToStr = 'CurrencyToStr';
  sIDStrToCurrency = 'StrToCurrency';

procedure RegisterMethods;
begin
  TMethodUtils.RegisterMethod<Currency, string>(sIDCurrencyToStr,
    function(AValue: Currency): string
    begin
      Result := CurrToStrF(AValue, ffCurrency, 2);
    end);

  TMethodUtils.RegisterMethod<string, Currency>(sIDStrToCurrency,
    function(AValue: string): Currency
    var
      C: char;
      LDigits: string;
    begin
      for C in AValue do
        case C of
         '0'..'9',
         '.':
           LDigits := LDigits + C;
        end;
      Result := StrToCurr(LDigits)
    end);
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sIDCurrencyToStr);
  TBindingMethodsFactory.UnRegisterMethod(sIDStrToCurrency);
end;

initialization
  RegisterMethods;
finalization
  UnregisterMethods;
end.
