unit UListaVisualizacao;

interface

uses
    DB
  , DBGrids
  , DBClient
  , Provider
  , SqlExpr
  , UOpcaoPesquisa
  ;

type
  TListaVisualizacao = class
  private
    FDataSource     : TDataSource;
    FDataSetProvider: TDataSetProvider;
    FClientDataSet  : TClientDataSet;
    FDBGrid         : TDBGrid;

    function RetornaDataSet(const csSQL: String): TSQLDataSet;
    procedure AjustaCamposString;

  public
    constructor Create(const coDBGrid: TDBGrid);

    procedure CarregaPesquisa(const coOpcaoPesquisa: TOpcaoPesquisa);
    procedure DefineIndice(const csNomeIndice: String);
    procedure DefineTermos(const csTermos: array of const);
    procedure AtualizaPesquisa;

    function RetornaSelecionado(const csNomeCampo: String): Variant;
  end;

implementation

uses
    UDM
  , Forms
  , SysUtils
  , Classes
  ;

const
  CNT_DATA_SET_PROVIDER_NAME = 'dspPesquisa%d';
  CNT_SELECT_ALL             = 'select * from %s';

{ TListaVisualizacao }

constructor TListaVisualizacao.Create(const coDBGrid: TDBGrid);
begin
  FDBGrid := coDBGrid;
end;

procedure TListaVisualizacao.DefineIndice(const csNomeIndice: String);
begin
  FClientDataSet.IndexFieldNames := csNomeIndice;
end;

procedure TListaVisualizacao.DefineTermos(const csTermos: array of const);
begin
  FClientDataSet.FindNearest(csTermos);
  FClientDataSet.GotoNearest;
end;

function TListaVisualizacao.RetornaDataSet(const csSQL: String): TSQLDataSet;
begin
  dmEntra21.SQLSelect.Close;

  //select *
  //  from 'nome da tabela'
  dmEntra21.SQLSelect.CommandText := csSQL;
  dmEntra21.SQLSelect.Open;

  Result := dmEntra21.SQLSelect;
end;

function TListaVisualizacao.RetornaSelecionado(const csNomeCampo: String): Variant;
begin
  Result := FClientDataSet.FieldValues[csNomeCampo];
end;

procedure TListaVisualizacao.AtualizaPesquisa;
begin
  dmEntra21.SQLSelect.Refresh;
  FClientDataSet.Refresh;

  AjustaCamposString;
end;

procedure TListaVisualizacao.CarregaPesquisa(const coOpcaoPesquisa: TOpcaoPesquisa);
var
  DataSetProviderName: String;
begin
  Randomize;
  DataSetProviderName := Format(CNT_DATA_SET_PROVIDER_NAME, [Random(High(Integer))]);

  FDataSetProvider         := TDataSetProvider.Create(Application);
  FDataSetProvider.Name    := DataSetProviderName;
  FDataSetProvider.DataSet := RetornaDataSet(coOpcaoPesquisa.SQL);

  FClientDataSet              := TClientDataSet.Create(Application);
  FClientDataSet.ProviderName := DataSetProviderName;
  FClientDataSet.ReadOnly     := True;
  FClientDataSet.Active       := True;

  FDataSource         := TDataSource.Create(Application);
  FDataSource.DataSet := FClientDataSet;
  FDataSource.Enabled := True;

  FDBGrid.DataSource := FDataSource;

  AjustaCamposString;
end;

procedure TListaVisualizacao.AjustaCamposString;
const
  CNT_ADD = 3;
var
  DS: TDataSet;
  BM: TBookmark;
  I, W, VisibleColumnsCount: Integer;
  A: array of Integer;
  VisibleColumns: array of TColumn;
begin
  DS := FDBGrid.DataSource.DataSet;
  if Assigned(DS) then
  begin
    VisibleColumnsCount := 0;
    SetLength(VisibleColumns, FDBGrid.Columns.Count);
    for I := 0 to FDBGrid.Columns.Count - 1 do
      if Assigned(FDBGrid.Columns[I].Field) and (FDBGrid.Columns[I].Visible) then
      begin
        VisibleColumns[VisibleColumnsCount] := FDBGrid.Columns[I];
        Inc(VisibleColumnsCount);
      end;
    SetLength(VisibleColumns, VisibleColumnsCount);

    DS.DisableControls;
    BM := DS.GetBookmark;
    try
      DS.First;
      SetLength(A, VisibleColumnsCount);
      while not DS.Eof do
      begin
        for I := 0 to VisibleColumnsCount - 1 do
        begin
            W :=  FDBGrid.Canvas.TextWidth(DS.FieldByName(VisibleColumns[I].Field.FieldName).DisplayText);
            if A[I] < W then
               A[I] := W;
        end;
        DS.Next;
      end;

      W := 0;

      for I := 0 to VisibleColumnsCount - 1 do
      begin
        W := FDBGrid.Canvas.TextWidth(VisibleColumns[I].Field.FieldName);
        if A[I] < W then
           A[I] := W;
      end;

      for I := 0 to VisibleColumnsCount - 1 do
        VisibleColumns[I].Width := A[I] + CNT_ADD + W;

      DS.GotoBookmark(BM);

    finally
      DS.FreeBookmark(BM);
      DS.EnableControls;
    end;
  end;
end;

end.
