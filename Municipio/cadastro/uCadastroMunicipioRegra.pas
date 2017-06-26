unit uCadastroMunicipioRegra;

interface

uses
  System.SysUtils, uCadastroMunicipioDto,
  uCadastroMunicipioForm, uCadastroMunicipioModel,
  uConsultaUfModel;

type
  TCadastroMunicipioRegra = class
  private
  public
    function SelectDescricao(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function SelectMunicipio(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function Novo(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function Salvar(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function Deletar(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;

  end;

var
  oCadastroMunicipioRegra: TCadastroMunicipioRegra;

implementation

{ TCadastroMunicipioRegra }

function TCadastroMunicipioRegra.Deletar(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  if (oCadastroMunicipioModel.SelectMunicipio(oCadastroMunicipioDto)) then
  begin
    oCadastroMunicipioModel.Deletar(oCadastroMunicipioDto);
    Result := True
  end
end;

function TCadastroMunicipioRegra.Novo(const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.NovoId(oCadastroMunicipioDto);
end;

function TCadastroMunicipioRegra.Salvar(const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  // funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
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
  if (oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto)) then
    oConsultaUfModel.SelectId(IntToStr(oCadastroMunicipioDto.estado));
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
