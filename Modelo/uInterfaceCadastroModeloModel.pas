unit uInterfaceCadastroModeloModel;


interface
uses
  System.Generics.Collections,
  uCadastroModeloDto;
type
  IInterfaceCadastroModeloModel = interface
    function SelectPorCor(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectPorModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectID(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function NovoId: Integer;

  end;

implementation

end.
