unit uIterfaceCadastroUfModel;

interface

uses
  System.Generics.Collections,
  uCadastroUfDto;

type
  IInterfaceCadastroUfModel = interface
    function Salvar(var aEstado: TCadastroUfDTO): boolean;
    function Ler(var aEstado: TCadastroUfDTO): boolean;
    function NovoId(var oCadastroUfDto: TCadastroUfDTO): boolean;
    function Alterar(var aEstado: TCadastroUfDTO): boolean;
    function Deletar(const aIdUf: integer): boolean;
  end;

implementation

end.
