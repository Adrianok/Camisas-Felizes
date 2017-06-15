unit uInterfaceConsultaCorModel;

interface
uses
  System.Generics.Collections,
  uCadastroCorDto, FireDac.Comp.Client;
type
  IInterfaceConsultaCorModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;

  end;

implementation

end.
