unit uInterfaceConsultaBase;

interface

uses
  System.Classes, FireDAC.Comp.Client,
  Vcl.DbGrids, uCadastroCorDto;

type
  IInterfaceConsultaBase = interface
    procedure PesquisarGrid;
    procedure AlimentarDto(Column : TColumn);
    function PreencherGrid(MemTable : TFDMemTable):boolean;
    procedure CriarForm(Aowner: TComponent;var oCadastroCorDto : TCadastroCorDto);
    procedure Pesquisar;
    procedure Cancelar;
    procedure Fechar;

  end;

implementation

end.
