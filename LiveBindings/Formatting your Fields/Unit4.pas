unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Bindings.Outputs, Fmx.Bind.Editors, Fmx.Bind.Grid, Data.Bind.Grid,
  FMX.Layouts, FMX.Grid, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Edit,
  MyCustomExprMethods, Fmx.Bind.Navigator;

type
  TForm4 = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    Label1: TLabel;
    BindingsList1: TBindingsList;
    LinkPropertyToField1: TLinkPropertyToField;
    Grid1: TGrid;
    LinkGridToDataSource1: TLinkGridToDataSource;
    EditFamilyName: TEdit;
    Label2: TLabel;
    LinkControlToField1: TLinkControlToField;
    EditLastname: TEdit;
    Label3: TLabel;
    LinkControlToField2: TLinkControlToField;
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
