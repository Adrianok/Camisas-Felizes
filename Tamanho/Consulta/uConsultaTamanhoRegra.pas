unit uConsultaCorRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaCorForm, uConsultaCorModel;

type
  TConsultaCorRegra = class
  public
    function SelectId(const oConsultaCorModel: TConsultaCorModel; sDescricao : String) : Integer;
    function SelectAll(const oConsultaCorModel: TConsultaCorModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaCorRegra: TConsultaCorRegra;
implementation

{ TConsultaCorRegra }

function TConsultaCorRegra.SelectAll(const oConsultaCorModel: TConsultaCorModel; MemTable: TFDMemTable) : boolean;
begin

  Result:= oConsultaCorModel.SelectAll(MemTable);

end;

function TConsultaCorRegra.SelectId(const oConsultaCorModel: TConsultaCorModel;
  sDescricao: String): Integer;
begin
  Result := oConsultaCorModel.SelectId(sDescricao);
end;

end.
