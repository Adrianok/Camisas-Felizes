unit uInterfaceCadastroTamanhoModel;


interface
uses
  System.Generics.Collections,
  uCadastroTamanhoDto;
type
  IInterfaceCadastroTamanhoModel = interface

    function SelectDescricao(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;
    function NovoId(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;

  end;

implementation

end.
