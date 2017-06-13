unit uInterfaceViewBase;

interface

uses
  System.Classes;

type
  IInterfaceViewBase = interface

    procedure CriarFormConsulta(Aowner: TComponent);
    procedure CriarForm(Aowner: TComponent);
    procedure Novo;
    procedure Salvar;
    procedure Alterar;
    procedure Pesquisar;
    procedure Excluir;
    procedure Fechar;
    procedure FecharConsulta;

//    function GetInstance: TObject;
//    property Instance: TObject read GetInstance;

  end;

implementation

end.
