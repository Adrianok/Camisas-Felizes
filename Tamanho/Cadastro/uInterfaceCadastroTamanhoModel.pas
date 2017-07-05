unit uInterfaceCadastroTamanhoModel;


interface
uses
  System.Generics.Collections,
  uCadastroTamanhoDto;
type
  IInterfaceCadastroTamanhoModel = interface

    function SelectPorDescricao(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;
    function Deletar(const IdTamanho: integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroTamanhoDto):boolean;

  end;

implementation

end.
