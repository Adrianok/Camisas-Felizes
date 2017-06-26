unit uInterfaceConsultaClienteModel;

interface
uses
  System.Generics.Collections,
  uCadastroClienteDto, FireDac.Comp.Client;
type
  IInterfaceConsultaClienteModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;
  end;

implementation

end.
