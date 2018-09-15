inherited FrmCadastroUsuario: TFrmCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 348
  ClientWidth = 591
  ExplicitWidth = 607
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 591
    ExplicitWidth = 591
  end
  inherited gbLocalizar: TGroupBox
    Width = 591
    ExplicitWidth = 591
    inherited lbCodigo: TLabel
      Left = 68
      ExplicitLeft = 68
    end
  end
  inherited pnlBotoes: TPanel
    Top = 307
    Width = 591
    TabOrder = 3
    ExplicitTop = 307
    ExplicitWidth = 591
    inherited btnLimpar: TBitBtn
      Left = 356
      ExplicitLeft = 356
    end
    inherited btnExcluir: TBitBtn
      Left = 239
      ExplicitLeft = 239
    end
    inherited btnGravar: TBitBtn
      Left = 122
      ExplicitLeft = 122
    end
    inherited btnSair: TBitBtn
      Left = 473
      ExplicitLeft = 473
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 591
    Height = 221
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object edNome: TLabeledEdit
      Left = 104
      Top = 24
      Width = 369
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome*'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      MaxLength = 60
      ParentFont = False
      TabOrder = 0
    end
    object edLogin: TLabeledEdit
      Left = 104
      Top = 49
      Width = 121
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Login*'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 1
    end
    object edSenha: TLabeledEdit
      Left = 104
      Top = 99
      Width = 121
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha*'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      OnExit = VerificaSenhaExit
    end
    object edConfirmacaoSenha: TLabeledEdit
      Left = 352
      Top = 96
      Width = 121
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = 'Confirmacao Senha*'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 4
      OnExit = VerificaSenhaExit
    end
    object edSenhaAtual: TLabeledEdit
      Left = 104
      Top = 74
      Width = 121
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha Atual*'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  inherited pmOpcoes: TPopupMenu
    Left = 536
    Top = 24
  end
end
