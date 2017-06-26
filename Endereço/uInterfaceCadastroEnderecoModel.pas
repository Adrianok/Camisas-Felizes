unit uInterfaceCadastroEnderecoModel;


interface
uses
  System.Generics.Collections,
  uCadastroEnderecoDto;
type
  IInterfaceCadastroEnderecoModel = interface
    function Inserir(var oCadastroModeloDto: TCadastroEnderecoDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroEnderecoDto):boolean;
    function Deletar(const IdEndereco : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroEnderecoDto):boolean;

  end;

implementation

end.
