unit uInterfaceModeloModel;

interface
uses
  System.Generics.Collections;
type
  IInterfaceConsultaModeloModel = interface

    function SelectDescricao: Boolean;
    function Inserir:boolean;
    function Atualizar:boolean;
    function Deletar:boolean;
    function NovoId:boolean;

  end;

implementation

end.
