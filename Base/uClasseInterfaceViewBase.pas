unit uClasseInterfaceViewBase;

interface

uses
  uInterfaceViewBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms;

type
  TClassInterfaceViewBase = class(TInterfacedObject, IInterfaceViewBase)
  private
  protected
    oFormulario: TfrmBase;
  public
    procedure Novo; virtual;
    procedure Salvar; virtual;
    function ValidarVazio(oFormulario : TForm):boolean;
    procedure Alterar; virtual;
    procedure Pesquisar; virtual;
    procedure Excluir; virtual;
    procedure Fechar; virtual;
  end;

implementation

{ TClassInterface }

// Aqui vão ficar todos as alterações que são padroes para todo formulario
//  tais como botões que ativam e desativam
procedure TClassInterfaceViewBase.Alterar;
begin
  ValidarVazio(oFormulario);
end;

procedure TClassInterfaceViewBase.Excluir;
begin

end;

procedure TClassInterfaceViewBase.Fechar;
begin

end;

procedure TClassInterfaceViewBase.Novo;
begin

end;

procedure TClassInterfaceViewBase.Pesquisar;
begin

end;

procedure TClassInterfaceViewBase.Salvar;
begin

end;



function TClassInterfaceViewBase.ValidarVazio(oFormulario: TForm):boolean;
var
  iIndice: Integer;
begin
  inherited;
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit) then
      if (oFormulario.Components[iIndice] as TLabeledEdit).Text = EmptyStr then
      begin
       //(oFormulario.Components[iIndice] as TLabeledEdit).SetFocus;
        raise Exception.Create('O Campo ' +
          (oFormulario.Components[iIndice] as TLabeledEdit).EditLabel.Caption +
          ' Não pode ser vazio');
          Result := False
      end;
      result:= True;
end;

end.
