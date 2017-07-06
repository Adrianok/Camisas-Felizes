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
var
  oDataInicial, oDataFinal : String;

begin
  oDataInicial := FormatDateTime('yyyy/mm/dd', filtros.DataInicial);
  oDataFinal := FormatDateTime('yyyy/mm/dd', filtros.DataFinal);

  try
    Query.SQL.Clear;
     Query.Open('SELECT p.idpedido AS idpedido , p.data AS data, p.valortotal AS valortotal , '
             + ' UPPER(c.nome) AS nome, p.idcliente AS idcliente, UPPER(m.descricao) AS municipio, '
             + ' UPPER(mi.descricao) AS modelo FROM pedido p '
             + ' INNER JOIN cliente c ON c.idcliente = p.idcliente '
             + ' INNER JOIN endereco e ON e.idendereco = c.idendereco '
             + ' INNER JOIN bairro b ON b.idbairro = e.idbairro '
             + ' INNER JOIN municipio m ON m.idmunicipio = b.municipio_idmunicipio '
             + ' INNER JOIN itenspedido ip ON ip.idpedido = p.idpedido '
             + ' INNER JOIN modelo mi ON mi.idmodelo = ip.idmodelo '
             + ' WHERE c.idcliente  BETWEEN ' + IntToStr(filtros.ClienteInicial) + ' AND ' + IntToStr(filtros.ClienteFinal)
             + ' AND data BETWEEN ''' + (oDataInicial) + ''' AND ''' + (oDataFinal)
             + ''' AND p.idpedido BETWEEN ' + IntToStr(filtros.PedidoInicial) + ' AND ' + IntToStr(filtros.PedidoFinal)
             + ' AND mi.idmodelo BETWEEN ' + IntToStr(filtros.ProdutoInicial) + ' AND ' + IntToStr(filtros.ProdutoFinal)
             + ' AND m.idmunicipio BETWEEN ' + IntToStr(filtros.MunicipioInicial) + ' AND ' + IntToStr(filtros.MunicipioFinal));

  if (not(Query.IsEmpty)) then
    begin
      MemTable.Close;
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
