unit uInterfaceCadastroModeloModel;


interface
uses
  System.Generics.Collections,
  uCadastroModeloDto;
type
  IInterfaceCadastroModeloModel = interface
    function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string,TCadastroModeloDto>): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function NovoId: Integer;

  end;

implementation

end.
