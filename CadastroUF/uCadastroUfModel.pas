unit uCadastroUfModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uConexaoSingleTon, uCadastroUfDto;

type
  TCadastroUfModel = class
  public
    function Salvar(var aEstado: TCadastroUfDTO): boolean;
    function Ler(var aEstado: TCadastroUfDTO): boolean;
    function BuscaId: integer;
    function Alterar(var aEstado: TCadastroUfDTO): boolean;
    function Deletar(const aEstado: integer): boolean;
  end;

var
  oCadastroUfModel: TCadastroUfModel;

implementation

{ TUfModel }

function TCadastroUfModel.Alterar(var aEstado: TCadastroUfDTO): boolean;
var
  sSql: string;

begin
  sSql := 'update uf set iduf = ' + inttostr(aEstado.id) + ' , sigla = ' +
    quotedStr(aEstado.uf) + ' , nome = ' + quotedStr(aEstado.nome) +
    ' Where idEstado = ' + inttostr(aEstado.id);

  result := TConexaoSigleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TCadastroUfModel.BuscaId: integer;
var
  sSql: TFDQuery;

begin
  sSql := TFDQuery.Create(nil);
  try
    sSql.Connection := TConexaoSigleton.GetInstancia;
    sSql.Open('Select max(iduf) as ID from uf');
    begin
      if (not(sSql.IsEmpty)) then
        result := sSql.FieldByName('ID').AsInteger + 1;
    end;

  finally
    if (Assigned(sSql)) then
      FreeAndNil(sSql);
  end;
end;

function TCadastroUfModel.Deletar(const aEstado: integer): boolean;
begin
  result := TConexaoSigleton.GetInstancia.ExecSQL('delete from uf where iduf = '
    + inttostr(aEstado)) > 0;
end;

function TCadastroUfModel.Ler(var aEstado: TCadastroUfDTO): boolean;
var
  sSqlLer: TFDQuery;

begin
  result := false;
  sSqlLer := TFDQuery.Create(nil);
  try
    sSqlLer.Connection := TConexaoSigleton.GetInstancia;
    sSqlLer.Open('Select iduf, sigla, descricao from uf where iduf = ' +
      inttostr(aEstado.id));

    if (not(sSqlLer.IsEmpty)) then
    begin
      aEstado.id := sSqlLer.FieldByName('iduf').AsInteger;
      aEstado.uf := sSqlLer.FieldByName('uf').AsString;
      aEstado.nome := sSqlLer.FieldByName('descricao').AsString;

      result := true;
    end;

  finally
    if (Assigned(sSqlLer)) then
      FreeAndNil(sSqlLer);
  end;
end;

function TCadastroUfModel.Salvar(var aEstado: TCadastroUfDTO): boolean;
var
  sSqlSalvar: string;

begin
  sSqlSalvar := 'insert into uf (iduf, sigla, descricao) values (' +
    inttostr(aEstado.id) + ', ' + quotedStr(aEstado.uf) + ', ' +
    quotedStr(aEstado.nome) + ')';

  result := TConexaoSigleton.GetInstancia.ExecSQL(sSqlSalvar) > 0;

end;

end.
