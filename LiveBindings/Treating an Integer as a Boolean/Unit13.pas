unit Unit13;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, Data.DB, Datasnap.DBClient, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, FMX.Layouts, Fmx.Bind.Navigator,
  FMX.Grid, Data.Bind.DBScope;

type
  TForm13 = class(TForm)
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    Grid1: TGrid;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ClientDataSet1IntegerField: TSmallintField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.fmx}

procedure TForm13.FormShow(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;
end;

end.
