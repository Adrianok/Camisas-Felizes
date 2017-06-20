unit uInterfaceCadastroPedidoModel;


interface
uses
  System.Generics.Collections,
  uCadastroPedidoDto;
type
  IInterfaceCadastroPedidoModel = interface

    function SelectDescricao(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroPedidoDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroPedidoDto):boolean;
    function Deletar(const IdPedido: integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroPedidoDto):boolean;

  end;

implementation

end.
