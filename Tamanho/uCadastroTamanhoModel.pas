unit uCadastroTamanhoModel;


interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroTamanhoDto;

type
  TCadastroTamanhoModel = class
  private
    // function SelecionarTudo(var oCadastroTamanhoDto: TObjectDictionary<string, TCadastroTamanhoDto>): Boolean;
    Query: TFDQuery;
  public
    // function SelectPorTamanho(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function SelectTamanho(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Inserir(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Atualizar(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Deletar(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function NovoId(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  // falta fazer a lista hash buscar os registros de idTamanho que tem idTamanho vinculado
  // na tabela Tamanho_Tamanho, retornar uma lista hash com as relaçoes e em seguida
  // fazer select na tabela Tamanho pra pegar as descrições que competem a aqueles idTamanho
  // na lista hash, após isso carregar essas informações numa memTable e transferir
  // para um db grid que aparece quando pressionado f2
var
  oCadastroTamanhoModel: TCadastroTamanhoModel;

implementation

{ TCadastroTamanhoModel }

function TCadastroTamanhoModel.Atualizar(var oCadastroTamanhoDto
  : TCadastroTamanhoDto): Boolean;
begin

end;

constructor TCadastroTamanhoModel.Create;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexaoSigleton.GetInstancia;
end;

function TCadastroTamanhoModel.Deletar(var oCadastroTamanhoDto
  : TCadastroTamanhoDto): Boolean;
begin

end;

destructor TCadastroTamanhoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroTamanhoModel.Inserir(var oCadastroTamanhoDto
  : TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO Tamanho (idTamanho, Descricao, preco) VALUES ('
     + IntToStr(oCadastroTamanhoDto.IdTamanho) + ', ''' + oCadastroTamanhoDto.Descricao + ''' );');
    Query.ExecSQL;
//
//    Query.SQL.Clear;
//    Query.SQL.Add
//      (' INSERT INTO Tamanho_Tamanho (Tamanho_idTamanho, Tamanho_idTamanho) VALUES (' +
//      IntToStr(oCadastroTamanhoDto.Tamanho.IdTamanho) + ', ' +
//      IntToStr(oCadastroTamanhoDto.IdTamanho) + '); ');
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

function TCadastroTamanhoModel.NovoId(var oCadastroTamanhoDto
  : TCadastroTamanhoDto): Boolean;
var
  Retorno: Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('select max(idTamanho) as id from Tamanho');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroTamanhoDto.IdTamanho := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;

end;

function TCadastroTamanhoModel.SelectTamanho(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.Open
//      ('SELECT * FROM Tamanho JOIN Tamanho_Tamanho ON Tamanho_idTamanho = idTamanho ' +
//      'join Tamanho on idTamanho = Tamanho_idTamanho WHERE Tamanho = ''' +
//      oCadastroTamanhoDto.D + ''' ');
//    if (not(Query.IsEmpty)) then
//    begin
//      oCadastroTamanhoDto.IdTamanho := Query.FieldByName('idTamanho').AsInteger;
//      oCadastroTamanhoDto.Tamanho := Query.FieldByName('Tamanho').AsString;
//      oCadastroTamanhoDto.Preco := Query.FieldByName('preco').AsCurrency;
//      oCadastroTamanhoDto.Tamanho.Descricao :=
//        Query.FieldByName('descricao').AsString;
//      oCadastroTamanhoDto.Tamanho.IdTamanho := Query.FieldByName('idTamanho').AsInteger;
//
//      Result := True;
//    end
//    else if (Query.IsEmpty) then
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//
//  end;
end;

// function TCadastroTamanhoModel.SelectPorTamanho(
// var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
// begin
// try
// Query.SQL.Clear;
// Query.Open('SELECT * FROM Tamanho  WHERE descricao = '''+(oCadastroTamanhoDto.Tamanho.Descricao) + ''' ');
// if (not(Query.IsEmpty)) then
// begin
// oCadastroTamanhoDto.Tamanho.IdTamanho := Query.FieldByName('idTamanho').AsInteger;
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
