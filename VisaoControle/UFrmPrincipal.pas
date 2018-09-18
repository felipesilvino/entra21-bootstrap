unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miSair: TMenuItem;
    miCadastro: TMenuItem;
    miUsuario: TMenuItem;
    miTemas: TMenuItem;
    miLogoff: TMenuItem;
    miEncerrarAplicacao: TMenuItem;
    sbPrincipal: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure miUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miLogoffClick(Sender: TObject);
    procedure miEncerrarAplicacaoClick(Sender: TObject);
  private
    procedure miStyleMenuItemClick(Sender: TObject);
    procedure AtualizaUsuarioLogado;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UDM
  , DB
  , UFrmCadastroUsuario
  , Vcl.Themes
  , UUsuarioLogado
  , UFrmLogin
  ;

{$R *.dfm}

procedure TFrmPrincipal.miEncerrarAplicacaoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.miLogoffClick(Sender: TObject);
begin
  TUsuarioLogado.Logoff;
  Application.CreateForm(TFrmLogin, FrmLogin);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      AtualizaUsuarioLogado;
    end
  else
    Close;
end;

procedure TFrmPrincipal.miUsuarioClick(Sender: TObject);
begin
  TFrmCadastroUsuario.Create(Self);
end;

procedure TFrmPrincipal.miStyleMenuItemClick(Sender: TObject);
begin
  TStyleManager.SetStyle(TMenuItem(Sender).Hint);
end;

procedure TFrmPrincipal.AtualizaUsuarioLogado;
begin
  sbPrincipal.Panels[1].Text :=
    'Usuário: ' + TUsuarioLogado.USUARIO.NOME;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  StyleName: String;
  miStyleMenuItem: TMenuItem;
begin
  for StyleName in TStyleManager.StyleNames do
    begin
      miStyleMenuItem         := mmPrincipal.CreateMenuItem;
      miStyleMenuItem.Caption := StyleName;
      miStyleMenuItem.Hint    := StyleName;
      miStyleMenuItem.OnClick := miStyleMenuItemClick;

      miTemas.Add(miStyleMenuItem);
    end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];

  AtualizaUsuarioLogado;
end;

end.
