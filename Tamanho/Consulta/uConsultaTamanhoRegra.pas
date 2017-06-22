unit uConsultaTamanhoRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaTamanhoForm, uConsultaTamanhoModel;

type
  TConsultaTamanhoRegra = class
  public
    function SelectAll(const oConsultaTamanhoModel: TConsultaTamanhoModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaTamanhoRegra: TConsultaTamanhoRegra;
implementation

{ TConsultaTamanhoRegra }

function TConsultaTamanhoRegra.SelectAll(const oConsultaTamanhoModel: TConsultaTamanhoModel; MemTable: TFDMemTable) : boolean;
begin

  Result:= oConsultaTamanhoModel.SelectAll(MemTable);

end;

end.
