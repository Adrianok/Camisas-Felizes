unit uInterfaceViewBase;

interface

uses
  System.Classes;

type
  IInterfaceViewBase = interface
    procedure CriarForm(Aowner: TComponent);
    procedure Novo;
    procedure Salvar;
    procedure Alterar;
    procedure Pesquisar;
    procedure Excluir;
    procedure Fechar;

//    function GetInstance: TObject;
//    property Instance: TObject read GetInstance;

  end;

implementation

end.
