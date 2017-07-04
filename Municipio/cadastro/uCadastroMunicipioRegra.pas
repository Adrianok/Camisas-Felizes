unit uCadastroMunicipioRegra;

interface

uses
  System.SysUtils, uCadastroMunicipioDto,
  uCadastroMunicipioForm, uCadastroMunicipioModel,
  uConsultaUfModel, uCadastroUfDto;

type
  TCadastroMunicipioRegra = class
  private
  public
    function SelectDescricao(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function SelectMunicipio(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function Novo(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function Salvar(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function Deletar(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroMunicipioRegra: TCadastroMunicipioRegra;
  oCadastroMunicipioDto: TCadastroMunicipioDto;
  oConsultaUfModel : TConsultaUfModel;
  oCadastroUfDto : TCadastroUfDto;

implementation

{ TCadastroMunicipioRegra }

constructor TCadastroMunicipioRegra.Create;
begin
  if (not(Assigned(oCadastroMunicipioDto))) then
    oCadastroMunicipioDto := TCadastroMunicipioDto.Create;

  if (not(Assigned(oCadastroUfDto))) then
    oCadastroUfDto := TCadastroUfDto.Create;

  if (not(Assigned(oConsultaUfModel))) then
   oConsultaUfModel := TConsultaUfModel.Create;
end;

function TCadastroMunicipioRegra.Deletar(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  if (oCadastroMunicipioModel.SelectMunicipio(oCadastroMunicipioDto)) then
  begin
    oCadastroMunicipioModel.Deletar(oCadastroMunicipioDto);
    Result := True
  end
end;

destructor TCadastroMunicipioRegra.Destroy;
begin
  if (Assigned(oCadastroMunicipioDto)) then
    FreeAndNil(oCadastroMunicipioDto);

  if (Assigned(oCadastroUfDto)) then
    FreeAndNil(oCadastroUfDto);

  if (Assigned(oConsultaUfModel)) then
    FreeAndNil(oConsultaUfModel);
  inherited;
end;

function TCadastroMunicipioRegra.Novo(const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.NovoId(oCadastroMunicipioDto);
end;

function TCadastroMunicipioRegra.Salvar(const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  // fun�ao do model checa se ja existem registros com essas informa��es, caso tenha ent�o retorna true
  if (oCadastroMunicipioModel.SelectMunicipio(oCadastroMunicipioDto)) then
  begin
    oCadastroMunicipioModel.Atualizar(oCadastroMunicipioDto);
    Result := True
  end
  else
  begin
    oCadastroMunicipioModel.Inserir(oCadastroMunicipioDto);
    Result := False;
  end;

end;

function TCadastroMunicipioRegra.SelectMunicipio(const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
end;

function TCadastroMunicipioRegra.SelectDescricao(const oCadastroMunicipioModel
  : TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  if (oCadastroMunicipioModel.SelectDescricao(oCadastroMunicipioDto)) then
    Result := True
  else
    Result := oCadastroMunicipioModel.NovoId(oCadastroMunicipioDto);
end;

end.
