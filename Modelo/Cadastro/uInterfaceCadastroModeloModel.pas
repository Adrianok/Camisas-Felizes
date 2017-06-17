unit uInterfaceCadastroModeloModel;


interface
uses
  System.Generics.Collections,
  uCadastroModeloDto;
type
  IInterfaceCadastroModeloModel = interface

    function SelectDescricao(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function NovoId(var oCadastroModeloDto: TCadastroModeloDto):boolean;

  end;

implementation

end.
