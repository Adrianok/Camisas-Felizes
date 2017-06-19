unit uConsultaUfRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaUfForm, uConsultaUfModel;

type
  TConsultaUfRegra = class
  public
    function SelectId(const oConsultaUfModel: TConsultaUfModel; sDescricao : String) : Integer;
    function SelectAll(const oConsultaUfModel: TConsultaUfModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaUfRegra: TConsultaUfRegra;
implementation

{ TConsultaUfRegra }

function TConsultaUfRegra.SelectAll(const oConsultaUfModel: TConsultaUfModel; MemTable: TFDMemTable) : boolean;
begin
  Result:= oConsultaUfModel.SelectAll(MemTable);
end;

function TConsultaUfRegra.SelectId(const oConsultaUfModel: TConsultaUfModel; sDescricao: String): Integer;
begin
  Result := oConsultaUfModel.SelectId(sDescricao);
end;

end.
