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
  uCadastroUfDto;

  type
  TCadastroMunicipioController = class(TClassInterfaceViewBase)
  private
    procedure RetornoEstado(AID: Integer);

  public
    procedure Inicial; override;
    procedure Consulta;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure Pesquisar(Aowner: TComponent); override;
    procedure NovoID;
    procedure Excluir; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroMunicipioController: IInterfaceViewBase;

implementation

{ TControllerCadastroMunicipio }

procedure TCadastroMunicipioController.Consulta;
begin
  inherited;
  if (oCadastroMunicipioDto.Id > 0) then
  begin
    if (oCadastroMunicipioRegra.SelectMunicipio(oCadastroMunicipioModel,
      oCadastroMunicipioDto)) then
      with (oFormulario as TCadastroMunicipioForm) do
      begin
        ledtCodigo.Text := IntToStr(oCadastroMunicipioDto.Id);
        ledtMunicipio.Text := oCadastroMunicipioDto.Municipio;
        ledtEstado.Text := IntToStr(oCadastroMunicipioDto.Estado);
      end;
  end
  else if (oCadastroMunicipioDto.Municipio = '!') then
  begin
    ShowMessage('Nenhum Registro Selecionado');
    Inicial;
  end;
end;

constructor TCadastroMunicipioController.Create;
begin
  if (not(assigned(oCadastroMunicipioModel))) then
    oCadastroMunicipioModel := TCadastroMunicipioModel.Create;

  if (not(assigned(oCadastroMunicipioDto))) then
    oCadastroMunicipioDto := TCadastroMunicipioDto.Create;

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
  if (assigned(oCadastroMunicipioModel)) then
    FreeAndNil(oCadastroMunicipioModel);

  if (assigned(oCadastroMunicipioDto)) then
    FreeAndNil(oCadastroMunicipioDto);

  if (assigned(oCadastroMunicipioRegra)) then
    FreeAndNil(oCadastroMunicipioRegra);

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
    (oFormulario as TCadastroMunicipioForm).ledtCodigo.Text := IntToStr(oCadastroMunicipioDto.Id);
end;

procedure TCadastroMunicipioController.Pesquisar(Aowner: TComponent);
var
  sIdMunicipio: string;
  ControleAtivo: TWinControl;
begin
  inherited;
  with (oFormulario as TCadastroMunicipioForm) do
  begin
    if (sIdMunicipio <> '') then
    begin
      oCadastroMunicipioDto.Id := StrToInt(sIdMunicipio);
      oCadastroMunicipioDto.Municipio := (oFormulario as TCadastroMunicipioForm).ledtMunicipio.Text;
      oCadastroMunicipioDto.Estado := StrToInt(ledtEstado.Text);
    end;


    if (Aowner = ledtEstado.Text) then
    begin
      oConsultaUfController := TConsultaUfController.Create;
      oConsultaUfController.CriarForm(oFormulario, RetornoEstado);
    end
    else
    begin
      if (not(assigned(oConsultaMunicipioController))) then
        oConsultaMunicipioController := TConsultaMunicipioController.Create;
      oConsultaMunicipioController.CriarForm(oFormulario, RetornoEstado);
    end;
  end;
end;

procedure TCadastroMunicipioController.RetornoEstado(AID: Integer);
begin
  if(AID <> 0)then
  begin
    oCadastroMunicipioDto.id :=  AID;
    if(oCadastroMunicipioRegra.SelectMunicipio(oCadastroMunicipioModel, oCadastroMunicipioDto))then
    with (oFormulario as TCadastroMunicipioForm) do
    begin
      LedtCodigo.Text :=   IntToStr(oCadastroMunicipioDto.id);
      LedtMunicipio.Text    :=  oCadastroMunicipioDto.Municipio;
      LedtEstado.Text    :=  oCadastroMunicipioDto.estado;
    end;
  end
  else
  raise Exception.Create('Não foi escolhido registro');
end;

procedure TCadastroMunicipioController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroMunicipioForm) do
  begin
    oCadastroMunicipioDto.Id := StrToInt(ledtCodigo.Text);
    oCadastroMunicipioDto.Municipio := ledtMunicipio.Text;
    oCadastroMunicipioDto.Estado := ledtEstado.Text;
  end;
  if (oCadastroMunicipioRegra.Salvar(oCadastroMunicipioModel,
    oCadastroMunicipioDto)) then
    ShowMessage('Registro: ' + oCadastroMunicipioDto.Municipio +
      ' Atualizado com sucesso')
  else
  begin
    ShowMessage('Registro: ' + oCadastroMunicipioDto.Municipio +
      ' Inserido com sucesso');
  end;
end;

end.
