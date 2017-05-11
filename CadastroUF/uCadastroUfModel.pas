unit uCadastroUfModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uConexaoSingleTon, uCadastroUfDTO;

type
  TUfModel = class
  public
    function Salvar(var aEstado: TUfDto): boolean;
    function Ler(var aEstado: TUfDto): boolean;
  end;

implementation

{ TUfModel }

function TUfModel.Ler(var aEstado: TUfDto): boolean;
var
  sSqlLer: TFDQuery;

begin
  result = false;
  sSqlLer = TFDQuery.Create(nil);
  try


  finally

  end;
end;

function TUfModel.Salvar(var aEstado: TUfDto): boolean;
var
  sSqlSalvar: string;

begin
  sSqlSalvar := 'insert into uf (iduf, sigla, descricao) values (' +
    IntToStr(aEstado.id) + ', ' + QuotedStr(aEstado.uf) + ', ' +
    QuotedStr(aEstado.nome) + ')';

  result := TConexaoSigleton.GetInstancia.ExecSQL(sSqlSalvar) > 0;

end;

end.
