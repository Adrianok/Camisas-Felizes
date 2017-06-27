unit uClasseInterfaceConsultaBase;

interface

uses
  uInterfaceConsultaBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls,
  System.Classes, uConsultaBase,
  FireDAC.Comp.Client, Vcl.DbGrids,
  uCadastroCorDto, Winapi.Windows, uFuncaoRetorno;

type
  TRetorno = procedure (ARetorno: integer) of object;

  TClassInterfaceConsultaBase = class(TInterfacedObject, IInterfaceConsultaBase)
  private
  protected
    oFormulario : TfrmPesquisaBase;
    oProcedureRetorno: TRetorno;
  public

    procedure PesquisarGrid; virtual;
    procedure AlimentarDto(Column : TColumn); virtual;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string);    virtual;
    procedure Pesquisar; virtual;
    procedure KeyDown(var Key: Word);
    procedure Cancelar;  virtual;
    procedure Confirmar; virtual;
    procedure Fechar; virtual;
  end;

implementation

{ TClassInterfaceConsultaBase }

procedure TClassInterfaceConsultaBase.AlimentarDto(Column: TColumn);
begin
  oProcedureRetorno(StrToInt(Column.Field.Text));
end;



procedure TClassInterfaceConsultaBase.Cancelar;
begin
  oFormulario.DBGrid1.SelectedIndex := 1;
end;



procedure TClassInterfaceConsultaBase.Confirmar;
begin
  AlimentarDto(oFormulario.DBGrid1.Columns[oFormulario.DBGrid1.SelectedIndex]);
  oFormulario.FDMemTableGrid.Close;
  if assigned(oFormulario) then
    FreeAndNil(oFormulario);
end;



procedure TClassInterfaceConsultaBase.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string);
begin
  with oFormulario do
  begin
    ActiveControl :=  oFormulario.edtPesquisa;
  end;
  oProcedureRetorno := ARetorno;
end;


procedure TClassInterfaceConsultaBase.Fechar;
begin
  oFormulario.FDMemTableGrid.Close;
  if assigned(oFormulario) then
    FreeAndNil(oFormulario);
  oProcedureRetorno(0);
end;



procedure TClassInterfaceConsultaBase.KeyDown(var Key: Word);
begin
  if key = VK_ESCAPE then
  begin
    Fechar;
    char(Key) := #0
  end
  else
  if key = VK_RETURN then
  begin
    Confirmar;
    char(Key) := #0
  end;
end;



procedure TClassInterfaceConsultaBase.Pesquisar;
begin
end;



procedure TClassInterfaceConsultaBase.PesquisarGrid;
begin
end;



function TClassInterfaceConsultaBase.PreencherGrid: boolean;
begin
end;

end.

