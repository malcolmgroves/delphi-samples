unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts, FMX.ListBox;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses
{$IFDEF MSWINDOWS}
  Winapi.ShlObj, ComObj, Winapi.Windows, FMX.Platform.Win,
{$ELSE}
  Macapi.Foundation, Macapi.CocoaTypes,
{$ENDIF}
  IOUtils;
{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
  function GetDocumentDirectory : string;
{$IFDEF MSWINDOWS}
  var
    szBuffer: array [0..MAX_PATH] of Char;
  begin
    OleCheck (SHGetFolderPath ( FmxHandleToHWND(Handle),
                               CSIDL_MYDOCUMENTS,
                               0,
                               0,
                               szBuffer));
    Result := szBuffer;
{$ELSE}
  var
    FileMgr : NSFileManager;
    URL : NSURL;
    Error : NSError;
  begin
    FileMgr := TNSFileManager.Create;
    URL := FileMgr.URLForDirectory(NSDocumentDirectory,
                                   NSUserDomainMask,
                                   nil,
                                   false,
                                   @Error);
    if Assigned(Error) then
      raise Exception.Create(Error.localizedDescription.UTF8String);

    Result := URL.path.UTF8String;
{$ENDIF}
  end;
var
  DocumentsPath, Filename : String;
begin
  DocumentsPath := GetDocumentDirectory;
  Label1.Text := DocumentsPath;


  for Filename in TDirectory.GetDirectories(DocumentsPath) do
    Listbox1.Items.Add(Format('Folder : %s', [Filename]));

  for Filename in TDirectory.GetFiles(DocumentsPath) do
    Listbox1.Items.Add(Format('File : %s', [Filename]));

end;

end.
