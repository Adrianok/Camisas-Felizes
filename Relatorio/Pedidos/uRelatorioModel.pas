unit uRelatorioModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uInterfaceRelatorioModel, uRelatorioDto;

type
  TRelatorioModel = class(TinterfacedObject, IInterfaceRelatorioModel)
  private
    Query: TFDQuery;

  public
   function SelectAll(MemTable: TFDMemTable; filtros : TRelatorioDto) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRelatorioModel }
constructor TRelatorioModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TRelatorioModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TRelatorioModel.SelectAll(MemTable: TFDMemTable; filtros : TRelatorioDto) : boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT p.idpedido AS idpedido , p.data AS data, '
              +' p.valortotal AS valortotal , UPPER(c.nome) AS nome, c.idcliente AS idcliente FROM pedido p '
             + ' LEFT JOIN cliente c on c.idcliente = p.idcliente '
             + 'WHERE idcliente >= ' + IntToStr(filtros.ClienteInicial) + ' AND idcliente <= ' + IntToStr(filtros.ClienteFinal)
             + 'data >= ' + DateTimeToStr(filtros.DataInicial) + ' AND data <= ' + DateTimeToStr(filtros.DataFinal)
             + 'idpedido >= '+ IntToStr(filtros.PedidoInicial) + ' AND idpedido <= ' + IntToStr(filtros.PedidoFinal));

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
