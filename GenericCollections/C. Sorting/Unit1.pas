unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Generics.Collections, StdCtrls, Generics.Defaults;

type
  TPerson = class
  private
    FFirstname: string;
    FLastname: string;
    FAge: Integer;
  public
    function ToString: string; override;
    property Firstname: string read FFirstname write FFirstname;
    property Lastname: string read FLastname write FLastname;
    property Age: Integer read FAge write FAge;
    constructor Create(const Firstname, Lastname : string; Age : Integer); virtual;
  end;

  TPersonComparer = class(TInterfacedObject, IComparer<TPerson>)
  public
    function Compare(const Left, Right: TPerson): Integer;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FPersonList : TObjectList<TPerson>;
    procedure LoadListbox;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LoadListbox;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FPersonList.Sort(TPersonComparer.Create);

  LoadListbox;
end;

procedure TForm1.LoadListbox;
var
  Person: TPerson;
begin
  ListBox1.Clear;
  for Person in FPersonList do
    ListBox1.Items.Add(Person.ToString);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPersonList := TObjectList<TPerson>.Create(True);

  FPersonList.Add(TPerson.Create('Fred', 'Flintstone', 40));
  FPersonList.Add(TPerson.Create('Wilma', 'Flintstone', 38));
  FPersonList.Add(TPerson.Create('Pebbles', 'Flintstone', 1));
  FPersonList.Add(TPerson.Create('Barney', 'Rubble', 38));
  FPersonList.Add(TPerson.Create('Betty', 'Rubble', 40));
  FPersonList.Add(TPerson.Create('Bam Bam', 'Rubble', 2));
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  FPersonList.Free;
end;

{ TPerson }

constructor TPerson.Create(const Firstname, Lastname : string; Age : Integer);
begin
  self.Lastname := Lastname;
  self.Firstname := Firstname;
  self.Age := Age;
end;

function TPerson.ToString: string;
begin
  Result := Format('%s %s : Age %d', [Firstname, Lastname, Age]);
end;


{ TPersonComparer }

function TPersonComparer.Compare(const Left, Right: TPerson): Integer;
begin
  Result := CompareText(Left.Lastname + Left.Firstname, Right.Lastname + Right.Firstname);
end;

end.
