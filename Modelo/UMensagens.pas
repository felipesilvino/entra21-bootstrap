unit UMensagens;

interface

resourcestring
  //Geral
  STR_ATENCAO                        = 'Aten��o';
  STR_CAPTION_ABA_CONSULTAS          = '%d - %s...';
  STR_TODOS                          = 'Todos';
  STR_ATUALIZADO                     = 'atualizado(a)';
  STR_GRAVADO                        = 'gravado(a)';
  STR_EXCLUIDO                       = 'excluido(a)';
  STR_OPERACAO_COM_SUCESSO           = '%s com c�digo %d %s com sucesso.';
  STR_ENTIDADE_NAO_ENCONTRADA        = '%s com c�digo %d n�o foi encontrado(a)';

  //Usu�rio
  STR_SENHA_NAO_SEGURA           = 'Senha digitada n�o � segura, senha deve ter no m�nimo %d caracteres';
  STR_SENHAS_NAO_CONFEREM        = 'Senhas n�o conferem';
  STR_USUARIO_NOME_NAO_INFORMADO = 'Nome do usu�rio n�o foi informado';
  STR_SENHA_ATUAL_NAO_CONFERE    = 'Senha atual n�o confere';

  //Login
  STR_USUARIO_OU_SENHA_SAO_INVALIDOS = 'Usu�rio ou senha s�o inv�lidos';

  //Entidade
  STR_ENTIDADE_GRAVADA_COM_SUCESSO    = '%s gravado(a) com sucesso! C�digo gerado: %d.';
  STR_ENTIDADE_ATUALIZADO_COM_SUCESSO = '%s atualizado(a) com sucesso!';
  STR_ENTIDADE_DESEJA_EXCLUIR         = 'Deseja realmente excluir este(a) %s?';

  //CRUD
  STR_CRUD_CABECALHO = 'Cadastro de %s';

  //Transa��o
  STR_JA_EXISTE_TRANSACAO_ATIVA   = 'N�o foi possivel abrir uma nova transa��o! Motivo: J� existe uma transa��o ativa.';
  STR_NAO_EXISTE_TRANSACAO_ATIVA  = 'N�o foi possivel %s a transa��o! Motivo: N�o existe uma transa��o ativa.';
  STR_VALIDA_TRANSACAO_ATIVA      = 'Opera��o abortada! Motivo: Para realizar esta opera��o � necess�rio ter uma transa��o ativa.';
  STR_ABORTAR                     = 'abortar';
  STR_FINALIZAR                   = 'finalizar';

implementation

end.
