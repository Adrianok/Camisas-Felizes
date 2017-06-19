unit uInterfaceCor_ModeloModel;

interface
uses
  FireDac.Comp.Client, System.Classes;

  type
    IInterfaceCor_ModeloModel = interface
      function DeletarModelo(const IdModelo : Integer): boolean;
      function DeletarCor(const IdCor : Integer): boolean;
      function SelectPorIdCor(const IdCor : integer): boolean;
      function SelectPorIdModelo(const IdModelo : integer) : boolean;
      function SelectRegistros(var oListaIdCores : TList; const IdModelo : Integer):boolean;
    end;

implementation

end.
