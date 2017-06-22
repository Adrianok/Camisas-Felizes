unit uClasseInterfaceConsultaBase;

interface

uses
  uInterfaceConsultaBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls,
  System.Classes, uConsultaBase,
  FireDAC.Comp.Client, Vcl.DbGrids,
  uCadastroCorDto, Winapi.Windows;

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
    procedure CriarForm(Aowner: TComponent); virtual;
    procedure CriarFormTeste(Aowner: TComponent; ARetorno: TRetorno); virtual;
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
end;



procedure TClassInterfaceConsultaBase.Cancelar;
begin
end;



procedure TClassInterfaceConsultaBase.Confirmar;
begin
  oProcedureRetorno(Integer(oFormulario.DBGrid1.Columns[oFormulario.DBGrid1.SelectedIndex]));
  Fechar;
end;



procedure TClassInterfaceConsultaBase.CriarForm(Aowner: TComponent);
begin
  with oFormulario do
  begin
    if(edtPesquisa.Text = '!')then
      edtPesquisa.Text := '';
    ActiveControl :=  oFormulario.DBGrid1;
    DBGrid1.SelectedIndex := 1;
  end;
end;


procedure TClassInterfaceConsultaBase.CriarFormTeste(Aowner: TComponent; ARetorno: TRetorno);
begin
  with oFormulario do
  begin
    if(edtPesquisa.Text = '!')then
      edtPesquisa.Text := '';
    ActiveControl :=  oFormulario.DBGrid1;
    DBGrid1.SelectedIndex := 1;
  end;
  oProcedureRetorno := ARetorno;
end;


procedure TClassInterfaceConsultaBase.Fechar;
begin
  oFormulario.FDMemTableGrid.Close;
  if assigned(oFormulario) then
    FreeAndNil(oFormulario);
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

