unit UFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FMTBcd, DB, SqlExpr, Grids, DBGrids
  , UEntidade
  , Generics.Collections
  , UOpcaoPesquisa
  , UListaVisualizacao
  ;

type
  TfrmPesquisa = class(TForm)
    pnlBotoes: TPanel;
    btnSair: TBitBtn;
    btnConfirmar: TBitBtn;
    gbParametros: TGroupBox;
    pnlCabecalho: TPanel;
    lbCabecalho: TLabel;
    dbgCliente: TDBGrid;
    edPesquisa: TEdit;
    lbOpcao: TLabel;
    lbIgualA: TLabel;
    cbOpcoes: TComboBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgClienteDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbOpcoesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FRetorno          : Variant;
    FOpcaoPesquisa    : TOpcaoPesquisa;
    FListaVisualizacao: TListaVisualizacao;

  public
    class function MostrarPesquisa(const coOpcaoPesquisa: TOpcaoPesquisa): Variant;
    procedure Inicializa;

    property Retorno      : Variant        read FRetorno;
    property OpcaoPesquisa: TOpcaoPesquisa read FOpcaoPesquisa write FOpcaoPesquisa;
  end;

implementation

{$R *.dfm}

uses
    UDM
  ;

{ TfrmPesquisa }

class function TfrmPesquisa.MostrarPesquisa(const coOpcaoPesquisa: TOpcaoPesquisa): Variant;
var
  frmPesquisa: TfrmPesquisa;
begin
  frmPesquisa := TfrmPesquisa.Create(Application);
  try
    frmPesquisa.OpcaoPesquisa := coOpcaoPesquisa;
    frmPesquisa.Inicializa;

    if frmPesquisa.ShowModal = mrOk then
      Result := frmPesquisa.Retorno
    else
      Result := '0';
  finally
    FreeAndNil(frmPesquisa);
  end;
end;

procedure TfrmPesquisa.Inicializa;
begin
  Caption             := Caption + ' - ' + FOpcaoPesquisa.NOME_PESQUISA;
  lbCabecalho.Caption := AnsiUpperCase(lbCabecalho.Caption + ' - ' + FOpcaoPesquisa.NOME_PESQUISA);

  FListaVisualizacao.CarregaPesquisa(FOpcaoPesquisa);

  FRetorno := 0;
end;

procedure TfrmPesquisa.btnConfirmarClick(Sender: TObject);
begin
  FRetorno := FListaVisualizacao.RetornaSelecionado(FOpcaoPesquisa.NOME_CAMPO_RETORNO);
end;

procedure TfrmPesquisa.dbgClienteDblClick(Sender: TObject);
begin
  FRetorno    := FListaVisualizacao.RetornaSelecionado(FOpcaoPesquisa.NOME_CAMPO_RETORNO);
  ModalResult := mrOk;
end;

procedure TfrmPesquisa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisa.cbOpcoesChange(Sender: TObject);
begin
  FListaVisualizacao.DefineIndice(cbOpcoes.Text)
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  FListaVisualizacao := TListaVisualizacao.Create(dbgCliente);
end;

procedure TfrmPesquisa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaVisualizacao);
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
var
  lsCampo: String;
begin
  for lsCampo in FOpcaoPesquisa.FILTROS do
    cbOpcoes.Items.Add(lsCampo);

  cbOpcoes.ItemIndex := 0;

  FListaVisualizacao.DefineIndice(cbOpcoes.Text);
  FListaVisualizacao.DefineTermos([edPesquisa.Text]);
end;

procedure TfrmPesquisa.edPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FListaVisualizacao.DefineTermos([edPesquisa.Text]);
end;

procedure TfrmPesquisa.dbgClienteKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        FRetorno    := FListaVisualizacao.RetornaSelecionado(FOpcaoPesquisa.NOME_CAMPO_RETORNO);
        ModalResult := mrOk;
      end;
    VK_ESCAPE: ModalResult := mrCancel;
  end;    
end;

end.
