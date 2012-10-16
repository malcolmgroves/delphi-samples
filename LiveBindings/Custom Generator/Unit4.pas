unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  Data.Bind.Components, Data.Bind.ObjectScope, EmailGenerator, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Layouts, Fmx.Bind.Navigator,
  Data.Bind.Grid, FMX.Grid, MyCustomExprMethods;

type
  TForm4 = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    Grid1: TGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSource1: TLinkGridToDataSource;
    NavigatorPrototypeBindSource1: TBindNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

end.
