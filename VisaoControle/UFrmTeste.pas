unit UFrmTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs
  , UListaVisualizacao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls
  ;

type
  TFrmTeste = class(TForm)
    dbgPilotos: TDBGrid;
    dbgEquipes: TDBGrid;
    pnlBotoes: TPanel;
    btnMostra: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnMostraClick(Sender: TObject);
    procedure dbgPilotosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FListaPilotos: TListaVisualizacao;
    FListaEquipes: TListaVisualizacao;
  end;

var
  FrmTeste: TFrmTeste;

implementation

{$R *.dfm}

uses
    UOpcaoPesquisa
  , UFrmPesquisa
  ;

procedure TFrmTeste.btnMostraClick(Sender: TObject);
begin
  ShowMessage(Format('Piloto: %s'
                   +  #13#10
                   + 'Equipe: %s',
                     [FListaPilotos.RetornaSelecionado('Nome')
                    , FListaEquipes.RetornaSelecionado('Nome')]));
end;

procedure TFrmTeste.dbgPilotosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dbgPilotos.DataSource.DataSet.FieldByName('País').AsString = 'Brasil' then
  begin
    dbgPilotos.Canvas.Brush.Color := $00A4FBAE;
    dbgPilotos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmTeste.FormCreate(Sender: TObject);
begin
  inherited;

  FListaPilotos := TListaVisualizacao.Create(dbgPilotos);
  FListaPilotos.CarregaPesquisa(TOpcaoPesquisa.Create
    .DefineVisao('VW_PILOTO'));

  FListaEquipes := TListaVisualizacao.Create(dbgEquipes);
  FListaEquipes.CarregaPesquisa(TOpcaoPesquisa.Create
    .DefineVisao('VW_EQUIPE'));
end;

procedure TFrmTeste.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaPilotos);
  FreeAndNil(FListaEquipes);
end;

end.
