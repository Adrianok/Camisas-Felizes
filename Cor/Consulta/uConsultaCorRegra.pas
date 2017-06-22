unit uConsultaCorRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaCorForm, uConsultaCorModel;

type
  TConsultaCorRegra = class
  public
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

end.
