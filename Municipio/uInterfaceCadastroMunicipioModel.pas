unit uInterfaceCadastroMunicipioModel;


interface
uses
  System.Generics.Collections,
  uCadastroMunicipioDto;
type
  IInterfaceCadastroMunicipioModel = interface
    function SelectPorDescricao(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroMunicipioDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroMunicipioDto):boolean;
    function Deletar(const IdMunicipio : integer): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroMunicipioDto):boolean;

  end;

implementation

end.
