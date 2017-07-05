unit uInterfaceConsultaCorModel;

interface
uses
  System.Generics.Collections, System.Classes,
  uCadastroCorDto, FireDac.Comp.Client;
type
  IInterfaceConsultaCorModel = interface
    function SelectAllWhere(var MemTable: TFDMemTable; const oListaModelos: TList) : boolean;
    function SelectAll(MemTable: TFDMemTable) : boolean;
  end;

implementation

end.
