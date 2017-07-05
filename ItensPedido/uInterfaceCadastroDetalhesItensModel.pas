unit uInterfaceCadastroDetalhesItensModel;


interface
uses
  System.Generics.Collections,
  uCadastroDetalheItemDto, uCadastroPedidoDto;
type
  IInterfaceCadastroDetalhesItensModel = interface
    function SelectDetalheItens(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Inserir(const oCadastroDetalheDto: TCadastroDetalheItemDto; const idDetalhe : integer; const IdItem : integer): Boolean;
    function Atualizar(var oCadastroDetalheItemDto: TCadastroDetalheItemDto):boolean;
    function Deletar(const IdDetalhe : integer): Boolean;
    function NovoId: integer;

  end;

implementation

end.
