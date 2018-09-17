unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miSair: TMenuItem;
    sbPrincipal: TStatusBar;
    miCadastro: TMenuItem;
    miUsuario: TMenuItem;
    miTemas: TMenuItem;
    procedure miSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure mmStyleMenuItemClick(Sender: TObject);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UDM
  , DB
  , UFrmCadastroUsuario
  , Vcl.Themes
  ;

{$R *.dfm}

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.miUsuarioClick(Sender: TObject);
begin
  TFrmCadastroUsuario.Create(Self);
end;

procedure TFrmPrincipal.mmStyleMenuItemClick(Sender: TObject);
begin
  TStyleManager.SetStyle(TMenuItem(Sender).Hint);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  StyleName: String;
  MenuItem: TMenuItem;
begin
  for StyleName in TStyleManager.StyleNames do
    begin
      MenuItem         := mmPrincipal.CreateMenuItem;
      MenuItem.Caption := StyleName;
      MenuItem.Hint    := StyleName;
      MenuItem.OnClick := mmStyleMenuItemClick;

      miTemas.Add(MenuItem);
    end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

end.
