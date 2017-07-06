unit uInterfaceViewBase;

interface

uses
  System.Classes, Vcl.Controls;

type
  IInterfaceViewBase = interface
    procedure CriarForm(Aowner: TComponent);
    procedure Novo;
    procedure Salvar;
    procedure KeyDown(var Key: Word; Aowner: TComponent; AcTiveControl: TWinControl);
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl);
    procedure Excluir;
    procedure Fechar;
    procedure Cancelar;

  end;

implementation

end.
