unit uClasseInterfaceViewBase;

interface

uses
  uInterfaceViewBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms,Vcl.ComCtrls, Vcl.Controls,
  System.Classes, System.UITypes,
  uConsultaBase, Winapi.Windows,
  Winapi.Messages;

type
  TClassInterfaceViewBase = class(TInterfacedObject, IInterfaceViewBase)
  private
  protected
    oFormulario: TfrmBase;
    const NAOVALIDA : Integer = 999;
    const NAOVALIDACTC : Integer = 888;
  public
    procedure CriarForm(Aowner: TComponent); virtual;
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl); virtual;
    procedure Inicial; virtual;
    procedure Novo; virtual;
    procedure Verificar(ActiveControl: TWinControl); virtual;
    procedure Salvar; virtual;
    procedure Aguardando; virtual;
    procedure KeyDown(var Key: Word; Aowner: TComponent; AcTiveControl: TWinControl);
    function ValidarVazio: boolean;
    procedure Excluir; virtual;
    procedure Fechar;
    procedure AjustarFoco;
    procedure AtivarCampos;
    procedure DesativarCampos;
    procedure LimparCampos; virtual;
  end;

implementation

{ TClassInterface }

//Tag = 999 nao valida, nao ativa
//tag = 888 nao valida
//tag = 666 ativa e desativa




// Aqui vão ficar todos as alterações que são padroes para todo formulario
// tais como botões que ativam e desativam
procedure TClassInterfaceViewBase.Aguardando;
begin
  oFormulario.btnNovo.Enabled := False;
  oFormulario.btnSalvar.Enabled := True;
  oFormulario.btnExcluir.Enabled := True;
end;

procedure TClassInterfaceViewBase.AjustarFoco;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TWinControl) and
        ((oFormulario.Components[iIndice] as TWinControl).tag <> NAOVALIDA)and
         ((oFormulario.Components[iIndice] as TWinControl).tag <> NAOVALIDACTC)and
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
  begin
   if((oFormulario.Components[iIndice] is TWinControl))then
    if((oFormulario.Components[iIndice] as TWinControl).Tag = 666)then
      (oFormulario.Components[iIndice] as TWinControl).Enabled := True;


   if((oFormulario.Components[iIndice] is TCustomEdit) or
       (oFormulario.Components[iIndice] is TGroupBox))   and
      ((oFormulario.Components[iIndice] as TWinControl).Tag <> NAOVALIDA) then
      (oFormulario.Components[iIndice] as TWinControl).Enabled := True
    else if(oFormulario.Components[iIndice] is TLabel)then
      (oFormulario.Components[iIndice] as TLabel).Enabled := True
    else if(oFormulario.Components[iIndice] is TDateTimePicker) then
      (oFormulario.Components[iIndice] as TDateTimePicker).Enabled := True;
  end;
end;



procedure TClassInterfaceViewBase.CriarForm(Aowner: TComponent);
var
  iIndice : integer;
begin
end;



procedure TClassInterfaceViewBase.DesativarCampos;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
  begin
   if((oFormulario.Components[iIndice] is TWinControl))then
    if((oFormulario.Components[iIndice] as TWinControl).Tag = 666)then
      (oFormulario.Components[iIndice] as TWinControl).Enabled := False;

    if((oFormulario.Components[iIndice] is TCustomEdit) or
        (oFormulario.Components[iIndice] is TGroupBox))     and
       ((oFormulario.Components[iIndice] as TWinControl).Tag <> NAOVALIDA) then
        (oFormulario.Components[iIndice] as TWinControl).Enabled := False
    else if(oFormulario.Components[iIndice] is TLabel)then
      (oFormulario.Components[iIndice] as TLabel).Enabled := False
    else if(oFormulario.Components[iIndice] is TDateTimePicker) then
      (oFormulario.Components[iIndice] as TDateTimePicker).Enabled := False;
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
  oFormulario.btnExcluir.Enabled := False;
  LimparCampos;
end;



