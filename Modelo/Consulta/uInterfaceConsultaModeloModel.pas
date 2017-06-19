unit uInterfaceConsultaModeloModel;

interface
uses
  System.Generics.Collections,
  uCadastroModeloDto, FireDac.Comp.Client;
type
  IInterfaceConsultaModeloModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;

  end;

implementation

end.
