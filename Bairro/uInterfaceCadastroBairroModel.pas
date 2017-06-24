unit uInterfaceCadastroBairroModel;


interface
uses
  System.Generics.Collections,
  uCadastroBairroDto;
type
  IInterfaceCadastroBairroModel = interface
    function Inserir(var oCadastroModeloDto: TCadastroBairroDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroBairroDto):boolean;
    function Deletar(const IdBairro : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroBairroDto):boolean;

  end;

implementation

end.
