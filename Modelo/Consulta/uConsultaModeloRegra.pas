unit uConsultaModeloRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaModeloForm, uConsultaModeloModel;

type
  TConsultaModeloRegra = class
  public
    function SelectId(const oConsultaModeloModel: TConsultaModeloModel; sDescricao : String) : Integer;
    function SelectAll(const oConsultaModeloModel: TConsultaModeloModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaModeloRegra: TConsultaModeloRegra;
implementation

{ TConsultaModeloRegra }

function TConsultaModeloRegra.SelectAll(const oConsultaModeloModel: TConsultaModeloModel; MemTable: TFDMemTable) : boolean;
begin

  Result:= oConsultaModeloModel.SelectAll(MemTable);

end;

function TConsultaModeloRegra.SelectId(const oConsultaModeloModel: TConsultaModeloModel;
  sDescricao: String): Integer;
begin
  Result := oConsultaModeloModel.SelectId(sDescricao);
end;

end.
