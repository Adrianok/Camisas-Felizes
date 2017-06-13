unit uInterfaceUfModel;

interface

uses
  System.Generics.Collections;

type
  IInterfaceConsultaUfModel = interface

    function SelectDescricao: Boolean;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Deletar: Boolean;
    function NovoId: Boolean;

  end;

implementation

end.
