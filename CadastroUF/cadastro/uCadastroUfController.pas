unit uCadastroUfController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroUfDto, uClasseInterfaceViewBase,
  uCadastroUfRegra, uCadastroUfModel,
  uCadastroUfForm, uInterfaceViewBase,
  uConsultaUfForm, uConsultaUfController;

type
  TCadastroUfController = class(TClassInterfaceViewBase)
  private
    oCadastroUfDto : TCadastroUfDto;
    oCadastroUfModel : TCadastroUfModel;
    oCadastroUfRegra: TCadastroUfRegra;
    oForm : TCadastroUfForm;
    procedure RetornoUf(aIdUf: integer);
  public
    procedure Inicial; override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure Verificar(ActiveControl: TWinControl);  override;
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl); override;
    procedure NovoID;
    procedure Excluir; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroUfController: IInterfaceViewBase;

implementation

{ TControllerCadastroUf }


constructor TCadastroUfController.Create;
begin
  if (not(assigned(oCadastroUfModel))) then
    oCadastroUfModel := TCadastroUfModel.Create;

  if (not(assigned(oCadastroUfDto))) then
    oCadastroUfDto := TCadastroUfDto.Create;

  if (not(assigned(oCadastroUfRegra))) then
    oCadastroUfRegra := TCadastroUfRegra.Create;
end;

procedure TCadastroUfController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroUfForm.Create(Aowner);
  oFormulario.oController := oCadastroUfController;
  oFormulario.Show;
  oForm := (oFormulario as TCadastroUfForm);
  inherited;
end;

procedure TCadastroUfController.Excluir;
begin
  inherited;
  if (oCadastroUfRegra.Deletar(oCadastroUfModel, oCadastroUfDto)) then
    ShowMessage('Registro deletado com sucesso')
end;

destructor TCadastroUfController.Destroy;
begin
  if (assigned(oCadastroUfModel)) then
    FreeAndNil(oCadastroUfModel);

  if (assigned(oCadastroUfDto)) then
    FreeAndNil(oCadastroUfDto);

  if (assigned(oCadastroUfRegra)) then
    FreeAndNil(oCadastroUfRegra);

  inherited;
end;

procedure TCadastroUfController.Inicial;
begin
  inherited;

end;

procedure TCadastroUfController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroUfController.NovoID;
begin
  if (oCadastroUfRegra.Novo(oCadastroUfModel, oCadastroUfDto)) then
    (oFormulario as TCadastroUfForm).ledtCodigo.Text := IntToStr(oCadastroUfDto.Id);
end;

procedure TCadastroUfController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
 sIdUf : string;
begin
  inherited;
  if(sIdUf <> '')then
    oCadastroUfDto.id   :=  StrToInt(sIdUf);
    oCadastroUfDto.uf   :=(oFormulario as TCadastroUfForm).ledtUf.Text;
    oCadastroUfDto.nome := (oFormulario as TCadastroUfForm).LedtNome.Text;

  if (not(assigned(oConsultaUfController))) then
    oConsultaUfController := TConsultaUfController.Create;
  oConsultaUfController.CriarForm(Aowner, RetornoUf, oCadastroUfDto.uf);
end;

procedure TCadastroUfController.RetornoUf(aIdUf: integer);
begin
  if (aIdUf > 0) then
  begin
    oCadastroUfDto.Id := aIdUf;
    if (oCadastroUfRegra.SelectUf(oCadastroUfModel, oCadastroUfDto)) then
      with (oFormulario as TCadastroUfForm) do
      begin
        ledtCodigo.Text := IntToStr(oCadastroUfDto.Id);
        ledtUf.Text := oCadastroUfDto.uf;
        ledtNome.Text := oCadastroUfDto.nome;
      end;
  end;
end;

procedure TCadastroUfController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroUfForm) do
  begin
    oCadastroUfDto.Id := StrToInt(ledtCodigo.Text);
    oCadastroUfDto.uf := ledtUf.Text;
    oCadastroUfDto.nome := ledtNome.Text;
  end;
  if(oCadastroUfRegra.SelectDescricao(oCadastroUfModel, oCadastroUfDto))then
    if((oForm.LedtCodigo.Text <> IntToStr(oCadastroUfDto.id))and( oForm.LedtCodigo.Text <> ''))then
      raise Exception.Create('Esta unidade federal já possui cadastro');
  if (oCadastroUfRegra.Salvar(oCadastroUfModel, oCadastroUfDto)) then
    ShowMessage('Registro: ' + oCadastroUfDto.uf + ' Atualizado com sucesso')
  else
  begin
    ShowMessage('Registro: ' + oCadastroUfDto.uf + ' Inserido com sucesso');
  end;
end;

procedure TCadastroUfController.Verificar(ActiveControl: TWinControl);
begin
  if(ActiveControl = oForm.LedtUf)then
  begin
    if(oCadastroUfRegra.SelectDescricao(oCadastroUfModel, oCadastroUfDto))then
    begin
      oForm.LedtNome.Text := oCadastroUfDto.nome;
      oForm.LedtCodigo.Text := IntToStr(oCadastroUfDto.id);
    end;
  end
  else
  if(ActiveControl = oForm.LedtCodigo)then
  begin
    if(oForm.LedtCodigo.Text <> '')then
      RetornoUf(StrToInt(oForm.LedtCodigo.Text))
    else
      NovoID;

  end;
end;

end.
