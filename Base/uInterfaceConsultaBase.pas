unit uInterfaceConsultaBase;

interface

uses
  System.Classes, FireDAC.Comp.Client,
  Vcl.DbGrids;

type
  IInterfaceConsultaBase = interface

    procedure AlimentarDto(Column : TColumn);
    procedure CriarForm   (Aowner : TComponent);
    procedure KeyDown     (var Key: Word);

    procedure Fechar;
    procedure Cancelar;
    procedure Confirmar;
    procedure MarcarPassagem;
    procedure Pesquisar;
    procedure PesquisarGrid;

    function  PreencherGrid: boolean;
  end;

implementation

end.
