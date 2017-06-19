unit uClasseInterfaceViewBase;

interface

uses
  uInterfaceViewBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls,
  System.Classes, System.UITypes,
  uConsultaBase, Winapi.Windows;

type
  TClassInterfaceViewBase = class(TInterfacedObject, IInterfaceViewBase)
  private
  protected
    oFormulario: TfrmBase;
  public
    procedure CriarForm(Aowner: TComponent); virtual;
    procedure Pesquisar(Aowner: TComponent); virtual;
    procedure Inicial; virtual;
    procedure Consulta; virtual;
    procedure Novo; virtual;
    procedure Salvar; virtual;
    procedure KeyDown(var Key: Word; Aowner: TComponent);
    function ValidarVazio: boolean;
    procedure Excluir; virtual;
    procedure Fechar;
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
    if (oFormulario.Components[iIndice] is TLabeledEdit) and
      ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) and
      ((oFormulario.Components[iIndice] as TWinControl).Enabled = True) then
    begin
      (oFormulario.Components[iIndice] as TWinControl).SetFocus;
      exit;
    end;
end;



procedure TClassInterfaceViewBase.AtivarCampos;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if ((oFormulario.Components[iIndice] is TLabeledEdit)
    or  (oFormulario.Components[iIndice] is TGroupBox)) and
      ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) then
    begin
      (oFormulario.Components[iIndice] as TWinControl).Enabled := True;
    end;
end;



procedure TClassInterfaceViewBase.Consulta;
begin
end;



procedure TClassInterfaceViewBase.CriarForm(Aowner: TComponent);
begin
end;



procedure TClassInterfaceViewBase.DesativarCampos;
var
  iIndice: integer;

begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit)
    or (oFormulario.Components[iIndice] is TGroupBox)
    then
    begin
      (oFormulario.Components[iIndice] as TWinControl).Enabled := False;
    end;
end;



procedure TClassInterfaceViewBase.Excluir;
begin
  if (MessageDlg('Deseja realmente excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Abort;

  Inicial;
end;



procedure TClassInterfaceViewBase.Fechar;
begin
  inherited;
  if assigned(oFormulario) then
    FreeAndNil(oFormulario);
end;



procedure TClassInterfaceViewBase.Inicial;
begin
  oFormulario.btnNovo.Enabled := True;
  oFormulario.btnSalvar.Enabled := False;
  oFormulario.btnExcluir.Caption := 'Excluir';
  oFormulario.btnExcluir.Enabled := False;
  LimparCampos;
  DesativarCampos;
end;



procedure TClassInterfaceViewBase.KeyDown(var Key: Word; Aowner: TComponent);
begin
  if key = vk_F2 then
    Pesquisar(Aowner);
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
  oFormulario.btnNovo.Enabled := False;
  oFormulario.btnSalvar.Enabled := True;
  oFormulario.btnExcluir.Caption := 'Cancelar';
  oFormulario.btnExcluir.Enabled := True;
  LimparCampos;
  AtivarCampos;
  AjustarFoco;
end;



procedure TClassInterfaceViewBase.Pesquisar;
begin
  oFormulario.btnNovo.Enabled := False;
  oFormulario.btnSalvar.Enabled := True;
  oFormulario.btnExcluir.Caption := 'Excluir';
  oFormulario.btnExcluir.Enabled := True;
  AtivarCampos;
  AjustarFoco;
end;



procedure TClassInterfaceViewBase.Salvar;
begin
  oFormulario.btnNovo.Enabled := True;
  oFormulario.btnSalvar.Enabled := False;
  oFormulario.btnExcluir.Caption := 'Excluir';
  oFormulario.btnExcluir.Enabled := False;
  if (ValidarVazio) then
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
  iNumeroCampo      := 0   ;
  sSeparador        := #13 ; // Separa os nomes dos campos
  sStringMessage    := ''  ; // zera os nomes dos campos que aparecerão no raise exception
  auxiliar          := True; // auxiliar para não iniciar com caractere especial na mensagem
  iQuantidadeCampos := 0   ;
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TLabeledEdit) then
    begin
      if (oFormulario.Components[iIndice] is TLabeledEdit) then
        sCampo := (oFormulario.Components[iIndice] as TLabeledEdit)
          .EditLabel.Caption;
      itamanho := length(sCampo);
      if ((oFormulario.Components[iIndice] as TLabeledEdit).Text = EmptyStr) and
         ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) and
         ((oFormulario.Components[iIndice] as TWinControl).Tag <> 888) then
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
  end;
  if (iQuantidadeCampos > 1) then
  begin
    raise Exception.Create('Os Campos: ' + #13 + sStringMessage + #13 +
      'Não podem ser vazios');
  end
  else
    Result := True;
end;

end.
