unit uInterfaceConsultaBase;

interface

uses
  System.Classes, FireDAC.Comp.Client,
  Vcl.DbGrids;

type
  IInterfaceConsultaBase = interface
    procedure PesquisarGrid;
    procedure AlimentarDto(Column : TColumn);
    function PreencherGrid:boolean;
    procedure CriarForm(Aowner: TComponent);
    procedure Pesquisar;
    procedure Cancelar;
    procedure Fechar;

  end;

implementation

end.
