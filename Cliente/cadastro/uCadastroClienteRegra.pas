unit uCadastroClienteRegra;

interface

uses
  System.SysUtils, uCadastroClienteDto,
  uCadastroClienteForm, uCadastroClienteModel,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto,
  uCadastroMunicipioModel, uCadastroMunicipioDto,
  uCadastroUfModel, uCadastroUfDto;

type
  TCadastroClienteRegra = class
  private
  public
    function SelectUfPorDescricao(const oCadastroUfModel: TCadastroUfModel; var oCadastroUfDto: TCadastroUfDto): boolean;
    function SelectUfPorId(const oCadastroUfModel: TCadastroUfModel; var oCadastroUfDto: TCadastroUfDto): boolean;



    function SelectMunicipioPorDescricao(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function SelectMunicipioPorId(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;

    function SelectBairroDescricao(const oCadastroBairroModel: TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;
    function SelectBairroPorId(const oCadastroBairroModel: TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;


    function SelectEndereco(const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto;
       const oCadastroMunicipioModel : TCadastroMunicipioModel ; var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;

    function SalvarEndereco(const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto;
       const oCadastroMunicipioModel : TCadastroMunicipioModel ; var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;


    function SelectDescricao(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function SelectCliente(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Novo(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Salvar(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Deletar(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function ValidaCPF(aCpf : string):boolean;
    function ValidarCNPJ(Acnpj: string): Boolean;

  end;

implementation

{ TCadastroClienteRegra }

function TCadastroClienteRegra.Deletar(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  if (oCadastroClienteModel.SelectCliente(oCadastroClienteDto)) then
  begin
    oCadastroClienteModel.Deletar(oCadastroClienteDto.IdCliente);
    Result := True
  end
end;

function TCadastroClienteRegra.SelectEndereco(
  const oCadastroEnderecoModel: TCadastroEnderecoModel;
  var oCadastroEnderecoDto: TCadastroEnderecoDto;
  const oCadastroBairroModel: TCadastroBairroModel;
  var oCadastroBairroDto: TCadastroBairroDto;
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  oCadastroEnderecoModel.SelectPorId(oCadastroEnderecoDto);

  oCadastroBairroDto.IdBairro := oCadastroEnderecoDto.idbairro;
  oCadastroBairroModel.SelectPorId(oCadastroBairroDto);

  oCadastroMunicipioDto.Id := oCadastroBairroDto.idmunicipio;
  oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
  Result := True
end;

function TCadastroClienteRegra.SelectMunicipioPorDescricao(
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectMunicipio(oCadastroMunicipioDto);
end;

function TCadastroClienteRegra.SelectMunicipioPorId(
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
end;

function TCadastroClienteRegra.SelectUfPorDescricao(
  const oCadastroUfModel: TCadastroUfModel;
  var oCadastroUfDto: TCadastroUfDto): boolean;
begin
 Result := oCadastroUfModel.SelectUf(oCadastroUfDto);
end;

function TCadastroClienteRegra.SelectUfPorId(
  const oCadastroUfModel: TCadastroUfModel;
  var oCadastroUfDto: TCadastroUfDto): boolean;
begin
 Result := oCadastroUfModel.SelectPorId(oCadastroUfDto);
end;

function TCadastroClienteRegra.Novo(const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.NovoId(oCadastroClienteDto);
end;

function TCadastroClienteRegra.Salvar(const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  if (oCadastroClienteModel.SelectCliente(oCadastroClienteDto)) then
  begin
    oCadastroClienteModel.Atualizar(oCadastroClienteDto);
    Result := True
  end
  else
  begin
    oCadastroClienteModel.Inserir(oCadastroClienteDto);
    Result := False;
  end;

end;

function TCadastroClienteRegra.SalvarEndereco(
  const oCadastroEnderecoModel: TCadastroEnderecoModel;
  var oCadastroEnderecoDto: TCadastroEnderecoDto;
  const oCadastroBairroModel: TCadastroBairroModel;
  var oCadastroBairroDto: TCadastroBairroDto;
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := False;
  if(oCadastroBairroModel.SelectPorDescricao(oCadastroBairroDto))then
  begin
    oCadastroEnderecoDto.idbairro := oCadastroBairroDto.IdBairro
  end
  else
  begin
    raise Exception.Create('Esse bairro não possui cadastro' + #13
    +'Por favor vá até o cadastro de bairros e cadastre o mesmo')
  end;

  if(oCadastroMunicipioModel.SelectDescricao(oCadastroMunicipioDto))then
  begin
    if(oCadastroMunicipioDto.id <> oCadastroBairroDto.idmunicipio)then
      raise Exception.Create('Esse bairro não pertence'
      +' a essa cidade, por favor, verifique')
  end
  else
  begin
    raise Exception.Create('Esse municipio não possui cadastro' + #13
    +'Por favor vá até o cadastro de municipios e cadastre o mesmo');
  end;

  if(oCadastroEnderecoModel.SelectPorId(oCadastroEnderecoDto))then
  begin
    if(oCadastroEnderecoModel.Atualizar(oCadastroEnderecoDto))then
      Result := True;
  end
  else
  begin
    if(oCadastroEnderecoModel.Inserir(oCadastroEnderecoDto))then
      Result := True;
  end;
end;

function TCadastroClienteRegra.SelectBairroDescricao(
  const oCadastroBairroModel: TCadastroBairroModel;
  var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
  Result := oCadastroBairroModel.SelectPorDescricao(oCadastroBairroDto);
end;

function TCadastroClienteRegra.SelectBairroPorId(
  const oCadastroBairroModel: TCadastroBairroModel;
  var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
  Result := oCadastroBairroModel.SelectPorId(oCadastroBairroDto);
end;

function TCadastroClienteRegra.SelectCliente(const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.SelectPorId(oCadastroClienteDto);
end;

function TCadastroClienteRegra.SelectDescricao(const oCadastroClienteModel
  : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  if (oCadastroClienteModel.SelectPorNome(oCadastroClienteDto)) then
    Result := True
  else
    Result := oCadastroClienteModel.NovoId(oCadastroClienteDto);
end;

function TCadastroClienteRegra.ValidaCPF(aCpf: string): boolean;
var
  iContador1, iContador2, iSoma, iMultiplicacao: integer;
  iDigito: integer;
  sCPF, sCPFValidado: String;
begin
  sCPF := '00000000000' + trim(Acpf);
  sCPF := copy(sCPF, length(sCPF) - 10, 11);
  sCPFValidado := copy(sCPF, 1, 9);

  for iContador1 := 0 to 1 do
  begin
    iSoma := 0;
    iMultiplicacao := 10 + iContador1;
    for iContador2 := 1 to (9 + iContador1) do
    begin
      iSoma := iSoma + (StrToInt(copy(sCPF, iContador2, 1)) * iMultiplicacao);
      iMultiplicacao := iMultiplicacao - 1;
    end;
    iDigito := iSoma mod 11;
    if iDigito < 2 then
      iDigito := 0
    else
      iDigito := 11 - iDigito;
    sCPFValidado := sCPFValidado + IntToStr(iDigito);
  end;
  if(sCPF = sCPFValidado)then
    Result := True
  else
    Result := False;
end;

function TCadastroClienteRegra.ValidarCNPJ(Acnpj: string): Boolean;
var
  iContador1, iContador2, iSoma, iDigito: integer;
  iControlador, iMultiplicacao, iPosicao: integer;
  sCNPJ, sCNPJValidado: string;

begin
  sCNPJ := '00000000000000' + trim(Acnpj);
  sCNPJ := copy(sCNPJ, length(sCNPJ) - 13, 14);
  sCNPJValidado := copy(sCNPJ, 1, 12);

  for iContador1 := 0 to 1 do
  begin
    iSoma := 0;
    iMultiplicacao := 6 - iContador1;
    iControlador := 0;
    iPosicao := 1;
    for iContador2 := 1 to (12 + iContador1) do
    begin
      iSoma := iSoma + (StrToInt(copy(sCNPJ, iPosicao, 1)) * iMultiplicacao);
      begin
        if (iContador2 = 4 + iContador1) then
          iMultiplicacao := 2
        else
          iMultiplicacao := iMultiplicacao + 1;
      end;
      Inc(iPosicao);

    end;
    iDigito := iSoma mod 11;
    begin
      if iDigito < 2 then
        iDigito := 0
    end;
    sCNPJValidado := sCNPJValidado + IntToStr(iDigito);
  end;
  if(sCNPJ = sCNPJValidado)then
    Result := True
  else
    Result := False;
end;

end.
