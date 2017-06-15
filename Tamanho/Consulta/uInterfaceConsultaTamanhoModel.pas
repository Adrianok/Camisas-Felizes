unit uInterfaceConsultaTamanhoModel;

interface
uses
  System.Generics.Collections,
  uCadastroTamanhoDto, FireDac.Comp.Client;
type
  IInterfaceConsultaTamanhoModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;

  end;

implementation

end.
