object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 290
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    532
    290)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'List People'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 39
    Width = 516
    Height = 243
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sort'
    TabOrder = 2
    OnClick = Button2Click
  end
  object edtFirstname: TEdit
    Left = 170
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtLastname: TEdit
    Left = 297
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Button3: TButton
    Left = 424
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 5
    OnClick = Button3Click
  end
end
