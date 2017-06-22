unit uInterfaceCadastroUfModel;


interface
uses
  System.Generics.Collections,
  uCadastroUfDto;
type
  IInterfaceCadastroUfModel = interface

    function SelectDescricao(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function Inserir(var oCadastroUfDto: TCadastroUfDto):boolean;
    function Atualizar(var oCadastroUfDto: TCadastroUfDto):boolean;
    function Deletar(var oCadastroUfDto: TCadastroUfDto):boolean;
    function NovoId(var oCadastroUfDto: TCadastroUfDto):boolean;

  end;

implementation

end.
