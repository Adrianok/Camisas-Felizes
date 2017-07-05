unit uConsultaClienteModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroClienteDto,
  uConexaoSingleTon, uInterfaceConsultaClienteModel;

type
  TConsultaClienteModel = class(TinterfacedObject, IInterfaceConsultaClienteModel)
  private
    Query: TFDQuery;
  public
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TConsultaClienteModel }
constructor TConsultaClienteModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaClienteModel.Destroy;
begin
  if(assigned(Query))then
    FreeAndNil(Query);
  inherited;
end;

function TConsultaClienteModel.SelectAll(MemTable: TFDMemTable): boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql := 'SELECT idCliente, UPPER(nome) as nome, cpf_cnpj, telefone'
    + ' FROM cliente';
    Query.Open(sSql);
    if (not(Query.IsEmpty)) then
    begin
      MemTable.Data := Query.Data;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
