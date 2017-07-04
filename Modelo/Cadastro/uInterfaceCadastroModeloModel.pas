unit uInterfaceCadastroModeloModel;


interface
uses
  System.Generics.Collections,
  uCadastroModeloDto;
type
  IInterfaceCadastroModeloModel = interface

    function SelectPorDescricao(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectPorId(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectPorModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Deletar(const IdModelo : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroModeloDto):boolean;

  end;

implementation

end.
