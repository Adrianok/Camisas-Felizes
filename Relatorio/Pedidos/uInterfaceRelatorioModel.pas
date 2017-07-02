unit uInterfaceRelatorioModel;

interface
uses
  System.Generics.Collections,
  uRelatorioDto, FireDac.Comp.Client;
type
  IInterfaceRelatorioModel = interface

   function SelectAll(MemTable: TFDMemTable; filtros : TRelatorioDto) : boolean;
  end;

implementation

end.
