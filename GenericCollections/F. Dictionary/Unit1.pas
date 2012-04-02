unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Generics.Collections;

type
  TForm1 = class(TForm)
    lbxDefinitions: TListBox;
    edtPhrase: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtPhraseChange(Sender: TObject);
  private
    { Private declarations }
    FAussieDictionary : TObjectDictionary<String, TList<String>>;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  Generics.Defaults;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Definition: String;
begin
  if FAussieDictionary.ContainsKey(edtPhrase.Text) then
    for Definition in FAussieDictionary.Items[edtPhrase.Text] do
      lbxDefinitions.Items.Add(Definition);
end;

procedure TForm1.edtPhraseChange(Sender: TObject);
begin
  if lbxDefinitions.Count > 0 then
    lbxDefinitions.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  DefinitionList : TList<String>;
begin
  FAussieDictionary := TObjectDictionary<String, TList<String>>.Create([doOwnsValues]);

{$REGION 'Load Dictionary'}
    DefinitionList := TList<String>.Create;
    DefinitionList.Add('a very long way away');
    FAussieDictionary.Add('Back of Bourke', DefinitionList);

    DefinitionList := TList<String>.Create;
    DefinitionList.Add('lazy person');
    DefinitionList.Add('layabout');
    DefinitionList.Add('somebody who always relies on other people to do things or lend him things');
    FAussieDictionary.Add('Bludger', DefinitionList);

    DefinitionList := TList<String>.Create;
    DefinitionList.Add('Bottle of wine without a label');
    DefinitionList.Add('cattle that have not been branded, earmarked or castrated.');
    FAussieDictionary.Add('Cleanskin', DefinitionList);

    DefinitionList := TList<String>.Create;
    DefinitionList.Add('farmer');
    DefinitionList.Add('cockatoo');
    DefinitionList.Add('cockroach');
    FAussieDictionary.Add('Cockie', DefinitionList);

    DefinitionList := TList<String>.Create;
    DefinitionList.Add('pack, equipment');
    DefinitionList.Add('traffic ticket');
    DefinitionList.Add('redhead');
    DefinitionList.Add('blue cattle dog');
    DefinitionList.Add('heavy wool or felt jacket worn by mining and construction workers');
    DefinitionList.Add('bluebottle jellyfish');
    FAussieDictionary.Add('Bluey', DefinitionList);

{$ENDREGION}


end;

end.
