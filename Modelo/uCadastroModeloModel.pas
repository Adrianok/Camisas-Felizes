unit uCadastroModeloModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroModeloDto;

type
  TCadastroModeloModel = class
  private
    // function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
    Query: TFDQuery;
  public
    // function SelectPorCor(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroModeloDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  // falta fazer a lista hash buscar os registros de idcor que tem idmodelo vinculado
  // na tabela cor_modelo, retornar uma lista hash com as relaçoes e em seguida
  // fazer select na tabela cor pra pegar as descrições que competem a aqueles idcor
  // na lista hash, após isso carregar essas informações numa memTable e transferir
  // para um db grid que aparece quando pressionado f2
var
  oCadastroModeloModel: TCadastroModeloModel;

implementation

{ TCadastroModeloModel }

function TCadastroModeloModel.Atualizar(var oCadastroModeloDto
  : TCadastroModeloDto): Boolean;
begin

end;

constructor TCadastroModeloModel.Create;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexaoSigleton.GetInstancia;
end;

function TCadastroModeloModel.Deletar(var oCadastroModeloDto
  : TCadastroModeloDto): Boolean;
begin

end;

destructor TCadastroModeloModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroModeloModel.Inserir(var oCadastroModeloDto
  : TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO modelo (idmodelo, modelo, preco) VALUES (' +
      IntToStr(oCadastroModeloDto.IdModelo) + ', ''' + oCadastroModeloDto.Modelo
      + ''', ' + CurrToStr(oCadastroModeloDto.Preco) + ');');
    Query.ExecSQL;

    Query.SQL.Clear;
    Query.SQL.Add
      (' INSERT INTO cor_modelo (cor_idcor, modelo_idmodelo) VALUES (' +
      IntToStr(oCadastroModeloDto.Cor.IdCor) + ', ' +
      IntToStr(oCadastroModeloDto.IdModelo) + '); ');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else if (Query.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('Não Foi possível inserir o cadastro');
  end;
end;

function TCadastroModeloModel.NovoId(var oCadastroModeloDto
  : TCadastroModeloDto): Boolean;
var
  Retorno: Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('select max(idmodelo) as id from modelo');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroModeloDto.IdModelo := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;

end;

function TCadastroModeloModel.SelectModelo(var oCadastroModeloDto
  : TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open
      ('SELECT * FROM modelo JOIN cor_modelo ON modelo_idmodelo = idmodelo ' +
      'join cor on idcor = cor_idcor WHERE modelo = ''' +
      oCadastroModeloDto.Modelo + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroModeloDto.IdModelo := Query.FieldByName('idmodelo').AsInteger;
      oCadastroModeloDto.Modelo := Query.FieldByName('modelo').AsString;
      oCadastroModeloDto.Preco := Query.FieldByName('preco').AsCurrency;
      oCadastroModeloDto.Cor.Descricao :=
        Query.FieldByName('descricao').AsString;
      oCadastroModeloDto.Cor.IdCor := Query.FieldByName('idcor').AsInteger;

      Result := True;
    end
    else if (Query.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');

  end;
end;

// function TCadastroModeloModel.SelectPorCor(
// var oCadastroModeloDto: TCadastroModeloDto): Boolean;
// begin
// try
// Query.SQL.Clear;
// Query.Open('SELECT * FROM cor  WHERE descricao = '''+(oCadastroModeloDto.Cor.Descricao) + ''' ');
// if (not(Query.IsEmpty)) then
// begin
// oCadastroModeloDto.Cor.IdCor := Query.FieldByName('idcor').AsInteger;
// Result := True;
// end
// else if (Query.IsEmpty) then
// Result := False;
// except
// raise Exception.create('Não Foi possível acessar o banco de dados');
//
// end;
//
//
// end;

end.
