object FrmPrincipal: TFrmPrincipal
  Left = 245
  Top = 191
  Caption = 'Bootstrap'
  ClientHeight = 345
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 326
    Width = 693
    Height = 19
    Panels = <
      item
        Text = 'Banco de Dados:'
        Width = 400
      end
      item
        Text = 'Usu'#225'rio:'
        Width = 50
      end>
    ExplicitTop = 271
    ExplicitWidth = 574
  end
  object mmPrincipal: TMainMenu
    Left = 640
    Top = 8
    object miCadastro: TMenuItem
      Caption = 'Cadastro'
      object miUsuario: TMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = miUsuarioClick
      end
    end
    object miTemas: TMenuItem
      Caption = 'Temas'
    end
    object miSair: TMenuItem
      Caption = '&Sair'
      object miLogoff: TMenuItem
        Caption = 'Logoff'
        OnClick = miLogoffClick
      end
      object miEncerrarAplicacao: TMenuItem
        Caption = 'Encerrar Aplica'#231#227'o'
        OnClick = miEncerrarAplicacaoClick
      end
    end
  end
end
