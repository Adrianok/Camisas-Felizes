unit uCadastroPedidoRegra;

interface

uses
  System.SysUtils, uCadastroPedidoDto,
  uCadastroPedidoForm, uCadastroPedidoModel,
  uCadastroClienteModel, uCadastroClienteDto,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto;

type
  TCadastroPedidoRegra = class
  private
  public
    function SelectDescricao(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
    function SelectPedido(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
       const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto;
       const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
       const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto): boolean;
    function Deletar(const oCadastroPedidoModel : TCadastroPedidoModel; const IdPedido : integer) : boolean;

    function Novo(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
    function Salvar(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto): boolean;
  end;

implementation

{ TCadastroPedidoRegra }



function TCadastroPedidoRegra.Deletar(const oCadastroPedidoModel: TCadastroPedidoModel;
  const IdPedido: integer): boolean;
begin
  if(not(oCadastroPedidoModel.Deletar(IdPedido)))then
    raise Exception.Create('Falha ao excluir registro');
end;

function TCadastroPedidoRegra.Novo(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto : TCadastroPedidoDto) : boolean;
begin
  Result := oCadastroPedidoModel.NovoId(oCadastroPedidoDto);
end;

function TCadastroPedidoRegra.Salvar(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroPedidoDto.IdPedido < 0)then
      oCadastroPedidoModel.NovoId(oCadastroPedidoDto);

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

function TCadastroPedidoRegra.SelectPedido
(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto;
 const oCadastroClienteModel : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto;
 const oCadastroEnderecoModel : TCadastroEnderecoModel; var oCadastroEnderecoDto: TCadastroEnderecoDto;
 const oCadastroBairroModel : TCadastroBairroModel ; var oCadastroBairroDto: TCadastroBairroDto): boolean;
 begin
    Result := False;
    if(oCadastroPedidoModel.SelectPorId(oCadastroPedidoDto))then
        oCadastroClienteDto.IdCliente := oCadastroPedidoDto.idcliente;
        if(oCadastroClienteModel.SelectPorId(oCadastroClienteDto))then
        begin
          oCadastroEnderecoDto.IdEndereco  := oCadastroClienteDto.idendereco;
          oCadastroEnderecoModel.SelectPorId(oCadastroEnderecoDto);
          oCadastroBairroDto.IdBairro := oCadastroEnderecoDto.idbairro;
          oCadastroBairroModel.SelectPorId(oCadastroBairroDto);
          Result := True;
        end;
end;

function TCadastroPedidoRegra.SelectDescricao(const oCadastroPedidoModel : TCadastroPedidoModel; var oCadastroPedidoDto: TCadastroPedidoDto): boolean;
begin
//  if(oCadastroPedidoModel.SelectDescricao(oCadastroPedidoDto))then
//    Result := True
//  else
//    Result := oCadastroPedidoModel.NovoId(oCadastroPedidoDto);
end;

end.
