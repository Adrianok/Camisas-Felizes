unit uInterfaceConsultaBase;

interface

uses
  System.Classes;

type
  IInterfaceConsultaBase = interface

    procedure CriarForm(Aowner: TComponent);virtual;
    procedure Pesquisar;
    procedure Cancelar;
    procedure Fechar;

  end;

implementation

end.
