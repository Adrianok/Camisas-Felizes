unit uCadastroCorModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroCorDto;

type
  TCadastroCorModel = class
  private
    // function SelecionarTudo(var oCadastroCorDto: TObjectDictionary<string, TCadastroCorDto>): Boolean;
    Query: TFDQuery;
  public
    // function SelectPorCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function SelectCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Inserir  (var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Atualizar(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Deletar  (var oCadastroCorDto: TCadastroCorDto): Boolean;
    function NovoId   (var oCadastroCorDto: TCadastroCorDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  // falta fazer a lista hash buscar os registros de idcor que tem idCor vinculado
  // na tabela cor_Cor, retornar uma lista hash com as relaçoes e em seguida
  // fazer select na tabela cor pra pegar as descrições que competem a aqueles idcor
  // na lista hash, após isso carregar essas informações numa memTable e transferir
  // para um db grid que aparece quando pressionado f2
var
  oCadastroCorModel: TCadastroCorModel;

implementation

{ TCadastroCorModel }

function TCadastroCorModel.Atualizar(var oCadastroCorDto
  : TCadastroCorDto): Boolean;
begin

end;

constructor TCadastroCorModel.Create;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexaoSigleton.GetInstancia;
end;

function TCadastroCorModel.Deletar(var oCadastroCorDto
  : TCadastroCorDto): Boolean;
begin

end;

destructor TCadastroCorModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroCorModel.Inserir(var oCadastroCorDto
  : TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO Cor (idCor, Descricao, preco) VALUES ('
     + IntToStr(oCadastroCorDto.IdCor) + ', ''' + oCadastroCorDto.Descricao + ''' );');
    Query.ExecSQL;
//
//    Query.SQL.Clear;
//    Query.SQL.Add
//      (' INSERT INTO cor_Cor (cor_idcor, Cor_idCor) VALUES (' +
//      IntToStr(oCadastroCorDto.Cor.IdCor) + ', ' +
//      IntToStr(oCadastroCorDto.IdCor) + '); ');
//    Query.ExecSQL;
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

function TCadastroCorModel.NovoId(var oCadastroCorDto
  : TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('select max(idCor) as id from Cor');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroCorDto.IdCor := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;

end;

function TCadastroCorModel.SelectCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open
      ('SELECT * FROM Cor WHERE Descricao = ''' +oCadastroCorDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroCorDto.IdCor     := Query.FieldByName('idCor').AsInteger;
      oCadastroCorDto.Descricao := Query.FieldByName('descricao').AsString;
      Result := True;
    end
    else if (Query.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');

  end;
end;

// function TCadastroCorModel.SelectPorCor(
// var oCadastroCorDto: TCadastroCorDto): Boolean;
// begin
// try
// Query.SQL.Clear;
// Query.Open('SELECT * FROM cor  WHERE descricao = '''+(oCadastroCorDto.Cor.Descricao) + ''' ');
// if (not(Query.IsEmpty)) then
// begin
// oCadastroCorDto.Cor.IdCor := Query.FieldByName('idcor').AsInteger;
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
