unit uInterfaceCadastroCorModel;


interface
uses
  System.Generics.Collections,
  uCadastroCorDto, uListaCores;
type
  IInterfaceCadastroCorModel = interface
    function SelectDescricaoDivergente(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function SelectDescricao(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function SelectAllLista(var oListaCores: TListaCores): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroCorDto):boolean;
    function Deletar(const IdCor : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroCorDto):boolean;

  end;

implementation

end.
