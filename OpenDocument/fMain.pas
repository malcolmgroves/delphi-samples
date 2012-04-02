unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses
  Macapi.Foundation, Macapi.AppKit;

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  Workspace : NSWorkspace;
begin
  if OpenDialog1.Execute then
  begin
    Label1.Text := OpenDialog1.FileName;
    Workspace := TNSWorkspace.Create;
    Workspace.openFile(NSSTR(Label1.Text));
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  URL : NSURL;
  Workspace : NSWorkspace;
begin
    URL := TNSURL.Create;
    URL.initWithString(NSSTR('mailto:fred@flintstones.com?subject=Hello&body=Hello%20Fred'));

    Workspace := TNSWorkspace.Create;
    Workspace.openURL(URL);
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  URL : NSURL;
  Workspace : NSWorkspace;
begin
    URL := TNSURL.Create;
    URL.initWithString(NSSTR('http://www.malcolmgroves.com'));

    Workspace := TNSWorkspace.Create;
    Workspace.openURL(URL);
end;

end.
