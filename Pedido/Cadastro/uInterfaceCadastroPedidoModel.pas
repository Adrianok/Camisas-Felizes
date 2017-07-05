unit uInterfaceCadastroPedidoModel;


interface
uses
  System.Generics.Collections,
  uCadastroPedidoDto;
type
  IInterfaceCadastroPedidoModel = interface

    function Inserir(const oCadastroModeloDto: TCadastroPedidoDto; const idPedido: integer):boolean;
    function Atualizar(const oCadastroModeloDto: TCadastroPedidoDto):boolean;
    function Deletar(const IdPedido: integer): Boolean;
    function NovoId: integer;

  end;

implementation

end.
