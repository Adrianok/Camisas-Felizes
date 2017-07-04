unit uConsultaCorRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaCorForm, uConsultaCorModel,
  uCor_ModeloModel, System.Classes;

type
  TConsultaCorRegra = class
  public
     function SelectAll(const oConsultaCorModel: TConsultaCorModel;var MemTable: TFDMemTable) : boolean;
     function SelectAllWhere(const oCor_ModeloModel: TCor_ModeloModel; var MemTable: TFDMemTable; oListaModelo : Tlist; idModelo : integer) : boolean;
  end;

var
  oConsultaCorRegra: TConsultaCorRegra;
implementation

{ TConsultaCorRegra }

function TConsultaCorRegra.SelectAll(const oConsultaCorModel: TConsultaCorModel;var MemTable: TFDMemTable) : boolean;
begin
  Result:= oConsultaCorModel.SelectAll(MemTable);
end;

function TConsultaCorRegra.SelectAllWhere(
  const oCor_ModeloModel: TCor_ModeloModel; var MemTable: TFDMemTable;
  oListaModelo: Tlist; idModelo : integer): boolean;
begin
  Result := False;
  if(oCor_ModeloModel.SelectRegistros(oListaModelo, idModelo))then
    Result:= oConsultaCorModel.SelectAllWhere(MemTable, oListaModelo)

end;

end.
