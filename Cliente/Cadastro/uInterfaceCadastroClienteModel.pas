unit uInterfaceCadastroClienteModel;


interface
uses
  System.Generics.Collections,
  uCadastroClienteDto;
type
  IInterfaceCadastroClienteModel = interface
    function SelectDescricao(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroClienteDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroClienteDto):boolean;
    function Deletar(const IdCliente : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroClienteDto):boolean;

  end;

implementation

end.
