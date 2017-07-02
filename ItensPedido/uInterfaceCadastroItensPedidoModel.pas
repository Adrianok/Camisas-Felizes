unit uInterfaceCadastroItensPedidoModel;


interface
uses
  System.Generics.Collections,
  uCadastroItensDto, uCadastroPedidoDto;
type
  IInterfaceCadastroItensPedidoModel = interface
    function Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Atualizar(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Deletar(const IdItensPedido : integer): Boolean;
    function NovoId(var oCadastroItensDto: TCadastroItensDto):boolean;

  end;

implementation

end.
