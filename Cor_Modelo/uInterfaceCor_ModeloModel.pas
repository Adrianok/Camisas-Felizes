unit uInterfaceCor_ModeloModel;

interface
uses
  FireDac.Comp.Client, System.Classes;

  type
    IInterfaceCor_ModeloModel = interface
      function SelectRegistros(var oListaIdCores : TList; const IdModelo : Integer):boolean;
    end;

implementation

end.