procedure TClassInterfaceViewBase.KeyDown(var Key: Word; Aowner: TComponent; ActiveControl : TWinControl);
begin
  if key = vk_F2 then
    Pesquisar(Aowner, ActiveControl)
  else
  if key = VK_RETURN then
  begin
    Verificar(AcTiveControl);
    char(Key) := #0;
    oFormulario.Perform(WM_NEXTDLGCTL,0, 0);
  end;
end;



procedure TClassInterfaceViewBase.LimparCampos;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TCustomEdit) then
    begin
      (oFormulario.Components[iIndice] as TCustomEdit).Text := EmptyStr;
    end;
end;



procedure TClassInterfaceViewBase.Novo;
begin
  oFormulario.btnNovo.Enabled := False;
  oFormulario.btnSalvar.Enabled := True;
  oFormulario.btnExcluir.Enabled := True;
  LimparCampos;
  AjustarFoco;
end;



procedure TClassInterfaceViewBase.Pesquisar(Aowner: TComponent; ActiveControl: TWinControl);
begin
  oFormulario.btnNovo.Enabled := True;
  oFormulario.btnSalvar.Enabled := True;
  oFormulario.btnExcluir.Enabled := True;
  AtivarCampos;
  AjustarFoco;
end;



procedure TClassInterfaceViewBase.Salvar;
begin
  oFormulario.btnNovo.Enabled := True;
  oFormulario.btnSalvar.Enabled := False;
  oFormulario.btnExcluir.Enabled := False;
  ValidarVazio;
end;



function TClassInterfaceViewBase.ValidarVazio: boolean;
var
  sSeparador: string;
  iIndice: integer;
  sStringMessage: string;
  auxiliar: boolean;
  sCampo: string;
  iQuantidadeCampos: integer;
  iNumeroCampo: integer;
begin
  inherited;
  iNumeroCampo      := 0    ;
  sSeparador        := #13  ; // Separa os nomes dos campos
  sStringMessage    := ''   ; // zera os nomes dos campos que aparecerão no raise exception
  auxiliar          := True ; // auxiliar para não iniciar com caractere especial na mensagem
  iQuantidadeCampos := 0    ;

  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
  begin
    if((oFormulario.Components[iIndice] is TLabeledEdit))then
    begin
      sCampo := (oFormulario.Components[iIndice] as TWinControl).Hint;
      if (((oFormulario.Components[iIndice] as TCustomEdit).Text = EmptyStr) and
         ((oFormulario.Components[iIndice] as TWinControl).Tag <> NAOVALIDA) and
         ((oFormulario.Components[iIndice] as TWinControl).Tag <> NAOVALIDACTC) and
          (oFormulario.Components[iIndice] as TWinControl).Enabled) then
      begin
        if (auxiliar = False) then
          sStringMessage := sStringMessage + sSeparador;
        sStringMessage := sStringMessage + sCampo;
        auxiliar := False;
        iQuantidadeCampos := iQuantidadeCampos + 1;
        if (iQuantidadeCampos = 1) then
          iNumeroCampo := iIndice;
      end;

    end;
  end;
  if (iQuantidadeCampos = 1) then
  begin
    (oFormulario.Components[iNumeroCampo] as TWinControl).SetFocus;
    raise Exception.Create('O Campo: ' + #13 + sStringMessage + #13 +
      'Não pode ser vazio');
    Aguardando;
  end;
  if (iQuantidadeCampos > 1) then
  begin
    raise Exception.Create('Os Campos: ' + #13 + sStringMessage + #13 +
      'Não podem ser vazios');
    Aguardando;
  end
  else
    Result := True;
end;

procedure TClassInterfaceViewBase.Verificar(ActiveControl: TWinControl);
begin
  if((ActiveControl is TCustomEdit) and ((ActiveControl.Tag <> NAOVALIDA)and
    ((ActiveControl.Tag <> NAOVALIDACTC))))then
    if((ActiveControl as TCustomEdit).Text = '')then
    begin
      raise Exception.Create('O Campo: '+ ActiveControl.Hint + #13 +'Deve ser preenchido');
      (ActiveControl as TCustomEdit).SetFocus;
    end;
end;
end.
