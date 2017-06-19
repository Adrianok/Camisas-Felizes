unit uInterfaceConsultaUfModel;

interface
uses
  System.Generics.Collections,
  uCadastroUfDto, FireDac.Comp.Client;
type
  IInterfaceConsultaUfModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;

  end;

implementation

end.
