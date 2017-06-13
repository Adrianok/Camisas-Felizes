unit uInterfaceCadastroCorModel;


interface
uses
  System.Generics.Collections,
  uCadastroCorDto;
type
  IInterfaceCadastroCorModel = interface

    function SelectDescricao(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function NovoId(var oCadastroModeloDto: TCadastroCorDto):boolean;

  end;

implementation

end.
