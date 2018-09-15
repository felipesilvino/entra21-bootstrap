unit URepositorioUsuario;

interface

uses
    UUsuario
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioUsuario = class(TRepositorioDB<TUSUARIO>)
  public
    constructor Create;

    procedure AtribuiDBParaEntidade(const coUSUARIO: TUSUARIO); override;
    procedure AtribuiEntidadeParaDB(const coUSUARIO: TUSUARIO;
                                    const coSQLQuery: TSQLQuery); override;

    function RetornaPeloLogin(const csLogin: String): TUSUARIO;
  end;

implementation

uses
    UDM
  , UUtilitarios
  , SysUtils
  ;

const
  CNT_SELECT_PELO_LOGIN = 'select * from usuario where login = :login';

{ TRepositorioUsuario }

constructor TRepositorioUsuario.Create;
begin
  Inherited Create(TUSUARIO, TBL_USUARIO, FLD_ENTIDADE_ID, STR_USUARIO);
end;

function TRepositorioUsuario.RetornaPeloLogin(const csLogin: String): TUSUARIO;
begin
  FSQLSelect.Close;
  FSQLSelect.CommandText := CNT_SELECT_PELO_LOGIN;
  FSQLSelect.Prepared    := True;
  FSQLSelect.ParamByName(FLD_USUARIO_LOGIN).AsString := csLogin;
  FSQLSelect.Open;

  Result := nil;
  if not FSQLSelect.Eof then
    begin
      Result := TUSUARIO.Create;
      AtribuiDBParaEntidade(Result);
    end;
end;

procedure TRepositorioUsuario.AtribuiDBParaEntidade(const coUSUARIO: TUSUARIO);
begin
  inherited;
  with FSQLSelect do
  begin
    coUSUARIO.LOGIN := FieldByName(FLD_USUARIO_LOGIN).AsString;
    coUSUARIO.SENHA := FieldByName(FLD_USUARIO_SENHA).AsString;
    coUSUARIO.NOME  := FieldByName(FLD_USUARIO_NOME).AsString;
  end;
end;

procedure TRepositorioUsuario.AtribuiEntidadeParaDB(const coUSUARIO: TUSUARIO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_USUARIO_LOGIN).AsString := coUSUARIO.LOGIN;
    ParamByName(FLD_USUARIO_SENHA).AsString := coUSUARIO.SENHA;
    ParamByName(FLD_USUARIO_NOME).AsString  := coUSUARIO.NOME;
  end;
end;

end.
