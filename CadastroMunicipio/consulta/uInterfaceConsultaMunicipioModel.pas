unit uInterfaceConsultaMunicipioModel;

interface
uses
  System.Generics.Collections,
  uCadastroMunicipioDto, FireDac.Comp.Client;
type
  IInterfaceConsultaMunicipioModel = interface

   function SelectAll(MemTable: TFDMemTable) : boolean;

  end;

implementation

end.
