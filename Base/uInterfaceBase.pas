unit uInterfaceBase;

interface
uses
  System.Classes;
type
  TInterfaceBase = interface
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
