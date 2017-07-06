unit uConsultaModeloRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaModeloForm, uConsultaModeloModel;

type
  TConsultaModeloRegra = class
  public
    function SelectAll(const oConsultaModeloModel: TConsultaModeloModel; MemTable: TFDMemTable) : boolean;
  end;

implementation

{ TConsultaModeloRegra }

function TConsultaModeloRegra.SelectAll(const oConsultaModeloModel: TConsultaModeloModel; MemTable: TFDMemTable) : boolean;
begin

  Result:= oConsultaModeloModel.SelectAll(MemTable);

end;

end.
