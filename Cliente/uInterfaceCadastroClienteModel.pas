unit uInterfaceCadastroClienteModel;


interface
uses
  System.Generics.Collections,
  uCadastroClienteDto;
type
  IInterfaceCadastroClienteModel = interface
    function Inserir(var oCadastroModeloDto: TCadastroClienteDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroClienteDto):boolean;
    function Deletar(const IdCliente : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroClienteDto):boolean;

  end;

implementation

end.
