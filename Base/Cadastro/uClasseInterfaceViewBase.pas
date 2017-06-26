unit uClasseInterfaceViewBase;

interface

uses
  uInterfaceViewBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms,Vcl.ComCtrls, Vcl.Controls,
  System.Classes, System.UITypes,
  uConsultaBase, Winapi.Windows;

type
  TClassInterfaceViewBase = class(TInterfacedObject, IInterfaceViewBase)
  private
  protected
    oFormulario: TfrmBase;
  public
    procedure CriarForm(Aowner: TComponent); virtual;
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl); virtual;
    procedure Inicial; virtual;
    procedure Novo; virtual;
    procedure Salvar; virtual;
    procedure Aguardando;
    procedure KeyDown(var Key: Word; Aowner: TComponent; AcTiveControl: TWinControl);
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

//Tag = 999 nao valida, nao ativa
//tag = 888 nao valida
//tag = 666 ativa e desativa




// Aqui v�o ficar todos as altera��es que s�o padroes para todo formulario
// tais como bot�es que ativam e desativam
procedure TClassInterfaceViewBase.Aguardando;
begin
  oFormulario.btnNovo.Enabled := False;
  oFormulario.btnSalvar.Enabled := True;
  oFormulario.btnExcluir.Caption := 'Cancelar';
  oFormulario.btnExcluir.Enabled := True;
end;

procedure TClassInterfaceViewBase.AjustarFoco;
var
  iIndice: integer;
begin
  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
    if (oFormulario.Components[iIndice] is TWinControl) and
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
  begin
   if((oFormulario.Components[iIndice] is TWinControl))then
    if((oFormulario.Components[iIndice] as TWinControl).Tag = 666)then
      (oFormulario.Components[iIndice] as TWinControl).Enabled := True;


   if((oFormulario.Components[iIndice] is TCustomEdit) or
       (oFormulario.Components[iIndice] is TGroupBox))   and
      ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) then
      (oFormulario.Components[iIndice] as TWinControl).Enabled := True
    else if(oFormulario.Components[iIndice] is TLabel)then
      (oFormulario.Components[iIndice] as TLabel).Enabled := True
    else if(oFormulario.Components[iIndice] is TDateTimePicker) then
      (oFormulario.Components[iIndice] as TDateTimePicker).Enabled := True;
  end;
end;



procedure TClassInterfaceViewBase.CriarForm(Aowner: TComponent);
begin
  DesativarCampos;
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
       ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) then
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
  oFormulario.btnExcluir.Caption := 'Excluir';
  oFormulario.btnExcluir.Enabled := False;
  LimparCampos;
  DesativarCampos;
end;



procedure TClassInterfaceViewBase.KeyDown(var Key: Word; Aowner: TComponent; ActiveControl : TWinControl);
begin
  if key = vk_F2 then
    Pesquisar(Aowner, ActiveControl);
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
  oFormulario.btnExcluir.Caption := 'Cancelar';
  oFormulario.btnExcluir.Enabled := True;
  LimparCampos;
  AtivarCampos;
  AjustarFoco;
end;



procedure TClassInterfaceViewBase.Pesquisar(Aowner: TComponent; ActiveControl: TWinControl);
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
  sCampo: string;
  iQuantidadeCampos: integer;
  iNumeroCampo: integer;
begin
  inherited;
  iNumeroCampo      := 0    ;
  sSeparador        := #13  ; // Separa os nomes dos campos
  sStringMessage    := ''   ; // zera os nomes dos campos que aparecer�o no raise exception
  auxiliar          := True ; // auxiliar para n�o iniciar com caractere especial na mensagem
  iQuantidadeCampos := 0    ;

  for iIndice := 0 to (oFormulario.ComponentCount - 1) do
  begin
    if((oFormulario.Components[iIndice] is TLabeledEdit))then
    begin
      sCampo := (oFormulario.Components[iIndice] as TWinControl).Hint;
      if (((oFormulario.Components[iIndice] as TCustomEdit).Text = EmptyStr) and
         ((oFormulario.Components[iIndice] as TWinControl).Tag <> 999) and
         ((oFormulario.Components[iIndice] as TWinControl).Tag <> 888) and
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
      'N�o pode ser vazio');
    Aguardando;
  end;
  if (iQuantidadeCampos > 1) then
  begin
    raise Exception.Create('Os Campos: ' + #13 + sStringMessage + #13 +
      'N�o podem ser vazios');
    Aguardando;
  end
  else
    Result := True;
end;

end.
