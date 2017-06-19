unit uCadastroMunicipioController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroMunicipioDto, uClasseInterfaceViewBase,
  uCadastroMunicipioRegra, uCadastroMunicipioModel,
  uCadastroMunicipioForm, uInterfaceViewBase,
  uConsultaMunicipioForm, uConsultaMunicipioController;

type
  TCadastroMunicipioController = class(TClassInterfaceViewBase)
  private
  public
    procedure Inicial; override;
    procedure Consulta; override;
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
  if (oCadastroMunicipioDto.Id > -1) then
  begin
    if (oCadastroMunicipioRegra.SelectMunicipio(oCadastroMunicipioModel, oCadastroMunicipioDto)) then
      with (oFormulario as TCadastroMunicipioForm) do
      begin
        ledtCodigo.Text := IntToStr(oCadastroMunicipioDto.Id);
        LedtMunicipio.Text := oCadastroMunicipioDto.municipio;
        LedtEstado.Text := oCadastroMunicipioDto.estado;
      end;
  end
  else
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
  inherited;
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroMunicipioForm.Create(Aowner);
  oFormulario.oController := oCadastroMunicipioController;
  oFormulario.Show;
end;

procedure TCadastroMunicipioController.Excluir;
begin
  inherited;
  if (oCadastroMunicipioRegra.Deletar(oCadastroMunicipioModel, oCadastroMunicipioDto)) then
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
 sIdMunicipio : string;
begin
  inherited;
  if(sIdMunicipio <> '')then
    oCadastroMunicipioDto.id          :=  StrToInt(sIdMunicipio);
    oCadastroMunicipioDto.municipio   :=(oFormulario as TCadastroMunicipioForm).ledtMunicipio.Text;
    oCadastroMunicipioDto.estado      := (oFormulario as TCadastroMunicipioForm).LedtEstado.Text;

  if (not(assigned(oConsultaMunicipioController))) then
    oConsultaMunicipioController := TConsultaMunicipioController.Create;
  oConsultaMunicipioController.CriarForm(Aowner);
end;

procedure TCadastroMunicipioController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroMunicipioForm) do
  begin
    oCadastroMunicipioDto.Id   := StrToInt(ledtCodigo.Text);
    oCadastroMunicipioDto.municipio  := ledtMunicipio.Text;
    oCadastroMunicipioDto.estado     := LedtEstado.Text;
  end;
  if (oCadastroMunicipioRegra.Salvar(oCadastroMunicipioModel, oCadastroMunicipioDto)) then
    ShowMessage('Registro: ' + oCadastroMunicipioDto.municipio + ' Atualizado com sucesso')
  else
  begin
    ShowMessage('Registro: ' + oCadastroMunicipioDto.municipio + ' Inserido com sucesso');
  end;
end;

end.
