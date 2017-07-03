unit uInterfaceCadastroDetalhesItensModel;


interface
uses
  System.Generics.Collections,
  uCadastroDetalheItemDto, uCadastroPedidoDto;
type
  IInterfaceCadastroDetalhesItensModel = interface
    function Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Atualizar(var oCadastroDetalheItemDto: TCadastroDetalheItemDto):boolean;
    function Deletar(const IdDetalhe : integer): Boolean;
    function NovoId(var oCadastroDetalheItemDto: TCadastroDetalheItemDto):boolean;

  end;

implementation

end.
