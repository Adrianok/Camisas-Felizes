unit uConsultaTamanhoRegra;


interface

uses
  System.SysUtils, FireDac.Comp.Client,
  uConsultaTamanhoForm, uConsultaTamanhoModel;

type
  TConsultaTamanhoRegra = class
  public
    function SelectId(const oConsultaTamanhoModel: TConsultaTamanhoModel; sDescricao : String) : Integer;
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

function TConsultaTamanhoRegra.SelectId(const oConsultaTamanhoModel: TConsultaTamanhoModel;
  sDescricao: String): Integer;
begin
  Result := oConsultaTamanhoModel.SelectId(sDescricao);
end;

end.
