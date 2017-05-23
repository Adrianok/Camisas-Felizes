unit uClassInterface;

interface

uses
  uInterfaceBase, dialogs,
  uBase;

type
  TClassInterface = class(TInterfacedObject, TInterfaceBase)
  private
  protected
    oFormulario: TfrmBase;
  public
    procedure Novo; virtual;
    procedure Salvar;
    procedure Alterar;
    procedure Pesquisar;
    procedure Excluir;
    procedure Fechar;
  end;

implementation

{ TClassInterface }

procedure TClassInterface.Alterar;
begin
  oFormulario.btnNovo.Enabled := false;
  oFormulario.btnAlterar.Caption := 'Cancelar';

  oFormulario.btnExcluir.Enabled := True;
  oFormulario.btnAlterar.Enabled := false;

end;

procedure TClassInterface.Excluir;
begin

end;

procedure TClassInterface.Fechar;
begin

end;

procedure TClassInterface.Novo;
begin
  oFormulario.btnSalvar.Enabled := true;
  oFormulario.btnNovo.Enabled := false;
  oFormulario.btnAlterar.Enabled := false;
end;

procedure TClassInterface.Pesquisar;
begin
  oFormulario.btnNovo.Enabled := false;


  oFormulario.btnExcluir.Enabled := True;
  oFormulario.btnAlterar.Enabled := true;

end;

procedure TClassInterface.Salvar;
begin

end;

end.
