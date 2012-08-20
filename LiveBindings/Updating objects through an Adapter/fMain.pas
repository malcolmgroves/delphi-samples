unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  Data.Bind.GenData, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.Edit,
  Data.Bind.Grid, FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.ObjectScope;

type
  TPerson = class
  private
    FAge: Integer;
    FLastname: string;
    FFirstname: string;
  public
    constructor Create(const Firstname, Lastname : string; Age : Integer);
    property Firstname : string read FFirstname write FFirstname;
    property Lastname : string read FLastname write FLastname;
    property Age : Integer read FAge write FAge;
  end;

  TForm1 = class(TForm)
    AdapterBindSource1: TAdapterBindSource;
    DataGeneratorAdapter1: TDataGeneratorAdapter;
    NavigatorAdapterBindSource1: TBindNavigator;
    LinkGridToDataSource1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    EditFirstname: TEdit;
    Label1: TLabel;
    LinkControlToField1: TLinkControlToField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    EditLastname: TEdit;
    Label2: TLabel;
    LinkControlToField4: TLinkControlToField;
    EditAge: TEdit;
    Label3: TLabel;
    LinkControlToField5: TLinkControlToField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    GroupBox3: TGroupBox;
    lblObjectFirstname: TLabel;
    lblObjectLastname: TLabel;
    lblObjectAge: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblAdapterFirstname: TLabel;
    lblAdapterLastname: TLabel;
    lblAdapterAge: TLabel;
    procedure AdapterBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FPerson : TPerson;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

constructor TPerson.Create(const Firstname, Lastname: string; Age : Integer);
begin
  FFirstname := Firstname;
  FLastname := Lastname;
  FAge := Age;
end;



procedure TForm1.AdapterBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  FPerson := TPerson.Create('Fred', 'Flintstone', 42);
  ABindSourceAdapter := TObjectBindSourceAdapter<TPerson>.Create(AdapterBindSource1,
                                                                 FPerson);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Adapter : TBindSourceAdapter;
begin
  lblObjectFirstname.Text := FPerson.Firstname;
  lblObjectLastname.Text := FPerson.Lastname;
  lblObjectAge.Text := IntToStr(FPerson.Age);

  Adapter := AdapterBindSource1.InternalAdapter;
  lblAdapterFirstname.Text := Adapter.FindField('Firstname').GetTValue.ToString;
  lblAdapterLastname.Text := Adapter.FindField('Lastname').GetTValue.ToString;
  lblAdapterAge.Text := Adapter.FindField('Age').GetTValue.ToString;
end;

end.
