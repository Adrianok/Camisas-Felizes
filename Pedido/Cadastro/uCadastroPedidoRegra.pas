unit uCadastroPedidoRegra;

interface

uses
  System.SysUtils, uCadastroPedidoDto,
  uCadastroPedidoForm, uCadastroPedidoModel,
  uCadastroClienteModel, uCadastroClienteDto,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto,
  uCadastroMunicipioModel, uCadastroMunicipioDto;

type
  TCadastroPedidoRegra = class
  private
  public
    function SelectCliente(const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto : TCadastroClienteDto): boolean;

    function SelectEndereco(const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto;
       const oCadastroMunicipioModel : TCadastroMunicipioModel ; var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;

    function SalvarEndereco(const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto;
       const oCadastroMunicipioModel : TCadastroMunicipioModel ; var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;

    function SelectDescricao(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
    function SelectPedido(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
       const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Deletar(const oCadastroPedidoModel : TCadastroPedidoModel; const IdPedido : integer) : boolean;

    function Novo(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
    function Salvar(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
    const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
  end;

implementation

{ TCadastroPedidoRegra }



function TCadastroPedidoRegra.Deletar(const oCadastroPedidoModel: TCadastroPedidoModel;
  const IdPedido: integer): boolean;
begin
  Result := oCadastroPedidoModel.Deletar(IdPedido);
end;

function TCadastroPedidoRegra.Novo(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
begin
  Result := oCadastroPedidoModel.NovoId(oCadastroPedidoDto);
end;

function TCadastroPedidoRegra.Salvar(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  if(oCadastroClienteModel.SelectPorNome(oCadastroClienteDto))then
    oCadastroPedidoDto.idcliente := oCadastroClienteDto.IdCliente
  else
    raise Exception.Create('Esse cliente não possui cadastro' + #13
    +'Por favor vá até o cadastro de clientes e cadastre o mesmo');

  if(oCadastroPedidoModel.SelectPedido(oCadastroPedidoDto))then
  begin
    oCadastroPedidoModel.Atualizar(oCadastroPedidoDto);
    Result:=True
  end
  else
  begin
    oCadastroPedidoModel.Inserir(oCadastroPedidoDto);
    Result := False;
  end;
end;

function TCadastroPedidoRegra.SalvarEndereco(const oCadastroEnderecoModel: TCadastroEnderecoModel;
var oCadastroEnderecoDto: TCadastroEnderecoDto; const oCadastroBairroModel: TCadastroBairroModel;
var oCadastroBairroDto: TCadastroBairroDto; const oCadastroMunicipioModel: TCadastroMunicipioModel;
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

  if(oCadastroMunicipioModel.SelectPorDescricao(oCadastroMunicipioDto))then
  begin
    if(oCadastroMunicipioDto.IdMunicipio <> oCadastroBairroDto.idmunicipio)then
      raise Exception.Create('Esse bairro não pertence'
      +' a essa cidade, por favor, verifique')
  end
  else
  begin
    raise Exception.Create('Esse municipio não possui cadastro' + #13
    +'Por favor vá até o cadastro de municipios e cadastre o mesmo');
  end;

  if(oCadastroEnderecoModel.SelectEndereco(oCadastroEnderecoDto))then
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

function TCadastroPedidoRegra.SelectPedido
(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
 const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
var
  sAuxiliar : string;
begin
    Result := False;
    if(oCadastroPedidoModel.SelectPorId(oCadastroPedidoDto))then
        oCadastroClienteDto.IdCliente := oCadastroPedidoDto.idcliente;
        if(oCadastroClienteModel.SelectPorId(oCadastroClienteDto))then
          Result  :=  True;
end;


function TCadastroPedidoRegra.SelectCliente(
  const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.SelectPorId(oCadastroClienteDto);
end;

function TCadastroPedidoRegra.SelectDescricao(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto): boolean;
begin
//  if(oCadastroPedidoModel.SelectDescricao(oCadastroPedidoDto))then
//    Result := True
//  else
//    Result := oCadastroPedidoModel.NovoId(oCadastroPedidoDto);
end;

function TCadastroPedidoRegra.SelectEndereco(
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

  oCadastroMunicipioDto.IdMunicipio := oCadastroBairroDto.idmunicipio;
  oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
  Result := True
end;

end.
