object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 560
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    575
    560)
  PixelsPerInch = 96
  TextHeight = 13
  object lbxDefinitions: TListBox
    Left = 8
    Top = 40
    Width = 559
    Height = 512
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object edtPhrase: TEdit
    Left = 8
    Top = 13
    Width = 478
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = edtPhraseChange
  end
  object Button1: TButton
    Left = 492
    Top = 11
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 2
    OnClick = Button1Click
  end
end
