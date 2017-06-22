unit uConsultaPedidoRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaPedidoForm, uConsultaPedidoModel;

type
  TConsultaPedidoRegra = class
  public
    function SelectAll(const oConsultaPedidoModel: TConsultaPedidoModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaPedidoRegra: TConsultaPedidoRegra;
implementation

{ TConsultaPedidoRegra }

function TConsultaPedidoRegra.SelectAll(const oConsultaPedidoModel: TConsultaPedidoModel; MemTable: TFDMemTable) : boolean;
begin

  Result:= oConsultaPedidoModel.SelectAll(MemTable);

end;

end.
