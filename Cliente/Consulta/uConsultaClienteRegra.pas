unit uConsultaClienteRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaClienteForm, uConsultaClienteModel;

type
  TConsultaClienteRegra = class
  public
     function SelectAll(const oConsultaClienteModel: TConsultaClienteModel; MemTable: TFDMemTable) : boolean;
  end;

var
  oConsultaClienteRegra: TConsultaClienteRegra;
implementation

{ TConsultaClienteRegra }

function TConsultaClienteRegra.SelectAll(const oConsultaClienteModel: TConsultaClienteModel; MemTable: TFDMemTable) : boolean;
begin

  Result:= oConsultaClienteModel.SelectAll(MemTable);

end;

end.
