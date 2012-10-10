unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  Data.Bind.GenData, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, CurrencyToStrMethod, Fmx.Bind.DBEngExt,
  Data.Bind.Components, FMX.Layouts, Fmx.Bind.Navigator, FMX.Edit,
  Data.Bind.ObjectScope, FMX.Grid, Fmx.Bind.Grid, Data.Bind.Grid;

type
  TForm5 = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    EditAmount: TEdit;
    Label1: TLabel;
    LinkControlToField1: TLinkControlToField;
    BindingsList1: TBindingsList;
    NavigatorPrototypeBindSource1: TBindNavigator;
    Label2: TLabel;
    LinkPropertyToField1: TLinkPropertyToField;
    Grid1: TGrid;
    LinkGridToDataSource1: TLinkGridToDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

end.
