unit UUsuario;

interface

uses
    UEntidade
  , UUtilitarios
  ;

type
  TUSUARIO = class(TENTIDADE)
  public
    LOGIN: String;
    SENHA: String;
    NOME: String;
  end;

const
  TBL_USUARIO           = 'USUARIO';
  FLD_USUARIO_LOGIN     = 'LOGIN';
  FLD_USUARIO_SENHA     = 'SENHA';
  FLD_USUARIO_NOME      = 'NOME';

  VW_USUARIO       = 'VW_USUARIO';
  VW_USUARIO_ID    = 'Cód.';
  VW_USUARIO_LOGIN = 'Login';
  VW_USUARIO_NOME  = 'Nome';


resourcestring
  STR_USUARIO = 'Usuário do Sistema';

implementation

{ TUSUARIO }

end.
