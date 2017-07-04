unit uConsultaMunicipioRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaMunicipioForm, uConsultaMunicipioModel;

type
  TConsultaMunicipioRegra = class
  public
    function SelectId(const oConsultaMunicipioModel: TConsultaMunicipioModel; sDescricao : String) : Integer;
    function SelectAll(const oConsultaMunicipioModel: TConsultaMunicipioModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaMunicipioRegra: TConsultaMunicipioRegra;
implementation

{ TConsultaMunicipioRegra }

function TConsultaMunicipioRegra.SelectAll(const oConsultaMunicipioModel: TConsultaMunicipioModel; MemTable: TFDMemTable) : boolean;
begin
  Result:= oConsultaMunicipioModel.SelectAll(MemTable);
end;

function TConsultaMunicipioRegra.SelectId(const oConsultaMunicipioModel: TConsultaMunicipioModel; sDescricao: String): Integer;
begin
  Result := oConsultaMunicipioModel.SelectId(sDescricao);
end;

end.
