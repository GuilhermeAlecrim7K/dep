object frmActivityDetails: TfrmActivityDetails
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Atividade a ser desempenhada:'
  ClientHeight = 211
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDetails: TLabel
    Left = 8
    Top = 59
    Width = 46
    Height = 13
    Caption = 'Detalhes:'
  end
  object lblDescription: TLabel
    Left = 8
    Top = 16
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object memDetails: TMemo
    Left = 8
    Top = 78
    Width = 344
    Height = 89
    TabOrder = 1
  end
  object bitbtnConfirm: TBitBtn
    Left = 88
    Top = 178
    Width = 75
    Height = 25
    Caption = '&Ok'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object bitbtnCancel: TBitBtn
    Left = 184
    Top = 178
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object cbxDescription: TComboBox
    Left = 8
    Top = 32
    Width = 345
    Height = 21
    Style = csSimple
    DropDownCount = 15
    MaxLength = 32
    TabOrder = 0
    TextHint = 'Ex: [Standup][Reuni'#227'o com Gestor][CH202301011254]'
  end
end
