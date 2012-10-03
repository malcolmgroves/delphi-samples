unit CurrencyToStrMethod;

interface

implementation
uses System.Bindings.Methods, System.SysUtils, System.Bindings.EvalProtocol,
     System.Bindings.Consts;

function CurrencyToStr(Value : Currency) : string;
begin
  Result := CurrToStrF(Value, ffCurrency, 2);
end;

function MakeMethodCurrencyToStr: IInvokable;
begin
  Result := MakeInvokable(function(Args: TArray<IValue>): IValue
  var
    v: IValue;
  begin
    if Length(Args) <> 1 then
      raise EEvaluatorError.Create(Format(sUnexpectedArgCount, [1, Length(Args)]));
    v := Args[0];
    if v.GetValue.IsEmpty then
      Exit(TValueWrapper.Create(nil))
    else
      Exit(TValueWrapper.Create(CurrencyToStr(v.GetValue.AsCurrency)));
  end);
end;


const
  sIDCurrencyToStr = 'CurrencyToStr';

procedure RegisterMethods;
begin
  TBindingMethodsFactory.RegisterMethod(
    TMethodDescription.Create(
      MakeMethodCurrencyToStr, // IInvokable for the custom method
      sIDCurrencyToStr, // ID of the method
      sIDCurrencyToStr, // method name
      'CurrencyToStrMethod', // unit name
      True, // enabled by default
      'Format Currency String based on default regional settings', // description
      nil
    )
  );
end;

procedure UnregisterMethods;
begin
  TBindingMethodsFactory.UnRegisterMethod(sIDCurrencyToStr);
end;


initialization
  RegisterMethods;
finalization
  UnregisterMethods;


end.
