unit uInterfaceConsultaBairroModel;

interface
uses
  System.Generics.Collections, System.Classes,
  uCadastroBairroDto, FireDac.Comp.Client;
type
  IInterfaceConsultaBairroModel = interface
    function SelectAllWhere(var MemTable: TFDMemTable; const oListaModelos: TList) : boolean;
    function SelectAll(MemTable: TFDMemTable) : boolean;
  end;

implementation

end.
