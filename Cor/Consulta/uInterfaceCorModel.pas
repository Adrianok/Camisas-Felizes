unit uInterfaceCorModel;

interface
uses
  System.Generics.Collections;
type
  IInterfaceConsultaCorModel = interface

    function SelectDescricao: Boolean;
    function Inserir:boolean;
    function Atualizar:boolean;
    function Deletar:boolean;
    function NovoId:boolean;

  end;

implementation

end.
