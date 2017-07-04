unit uConsultaBairroRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaBairroForm, uConsultaBairroModel, System.Classes;

type
  TConsultaBairroRegra = class
  public
     function SelectAll(const oConsultaBairroModel: TConsultaBairroModel;var MemTable: TFDMemTable) : boolean;  end;

var
  oConsultaBairroRegra: TConsultaBairroRegra;
implementation

{ TConsultaBairroRegra }

function TConsultaBairroRegra.SelectAll(const oConsultaBairroModel: TConsultaBairroModel;var MemTable: TFDMemTable) : boolean;
begin
  Result:= oConsultaBairroModel.SelectAll(MemTable);
end;
end.
