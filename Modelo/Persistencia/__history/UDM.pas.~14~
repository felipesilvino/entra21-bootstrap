unit UDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, FMTBcd
  , UMensagens, DBXFirebird, DBXInterBase
  , DBXCommon
  ;

type
  TdmProway = class(TDataModule)
    SQLConnection: TSQLConnection;
    SQLInsert: TSQLQuery;
    SQLDelete: TSQLQuery;
    SQLUpdate: TSQLQuery;
    SQLSelect: TSQLDataSet;
    SQLTable: TSQLTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    FTransaction: TDBXTransaction;

  public
    procedure AbortaTransacao;
    procedure FinalizaTransacao;
    procedure IniciaTransacao;
    procedure ValidaTransacaoAtiva;

    function TemTransacaoAtiva: Boolean;
  end;

var
  dmProway: TdmProway;

const
  CNT_DATA_BASE = 'Database';

implementation

{$R *.dfm}

uses
    Math
  ;

procedure TdmProway.AbortaTransacao;
begin
  if not TemTransacaoAtiva then
    raise Exception.CreateFmt(STR_NAO_EXISTE_TRANSACAO_ATIVA, [STR_ABORTAR]);

  SQLConnection.RollbackFreeAndNil(FTransaction);
end;

procedure TdmProway.FinalizaTransacao;
begin
  if not TemTransacaoAtiva then
    raise Exception.CreateFmt(STR_NAO_EXISTE_TRANSACAO_ATIVA, [STR_FINALIZAR]);

  SQLConnection.CommitFreeAndNil(FTransaction);
end;

procedure TdmProway.IniciaTransacao;
begin
  if TemTransacaoAtiva then
    raise Exception.Create(STR_JA_EXISTE_TRANSACAO_ATIVA);

  FTransaction := SQLConnection.BeginTransaction;
end;

function TdmProway.TemTransacaoAtiva: Boolean;
begin
  Result := SQLConnection.InTransaction;
end;

procedure TdmProway.DataModuleCreate(Sender: TObject);
begin
  SQLConnection.Connected := True;
  SQLConnection.Open;
end;

procedure TdmProway.ValidaTransacaoAtiva;
begin
  if not TemTransacaoAtiva then
    raise Exception.Create(STR_VALIDA_TRANSACAO_ATIVA);
end;

end.
