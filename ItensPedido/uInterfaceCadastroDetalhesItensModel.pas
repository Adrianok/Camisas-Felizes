unit uInterfaceCadastroDetalhesItensModel;


interface
uses
  System.Generics.Collections,
  uCadastroDetalheItemDto;
type
  IInterfaceCadastroDetalhesItensModel = interface
    function Inserir(var oCadastroDetalheItemDto: TCadastroDetalheItemDto):boolean;
    function Atualizar(var oCadastroDetalheItemDto: TCadastroDetalheItemDto):boolean;
    function Deletar(const IdDetalhe : integer): Boolean;
    function NovoId(var oCadastroDetalheItemDto: TCadastroDetalheItemDto):boolean;

  end;

implementation

end.
