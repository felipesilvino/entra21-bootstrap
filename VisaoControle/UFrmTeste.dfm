object FrmTeste: TFrmTeste
  Left = 0
  Top = 0
  Caption = 'Teste'
  ClientHeight = 351
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dbgPilotos: TDBGrid
    Left = 0
    Top = 0
    Width = 650
    Height = 233
    Align = alTop
    Color = clInfoBk
    FixedColor = clGradientInactiveCaption
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgPilotosDrawColumnCell
  end
  object dbgEquipes: TDBGrid
    Left = 0
    Top = 233
    Width = 650
    Height = 77
    Align = alClient
    Color = clInfoBk
    FixedColor = clGradientInactiveCaption
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 310
    Width = 650
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 316
    DesignSize = (
      650
      41)
    object btnMostra: TButton
      Left = 561
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Mostra'
      TabOrder = 0
      OnClick = btnMostraClick
    end
  end
end
