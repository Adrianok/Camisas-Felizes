unit uInterfaceCadastroItensPedidoModel;


interface
uses
  System.Generics.Collections,
  uCadastroItensDto, uCadastroPedidoDto;
type
  IInterfaceCadastroItensPedidoModel = interface
    function Inserir(const oCadastroItensPedido: TCadastroItensDto; const idItensPedido : integer;const idPedido : integer): Boolean;
    function NovoId: integer;
    function SelectItensPedido(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;

  end;

implementation

end.
