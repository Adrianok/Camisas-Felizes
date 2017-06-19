unit uInterfaceCadastroMunicipioModel;


interface
uses
  System.Generics.Collections,
  uCadastroMunicipioDto;
type
  IInterfaceCadastroMunicipioModel = interface

    function SelectDescricao(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Inserir(var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;
    function Atualizar(var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;
    function Deletar(var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;
    function NovoId(var oCadastroMunicipioDto: TCadastroMunicipioDto):boolean;

  end;

implementation

end.
