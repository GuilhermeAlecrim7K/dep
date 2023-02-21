object frmMain: TfrmMain
  Left = 441
  Top = 251
  Caption = 'DEP'
  ClientHeight = 191
  ClientWidth = 427
  Color = clBtnFace
  Constraints.MaxHeight = 250
  Constraints.MaxWidth = 443
  Constraints.MinHeight = 250
  Constraints.MinWidth = 443
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = mmnMain
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblDate: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 417
    Height = 13
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Domingo, 1 de Janeiro de 2000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 174
  end
  object lblCurActivityDescription: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 90
    Width = 417
    Height = 19
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Atividade atual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto Cn'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 101
  end
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 26
    Width = 421
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object spdbtnOutro: TSpeedButton
      Left = 315
      Top = 0
      Width = 105
      Height = 31
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Outro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Cn'
      Font.Style = []
      ParentFont = False
      OnClick = spdbtnOutroClick
      ExplicitLeft = 321
      ExplicitTop = 3
      ExplicitHeight = 45
    end
    object spdbtnMelhoria: TSpeedButton
      Left = 210
      Top = 0
      Width = 105
      Height = 31
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Melhoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Cn'
      Font.Style = []
      ParentFont = False
      OnClick = spdbtnMelhoriaClick
      ExplicitLeft = 8
      ExplicitHeight = 45
    end
    object spdbtnImplementacao: TSpeedButton
      Left = 105
      Top = 0
      Width = 105
      Height = 31
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Implementa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Cn'
      Font.Style = []
      ParentFont = False
      OnClick = spdbtnImplementacaoClick
      ExplicitLeft = 8
      ExplicitHeight = 45
    end
    object spdbtnBug: TSpeedButton
      Left = 0
      Top = 0
      Width = 105
      Height = 31
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Bug'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Cn'
      Font.Style = []
      ParentFont = False
      OnClick = spdbtnBugClick
      ExplicitLeft = -6
      ExplicitHeight = 45
    end
  end
  object pnlTimer: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 117
    Width = 421
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblCurActivityElapsedTime: TLabel
      Left = 0
      Top = 0
      Width = 421
      Height = 52
      Align = alClient
      Alignment = taCenter
      Caption = '0:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -45
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 175
    end
  end
  object pnlTotalElapsedTimeTracker: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 421
    Height = 19
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblOutroTracker: TLabel
      Left = 315
      Top = 0
      Width = 105
      Height = 19
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 6
      ExplicitHeight = 13
    end
    object lblMelhoriaTracker: TLabel
      Left = 210
      Top = 0
      Width = 105
      Height = 19
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 8
    end
    object lblImplementacaoTracker: TLabel
      Left = 105
      Top = 0
      Width = 105
      Height = 19
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 8
    end
    object lblBugTracker: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 19
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = -6
    end
  end
  object bitbtnExit: TBitBtn
    Left = 0
    Top = 166
    Width = 427
    Height = 25
    Align = alBottom
    Caption = '&Salvar e Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object mmnMain: TMainMenu
    Left = 296
    Top = 16
    object mniSettings: TMenuItem
      Caption = 'Configura'#231#245'es'
      object mniFilesPath: TMenuItem
        Caption = 'Caminho padr'#227'o para salvar arquivos'
        OnClick = mniFilesPathClick
      end
    end
  end
end
