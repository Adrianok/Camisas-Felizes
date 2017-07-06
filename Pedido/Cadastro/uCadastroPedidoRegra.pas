unit uCadastroPedidoRegra;

interface

uses
  System.SysUtils, uCadastroPedidoDto,
  uCadastroPedidoForm, uCadastroPedidoModel,
  uCadastroClienteModel, uCadastroClienteDto,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto,
  uCadastroMunicipioModel, uCadastroMunicipioDto,
  uCadastroTamanhoModel, uCadastroTamanhoDto,
  uCadastroCorModel, uCadastroCorDto,
  uCadastroModeloModel, uCadastroModeloDto,
  uCadastroItensPedidoModel, uCadastroItensDto,
  uCadastroDetalhesItensModel, uCadastroDetalheItemDto;

type
  TCadastroPedidoRegra = class
  private
  public

    procedure InserirItens(const oCadastroPedidoModel: TCadastroPedidoModel;
      const oCadastroItensPedidoModel: TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel; const oCadastroPedidoDto: TCadastroPedidoDto);

    function SelectModeloPorDescricao(const oCadastroModeloModel: TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;

    function SelectModeloPorId(const oCadastroModeloModel: TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;

    function SelectMunicipioPorDescricao(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
    function SelectMunicipioPorId(const oCadastroMunicipioModel: TCadastroMunicipioModel; var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;

    function SelectBairroDescricao(const oCadastroBairroModel: TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;
    function SelectBairroPorId(const oCadastroBairroModel: TCadastroBairroModel; var oCadastroBairroDto: TCadastroBairroDto): boolean;

    function SelectCorPorDescricao(const oCadastroCorModel: TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
    function SelectCorPorId(const oCadastroCorModel: TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;

    function SelectTamanhoPorDescricao(const oCadastroTamanhoModel: TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
    function SelectTamanhoPorId(const oCadastroTamanhoModel: TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
    function SelectClientePorCpf(const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto : TCadastroClienteDto): boolean;

    function SelectCliente(const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto : TCadastroClienteDto): boolean;

    function SelectEndereco(const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto;
       const oCadastroMunicipioModel : TCadastroMunicipioModel ; var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;

    function SalvarEndereco(const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto;
       const oCadastroMunicipioModel : TCadastroMunicipioModel ; var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;

    function SelectDescricao(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;

    function SelectPedido(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
       const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto;
       const oCadastroItensPedidoModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel): boolean;

    function DeletarItens(  const oCadastroPedidoDto: TCadastroPedidoDto; const oCadastroItensModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel) : boolean;

    function Deletar(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto;
     const oCadastroItensModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel) : boolean;

    function Novo(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
    function Salvar(const oCadastroPedidoModel : TCadastroPedidoModel; const oCadastroPedidoDto: TCadastroPedidoDto;
    const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto;
    const oCadastroItensPedidoModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel): boolean;
  end;

implementation

{ TCadastroPedidoRegra }

function TCadastroPedidoRegra.Deletar(const oCadastroPedidoModel: TCadastroPedidoModel;
  var oCadastroPedidoDto : TCadastroPedidoDto;
  const oCadastroItensModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel) : boolean;
begin
  DeletarItens(oCadastroPedidoDto, oCadastroItensModel, oCadastroDetalhesItensModel);
  Result := oCadastroPedidoModel.Deletar(oCadastroPedidoDto.IdPedido);
end;

function TCadastroPedidoRegra.DeletarItens(
  const oCadastroPedidoDto: TCadastroPedidoDto;
  const oCadastroItensModel: TCadastroItensPedidoModel;
  const oCadastroDetalhesItensModel: TCadastroDetalheItensModel): boolean;
var
  oLoopControlItens : TCadastroItensDto;
  oLoopControlDetalhe : TCadastroDetalheItemDto;
begin
    for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values do
    begin
      for oLoopControlDetalhe in oLoopControlItens.DetalheItem.Values do
      begin
        oCadastroDetalhesItensModel.Deletar(oLoopControlDetalhe.IdDetalhe);
      end;
      oCadastroItensModel.Deletar(oLoopControlItens.IdItensPedido);
    end;
end;

procedure TCadastroPedidoRegra.InserirItens(const oCadastroPedidoModel: TCadastroPedidoModel;
const oCadastroItensPedidoModel: TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel;
const oCadastroPedidoDto: TCadastroPedidoDto);
var
  oLoopControlItens : TCadastroItensDto;
  idPedido, idItem: Integer;
  oLoopControlDetalhe : TCadastroDetalheItemDto;
begin
    idPedido := oCadastroPedidoModel.NovoId;
    oCadastroPedidoModel.Inserir(oCadastroPedidoDto, idPedido);
    for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values do
    begin
      idItem := oCadastroItensPedidoModel.NovoId;
      oCadastroItensPedidoModel.Inserir(oLoopControlItens, idItem, idPedido);
      for oLoopControlDetalhe in oLoopControlItens.DetalheItem.Values do
      begin
        oCadastroDetalhesItensModel.Inserir(oLoopControlDetalhe, oCadastroDetalhesItensModel.NovoId, idItem);
      end;
    end;
end;

function TCadastroPedidoRegra.Novo(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
begin
  oCadastroPedidoDto.IdPedido := oCadastroPedidoModel.NovoId;
  Result := True;
end;


function TCadastroPedidoRegra.Salvar(const oCadastroPedidoModel : TCadastroPedidoModel; const oCadastroPedidoDto: TCadastroPedidoDto;
const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto;
const oCadastroItensPedidoModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel): boolean;
begin
  if(oCadastroClienteModel.SelectPorNome(oCadastroClienteDto))then
    oCadastroPedidoDto.idcliente := oCadastroClienteDto.IdCliente
  else
    raise Exception.Create('Esse cliente não possui cadastro' + #13
    +'Por favor vá até o cadastro de clientes e cadastre o mesmo');

  if(oCadastroPedidoModel.SelectPedido(oCadastroPedidoDto))then
  begin
    oCadastroPedidoModel.Atualizar(oCadastroPedidoDto);
    if(oCadastroPedidoDto.ItensPedido.Count > 0)then
    begin
      DeletarItens(oCadastroPedidoDto, oCadastroItensPedidoModel, oCadastroDetalhesItensModel);
      InserirItens(oCadastroPedidoModel, oCadastroItensPedidoModel, oCadastroDetalhesItensModel, oCadastroPedidoDto);
    end;
    Result:=True
  end
  else
  begin
    InserirItens(oCadastroPedidoModel, oCadastroItensPedidoModel, oCadastroDetalhesItensModel, oCadastroPedidoDto);
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
    if(not(oCadastroEnderecoDto.IdEndereco <> 0))then
      oCadastroEnderecoModel.NovoId(oCadastroEnderecoDto);
    if(oCadastroEnderecoModel.Inserir(oCadastroEnderecoDto))then
      Result := True;
  end;
end;

function TCadastroPedidoRegra.SelectPedido
(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
 const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto;
 const oCadastroItensPedidoModel : TCadastroItensPedidoModel; const oCadastroDetalhesItensModel: TCadastroDetalheItensModel): boolean;
var
  sAuxiliar : string;
begin
    Result := False;
    if(oCadastroPedidoModel.SelectPorId(oCadastroPedidoDto))then
        oCadastroClienteDto.IdCliente := oCadastroPedidoDto.idcliente;
        if(oCadastroClienteModel.SelectPorId(oCadastroClienteDto))then
        Result := True;//por enquanto dps vai p baixo
          if(oCadastroItensPedidoModel.SelectItensPedido(oCadastroPedidoDto))then
              oCadastroDetalhesItensModel.SelectDetalheItens(oCadastroPedidoDto);


end;

function TCadastroPedidoRegra.SelectBairroDescricao(
  const oCadastroBairroModel: TCadastroBairroModel;
  var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
  Result := oCadastroBairroModel.SelectPorDescricao(oCadastroBairroDto);
end;

function TCadastroPedidoRegra.SelectBairroPorId(
  const oCadastroBairroModel: TCadastroBairroModel;
  var oCadastroBairroDto: TCadastroBairroDto): boolean;
begin
  Result := oCadastroBairroModel.SelectPorId(oCadastroBairroDto);
end;

function TCadastroPedidoRegra.SelectCliente(
  const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.SelectPorId(oCadastroClienteDto);
end;

function TCadastroPedidoRegra.SelectClientePorCpf(
  const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.SelectPorCpf(oCadastroClienteDto);
end;

function TCadastroPedidoRegra.SelectCorPorDescricao(
  const oCadastroCorModel: TCadastroCorModel;
  var oCadastroCorDto: TCadastroCorDto): boolean;
begin
  Result := oCadastroCorModel.SelectPorDescricao(oCadastroCorDto);
end;

function TCadastroPedidoRegra.SelectCorPorId(
  const oCadastroCorModel: TCadastroCorModel;
  var oCadastroCorDto: TCadastroCorDto): boolean;
begin
  Result := oCadastroCorModel.SelectPorId(oCadastroCorDto);
end;

function TCadastroPedidoRegra.SelectDescricao(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto): boolean;
begin
//  if(oCadastroPedidoModel.SelectDescricao(oCadastroPedidoDto))then
//    Result := True
//  else
//    Result := oCadastroPedidoModel.NovoId(oCadastroPedidoDto);
end;

function TCadastroPedidoRegra.SelectTamanhoPorDescricao(
  const oCadastroTamanhoModel: TCadastroTamanhoModel;
  var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
  Result := oCadastroTamanhoModel.SelectPorDescricao(oCadastroTamanhoDto)
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

  oCadastroMunicipioDto.Id := oCadastroBairroDto.idmunicipio;
  oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
  Result := True
end;

function TCadastroPedidoRegra.SelectModeloPorDescricao(
  const oCadastroModeloModel: TCadastroModeloModel;
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
  Result := oCadastroModeloModel.SelectPorDescricao(oCadastroModeloDto);
end;

function TCadastroPedidoRegra.SelectModeloPorId(
  const oCadastroModeloModel: TCadastroModeloModel;
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
  Result := oCadastroModeloModel.SelectPorId(oCadastroModeloDto);
end;

function TCadastroPedidoRegra.SelectMunicipioPorDescricao(
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectMunicipio(oCadastroMunicipioDto);
end;

function TCadastroPedidoRegra.SelectMunicipioPorId(
  const oCadastroMunicipioModel: TCadastroMunicipioModel;
  var oCadastroMunicipioDto: TCadastroMunicipioDto): boolean;
begin
  Result := oCadastroMunicipioModel.SelectPorId(oCadastroMunicipioDto);
end;

function TCadastroPedidoRegra.SelectTamanhoPorId(
  const oCadastroTamanhoModel: TCadastroTamanhoModel;
  var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
  Result := oCadastroTamanhoModel.SelectPorId(oCadastroTamanhoDto);
end;

end.
