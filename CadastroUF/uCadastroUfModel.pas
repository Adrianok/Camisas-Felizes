unit uCadastroUfModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon,
  uCadastroUfDto,
  uIterfaceCadastroUfModel;

type
  TCadastroUfModel = class(TInterfacedObject, IInterfaceCadastroUfModel)
  private
    Query: TFDQuery;
    QuerySql: string;
  public
    function Salvar(var aEstado: TCadastroUfDTO): boolean;
    function Ler(var aEstado: TCadastroUfDTO): boolean;
    function NovoId(var oCadastroUfDto: TCadastroUfDTO): boolean;
    function Alterar(var aEstado: TCadastroUfDTO): boolean;
    function Deletar(const aIdUf: Integer): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroUfModel: TCadastroUfModel;

implementation

{ TUfModel }

function TCadastroUfModel.Alterar(var aEstado: TCadastroUfDTO): boolean;
begin
  QuerySql := ('update uf set iduf = ' + inttostr(aEstado.id) + ' , sigla = ' +
    quotedStr(aEstado.uf) + ' , nome = ' + quotedStr(aEstado.nome) +
    ' Where iduf = ' + inttostr(aEstado.id));

  result := Query.Connection.ExecSQL(QuerySql) > 0;
end;

function TCadastroUfModel.NovoId(var oCadastroUfDto: TCadastroUfDTO): boolean;
var
  Retorno: Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('select max(idUf) as id from Uf');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroUfDto.id := (Query.FieldByName('id').AsInteger) + 1;
      result := True;
    end
    else
      result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;

end;

constructor TCadastroUfModel.Create;
begin
  inherited;
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexaoSigleton.GetInstancia;

end;

function TCadastroUfModel.Deletar(const aIdUf: Integer): boolean;
begin
  result := Query.Connection.ExecSQL
    ('delete from Municipio where idMunicipio = ' + inttostr(aIdUf)) > 0;
end;

destructor TCadastroUfModel.Destroy;
begin
  inherited;
  if (Assigned(Query)) then
    FreeAndNil(Query);
end;

function TCadastroUfModel.Ler(var aEstado: TCadastroUfDTO): boolean;
begin
  result := False;
  try
    QuerySql := 'Select iduf, sigla, descricao from uf where sigla = ' +
      (aEstado.uf);

    if (not(Query.IsEmpty)) then
    begin
      aEstado.id := Query.FieldByName('iduf').AsInteger;
      aEstado.uf := Query.FieldByName('sigla').AsString;
      aEstado.nome := Query.FieldByName('descricao').AsString;

      result := True;
    end;

  finally
    if (Assigned(Query)) then
      FreeAndNil(Query);
  end;
end;

function TCadastroUfModel.Salvar(var aEstado: TCadastroUfDTO): boolean;

begin
  QuerySql := ('insert into uf (iduf, sigla, descricao) values (' +
    inttostr(aEstado.id) + ', ' + quotedStr(aEstado.uf) + ', ' +
    quotedStr(aEstado.nome) + ')');

  result := Query.Connection.ExecSQL(QuerySql) > 0;

end;

end.
