unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, contnrs, StdCtrls;

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

  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FPersonList : TList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  ListBox1.Clear;

  for i := 0 to FPersonList.Count - 1 do
    if FPersonList.Items[i] <> nil then
      if TObject(FPersonList.Items[i]) is TPerson then
        ListBox1.Items.Add(TPerson(FPersonList.Items[i]).ToString);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPersonList := TList.Create;

  FPersonList.Add(TPerson.Create('Fred', 'Flintstone', 40));
  FPersonList.Add(TPerson.Create('Wilma', 'Flintstone', 38));
  FPersonList.Add(TPerson.Create('Pebbles', 'Flintstone', 1));
  FPersonList.Add(TPerson.Create('Barney', 'Rubble', 38));
  FPersonList.Add(TPerson.Create('Betty', 'Rubble', 40));
  FPersonList.Add(TPerson.Create('Bam Bam', 'Rubble', 2));
end;


procedure TForm1.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := FPersonList.Count - 1 downto 0 do
    if FPersonList.Items[i] <> nil then
    begin
      TObject(FPersonList.Items[i]).Free;
      FPersonList.Delete(i);
    end;
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


end.
