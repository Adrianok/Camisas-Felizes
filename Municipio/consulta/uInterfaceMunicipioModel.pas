unit uInterfaceMunicipioModel;

interface

uses
  System.Generics.Collections;

type
  IInterfaceConsultaMunicipioModel = interface

    function SelectDescricao: Boolean;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Deletar: Boolean;
    function NovoId: Boolean;

  end;

implementation

end.
