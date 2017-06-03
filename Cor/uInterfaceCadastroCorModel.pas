unit uInterfaceCadastroCorModel;


interface
uses
  System.Generics.Collections,
  uCadastroCorDto;
type
  IInterfaceCadastroCorModel = interface

    function SelectPorCor(var oCadastroModeloDto: TCadastroCorDto): Boolean;
    function SelectModelo(var oCadastroModeloDto: TCadastroCorDto): Boolean;
    function SelectID(var oCadastroModeloDto: TCadastroCorDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function NovoId(var oCadastroModeloDto: TCadastroCorDto):boolean;

  end;

implementation

end.
