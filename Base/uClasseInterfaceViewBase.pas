unit uClasseInterfaceViewBase;

interface

uses
  uInterfaceViewBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls,
  System.Classes, uConsultaBase;

type
  TClassInterfaceViewBase = class(TInterfacedObject, IInterfaceViewBase)
  private
  protected
    oFormulario: TfrmBase;
  public
    procedure CriarFormConsulta(Aowner: TComponent);virtual;
    procedure CriarForm(Aowner: TComponent);virtual;
    procedure Novo; virtual;
    procedure Salvar; virtual;
    function  ValidarVazio: boolean;
    procedure Alterar; virtual;
    procedure Pesquisar; virtual;
    procedure Excluir; virtual;
    procedure Fechar; virtual;
    procedure AjustarFoco;
    procedure AtivarCampos;
    procedure DesativarCampos;
    procedure LimparCampos;
  end;

implementation

{ TClassInterface }

// Aqui vão ficar todos as alterações que são padroes para todo formulario
// tais como botões que ativam e desativam
procedure TClassInterfaceViewBase.AjustarFoco;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if(oFormulario.Components[iIndice] is TLabeledEdit) and
      ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) and
      ((oFormulario.Components[iIndice] as TWinControl).Enabled = True) then
    begin
      (oFormulario.Components[iIndice] as TWinControl).SetFocus;
      exit;
    end;

end;
procedure TClassInterfaceViewBase.Alterar;
begin
  ValidarVazio;
  AtivarCampos;
  AjustarFoco;
end;

procedure TClassInterfaceViewBase.AtivarCampos;
var
  iIndice: integer;

begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit) and
      ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) then
    begin
      (oFormulario.Components[iIndice] as TLabeledEdit).Enabled := True;
    end;

end;

procedure TClassInterfaceViewBase.CriarForm(Aowner: TComponent);
begin

end;

procedure TClassInterfaceViewBase.DesativarCampos;
var
  iIndice: integer;

begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit) then
    begin
      (oFormulario.Components[iIndice] as TLabeledEdit).Enabled := False;
    end;

end;

procedure TClassInterfaceViewBase.Excluir;
begin
  LimparCampos;
  DesativarCampos;

end;

procedure TClassInterfaceViewBase.Fechar;
begin
end;


procedure TClassInterfaceViewBase.LimparCampos;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit) then
    begin
      (oFormulario.Components[iIndice] as TLabeledEdit).Text := EmptyStr;
    end;

end;

procedure TClassInterfaceViewBase.Novo;
begin
  LimparCampos;
  AtivarCampos;
  AjustarFoco;
end;

procedure TClassInterfaceViewBase.Pesquisar;
begin
  AtivarCampos;
  AjustarFoco;
end;

procedure TClassInterfaceViewBase.Salvar;
begin
  if(ValidarVazio)then
    DesativarCampos;
end;

function TClassInterfaceViewBase.ValidarVazio: boolean;
var
  sSeparador: string;
  iIndice: integer;
  sStringMessage: string;
  auxiliar: boolean;
  itamanho: integer;
  sCampo: string;
  iQuantidadeCampos: integer;
  iNumeroCampo: integer;

begin
  inherited;
  sSeparador := #13; // Separa os nomes dos campos
  sStringMessage := '';
  // zera os nomes dos campos que aparecerão no raise exception
  auxiliar := True;
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
        if (auxiliar = False) then
          sStringMessage := sStringMessage + sSeparador;
        sStringMessage := sStringMessage + copy(sCampo, 1, itamanho - 1);

        auxiliar := False;
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
    Result := False
  end;

  if (iQuantidadeCampos > 1) then
  begin
    raise Exception.Create('Os Campos: ' + #13 + sStringMessage + #13 +
      'Não podem ser vazios');
    Result := False
  end
  else
    Result := True;
end;

end.
