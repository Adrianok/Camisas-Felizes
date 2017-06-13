unit uCadastroCorPesquisaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaBase, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadastroCorPesquisaForm = class(TfrmPesquisaBase)
    DBGrid: TDBGrid;
    Panel3: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroCorPesquisaForm: TCadastroCorPesquisaForm;

implementation

{$R *.dfm}

end.
