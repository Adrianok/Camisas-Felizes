unit uInterfaceCor_ModeloModel;

interface
uses
  FireDac.Comp.Client;

  type
    IInterfaceCor_ModeloModel = interface
      function SelectRegistros(const MemTable : TFDMemTable; const IdModelo : Integer):boolean;
    end;

implementation

end.
