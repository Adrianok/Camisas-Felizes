unit uCadastroMunicipioController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroMunicipioDto, uClasseInterfaceViewBase,
  uClasseInterfaceConsultaBase,
  uCadastroMunicipioRegra, uCadastroMunicipioModel,
  uCadastroMunicipioForm, uInterfaceViewBase,
  uConsultaMunicipioForm, uConsultaMunicipioController,
  uConsultaUfController, uConsultaUfRegra, uConsultaUfModel,
  uCadastroUfDto, uCadastroUfModel;

  type
  TCadastroMunicipioController = class(TClassInterfaceViewBase)
  private
    oCadastroMunicipioModel       : TCadastroMunicipioModel;
    oCadastroMunicipioDto         : TCadastroMunicipioDto;
    oCadastroMunicipioRegra       : TCadastroMunicipioRegra;
    oCadastroUfDto                : TCadastroUfDto;
    oCadastroUfModel              : TCadastroUfModel;

    procedure RetornoMunicipio(AID: Integer);
    procedure RetornoEstado(AID: Integer);
  public
    procedure Inicial; override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);  override;
    procedure NovoID;
    procedure Excluir; override;

    constructor Create;
    destructor Destroy; override;
  end;
var
  oCadastroMunicipioController: IInterfaceViewBase;

implementation

{ TControllerCadastroMunicipio }

constructor TCadastroMunicipioController.Create;
begin
  if (not(assigned(oCadastroMunicipioModel))) then
    oCadastroMunicipioModel := TCadastroMunicipioModel.Create;

  if (not(assigned(oCadastroMunicipioDto))) then
    oCadastroMunicipioDto := TCadastroMunicipioDto.Create;

  if (not(assigned(oCadastroUfDto))) then
    oCadastroUfDto := TCadastroUfDto.Create;

  if (not(assigned(oCadastroUfModel))) then
    oCadastroUfModel := TCadastroUfModel.Create;

  if (not(assigned(oCadastroMunicipioRegra))) then
    oCadastroMunicipioRegra := TCadastroMunicipioRegra.Create;
end;

procedure TCadastroMunicipioController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroMunicipioForm.Create(Aowner);
  oFormulario.oController := oCadastroMunicipioController;
  oFormulario.Show;
  inherited;
end;

procedure TCadastroMunicipioController.Excluir;
begin
  inherited;
  if (oCadastroMunicipioRegra.Deletar(oCadastroMunicipioModel,
    oCadastroMunicipioDto)) then
    ShowMessage('Registro deletado com sucesso')
end;

destructor TCadastroMunicipioController.Destroy;
begin
  if (assigned(oCadastroUfModel)) then
    FreeAndNil(oCadastroUfModel);

  if (assigned(oCadastroMunicipioModel)) then
    FreeAndNil(oCadastroMunicipioModel);

  if (assigned(oCadastroMunicipioDto)) then
    FreeAndNil(oCadastroMunicipioDto);

  if (assigned(oCadastroMunicipioRegra)) then
    FreeAndNil(oCadastroMunicipioRegra);

  if (assigned(oCadastroUfDto)) then
    FreeAndNil(oCadastroUfDto);

  inherited;
end;

procedure TCadastroMunicipioController.Inicial;
begin
  inherited;

end;

procedure TCadastroMunicipioController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroMunicipioController.NovoID;
begin
  if (oCadastroMunicipioRegra.Novo(oCadastroMunicipioModel, oCadastroMunicipioDto)) then
    (oFormulario as TCadastroMunicipioForm).EdtCodigo.Text := IntToStr(oCadastroMunicipioDto.Id);
end;

procedure TCadastroMunicipioController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
  sIdMunicipio: string;
begin
    inherited;
    with (oFormulario as TCadastroMunicipioForm) do
    begin
      if (sIdMunicipio <> '') then
      begin
        oCadastroMunicipioDto.Municipio := (oFormulario as TCadastroMunicipioForm).EdtMunicipio.Text;
      end;
    end;

    if(ActiveControl =  (oFormulario as TCadastroMunicipioForm).EdtEstado) then
    begin
      if (not(assigned(oConsultaUfController))) then
        oConsultaUfController := TConsultaUfController.Create;
      oConsultaUfController.CriarForm(AOwner, RetornoEstado, (oFormulario as TCadastroMunicipioForm).EdtEstado.Text);
    end
    else
    begin
      if (not(assigned(oConsultaMunicipioController))) then
        oConsultaMunicipioController := TConsultaMunicipioController.Create;
      oConsultaMunicipioController.CriarForm(AOwner, RetornoMunicipio, (oFormulario as TCadastroMunicipioForm).EdtMunicipio.Text);
    end;
end;

procedure TCadastroMunicipioController.RetornoEstado(AID: Integer);
begin
  with (oFormulario as TCadastroMunicipioForm) do
  begin
    if(AID > 0)then
    begin
      oCadastroUfDto.id :=  AID;
      if(oCadastroMunicipioRegra.SelectUfPorId(oCadastroUfModel, oCadastroUfDto))then
      begin
          EdtEstado.Text := oCadastroUfDto.uf;
      end;
    end;
  end;
end;

procedure TCadastroMunicipioController.RetornoMunicipio(AID: Integer);
begin
  with (oFormulario as TCadastroMunicipioForm) do
  begin
    if(AID > 0)then
    begin

      oCadastroMunicipioDto.id :=  AID;
      if(oCadastroMunicipioRegra.SelectMunicipio(oCadastroMunicipioModel, oCadastroMunicipioDto))then
      begin
        EdtCodigo.Text :=   IntToStr(oCadastroMunicipioDto.id);
        EdtMunicipio.Text    :=  oCadastroMunicipioDto.Municipio;
        oCadastroUfDto.id := oCadastroMunicipioDto.id;
        if(oCadastroMunicipioRegra.SelectUfPorId(oCadastroUfModel, oCadastroUfDto))then
          EdtEstado.Text := oCadastroUfDto.nome;
      end;
    end;
  end;
end;

procedure TCadastroMunicipioController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroMunicipioForm) do
  begin
    oCadastroMunicipioDto.Id := StrToInt(EdtCodigo.Text);
    oCadastroMunicipioDto.Municipio := EdtMunicipio.Text;
    if(oCadastroMunicipioRegra.SelectUfPorDescricao(oCadastroUfModel, oCadastroUfDto))then
      oCadastroMunicipioDto.Estado := oCadastroUfDto.id;
  end;
  if (oCadastroMunicipioRegra.Salvar(oCadastroMunicipioModel,
    oCadastroMunicipioDto)) then
  begin
    ShowMessage('Registro: ' + oCadastroMunicipioDto.Municipio +
      ' Atualizado com sucesso')
  end
  else
  begin
    ShowMessage('Registro: ' + oCadastroMunicipioDto.Municipio +
      ' Inserido com sucesso');
  end;
end;

end.
