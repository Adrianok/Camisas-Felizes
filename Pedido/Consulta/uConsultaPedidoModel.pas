unit uConsultaPedidoModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroPedidoDto,
  uConexaoSingleTon, uInterfaceConsultaPedidoModel;

type
  TConsultaPedidoModel = class(TinterfacedObject, IInterfaceConsultaPedidoModel)
  private
    Query: TFDQuery;
  public
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaPedidoModel: TConsultaPedidoModel;
implementation

{ TConsultaPedidoModel }
constructor TConsultaPedidoModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaPedidoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaPedidoModel.SelectAll(MemTable: TFDMemTable): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT p.idpedido AS idpedido , p.data AS data, '
              +' (select count(i.iditensPedido) from itenspedido i where i.idpedido = p.idpedido) as total, '
             + ' p.valortotal AS valortotal , UPPER(c.nome) AS nome FROM pedido p '
             + ' LEFT OUTER JOIN cliente c on c.idcliente = p.idcliente ');
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
