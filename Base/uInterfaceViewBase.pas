unit uInterfaceViewBase;

interface

uses
  System.Classes;

type
  IInterfaceViewBase = interface
    procedure Consulta;
    procedure CriarForm(Aowner: TComponent);
    procedure Novo;
    procedure Salvar;
    procedure Pesquisar(Aowner: TComponent);
    procedure Excluir;
    procedure Fechar;

  end;

implementation

end.
