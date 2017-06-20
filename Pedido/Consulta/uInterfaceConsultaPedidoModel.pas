unit uInterfaceConsultaPedidoModel;

interface
uses
  System.Generics.Collections,
  uCadastroPedidoDto, FireDac.Comp.Client;
type
  IInterfaceConsultaPedidoModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;

  end;

implementation

end.
