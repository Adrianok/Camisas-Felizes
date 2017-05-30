unit uClasseInterfaceViewBase;

interface

uses
  uInterfaceViewBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls;

type
  TClassInterfaceViewBase = class(TInterfacedObject, IInterfaceViewBase)
  private
  protected
    oFormulario: TfrmBase;
  public
    procedure Novo; virtual;
    procedure Salvar; virtual;
    function ValidarVazio(oFormulario: TForm): boolean;
    procedure Alterar; virtual;
    procedure Pesquisar; virtual;
    procedure Excluir; virtual;
    procedure Fechar; virtual;
  end;

implementation

{ TClassInterface }

// Aqui vão ficar todos as alterações que são padroes para todo formulario
// tais como botões que ativam e desativam
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

function TClassInterfaceViewBase.ValidarVazio(oFormulario: TForm): boolean;
var
  sSeparador: string;
  iIndice: Integer;
  sStringMessage: string;
  auxiliar: boolean;
  itamanho: Integer;
  sCampo: string;
  iQuantidadeCampos: Integer;
  iNumeroCampo: Integer;

begin
  inherited;
  sSeparador := #13; // Separa os nomes dos campos
  sStringMessage := '';
  // zera os nomes dos campos que aparecerão no raise exception
  auxiliar := true;
  // auxiliar para não iniciar com caractere especial na mensagem
  iQuantidadeCampos := 0;
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit) then
    begin
      if (oFormulario.Components[iIndice] is TLabeledEdit) then
        sCampo := (oFormulario.Components[iIndice] as TLabeledEdit)
          .EditLabel.Caption;
      itamanho := length(sCampo);
      if ((oFormulario.Components[iIndice] as TLabeledEdit).Text = EmptyStr) and
        ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) then
      begin
        if (auxiliar = false) then
          sStringMessage := sStringMessage + sSeparador;
        sStringMessage := sStringMessage + copy(sCampo, 1, itamanho - 1);

        auxiliar := false;
        iQuantidadeCampos := iQuantidadeCampos + 1;

        if (iQuantidadeCampos = 1) then
          iNumeroCampo := iIndice;
      end;
    end;

  if (iQuantidadeCampos = 1) then
  begin
    (oFormulario.Components[iNumeroCampo] as TWinControl).SetFocus;
    raise Exception.Create('O Campo: ' + #13 + sStringMessage + #13 +
      'Não pode ser vazio');
    Result := false
  end;

  if (iQuantidadeCampos > 1) then
  begin
    raise Exception.Create('Os Campos: ' + #13 + sStringMessage + #13 +
      'Não podem ser vazios');
    Result := false
  end
  else
    Result := true;
end;

end.
