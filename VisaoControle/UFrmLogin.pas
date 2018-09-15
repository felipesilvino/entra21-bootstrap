unit UFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFrmLogin = class(TForm)
    pnlCabecalho: TPanel;
    pnlBotoes: TPanel;
    btnEntrar: TBitBtn;
    btnCancelar: TBitBtn;
    lbCabecalho: TLabel;
    pnlLogin: TPanel;
    edSenha: TLabeledEdit;
    edLogin: TLabeledEdit;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
    UUsuarioLogado
  , UDialogo
  ;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  CloseModal;
end;

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
  try
    TUsuarioLogado.Unico.RealizaLogin(edLogin.Text, edSenha.Text);

    ModalResult := mrYes;
    CloseModal;
  except
    on E: Exception do
      TDialogo.Excecao(E);
  end;
end;

procedure TFrmLogin.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnEntrar.Click;
end;

end.
