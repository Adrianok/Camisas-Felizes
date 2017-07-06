unit uCadastroBairroRegra;

interface

uses
  System.SysUtils, uCadastroBairroDto,
  uCadastroBairroForm, uCadastroBairroModel,
  uCadastroMunicipioModel, uCadastroMunicipioDto;

type
  TCadastroBairroRegra = class
  private
  public

    function SelectMunicipioPorDescricao(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function SelectMunicipioPorId(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function SelectDescricao(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto : TCadastroBairroDto) : boolean;
    function SelectBairro(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto : TCadastroBairroDto) : boolean;
    function Novo(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto : TCadastroBairroDto) : boolean;
    function Salvar(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;
    procedure Deletar(const oCadastroBairroModel : TCadastroBairroModel; const IdBairro : integer);

  end;

var
  oCadastroBairroRegra: TCadastroBairroRegra;

implementation

{ TCadastroBairroRegra }



procedure TCadastroBairroRegra.Deletar(const oCadastroBairroModel: TCadastroBairroModel;
  const IdBairro: integer);
begin
  oCadastroBairroModel.Deletar(IdBairro);
end;

function TCadastroBairroRegra.Novo(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto : TCadastroBairroDto) : boolean;
begin
  Result := oCadastroBairroModel.NovoId(oCadastroBairroDto);
end;

function TCadastroBairroRegra.Salvar(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroBairroDto.IdBairro < 0)then
      oCadastroBairroModel.NovoId(oCadastroBairroDto);

    if(oCadastroBairroModel.SelectPorDescricao(oCadastroBairroDto))then
      if(oCadastroBairroModel.SelectBairro(oCadastroBairroDto))then
      begin
        oCadastroBairroModel.Atualizar(oCadastroBairroDto);
        Result:=True
      end
      else
      begin
        if(oCadastroBairroDto.IdBairro = 0)then
          oCadastroBairroModel.NovoId(oCadastroBairroDto);
        oCadastroBairroModel.Inserir(oCadastroBairroDto);
        Result := False;
      end
    else
      raise Exception.Create('Essa Bairro já foi cadastrada!');


end;

function TCadastroBairroRegra.SelectBairro(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
    Result := oCadastroBairroModel.SelectPorId(oCadastroBairroDto);
end;

function TCadastroBairroRegra.SelectDescricao(const oCadastroBairroModel : TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
  if(oCadastroBairroModel.SelectPorDescricao(oCadastroBairroDto))then
    Result := True
  else
    Result := oCadastroBairroModel.NovoId(oCadastroBairroDto);
end;

function TCadastroBairroRegra.SelectMunicipioPorDescricao(
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectDescricao(oCadastroMunicipioDto);
end;

function TCadastroBairroRegra.SelectMunicipioPorId(
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
end;

end.
