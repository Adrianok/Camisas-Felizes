unit uConsultaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uInterfaceConsultaBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisaBase = class(TForm)
    Panel1: TPanel;
    edtPesquisa: TEdit;
    btnPesquisa: TBitBtn;
    Panel2: TPanel;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    DataSourceGrid: TDataSource;
    FDMemTableGrid: TFDMemTable;
    DBGrid1: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
      { Public declarations }
      oController: IInterfaceConsultaBase;
  end;

var
  frmPesquisaBase: TfrmPesquisaBase;

implementation

{$R *.dfm}

procedure TfrmPesquisaBase.btnCancelarClick(Sender: TObject);
begin
    oController.Fechar;
end;

procedure TfrmPesquisaBase.btnConfirmarClick(Sender: TObject);
begin
    oController.AlimentarDto(DBGrid1.Columns[DBGrid1.SelectedIndex]);
    oController.Fechar;
end;

procedure TfrmPesquisaBase.btnFecharClick(Sender: TObject);
begin
    oController.Fechar;
end;

procedure TfrmPesquisaBase.btnPesquisaClick(Sender: TObject);
begin

  oController.PesquisarGrid;

end;

procedure TfrmPesquisaBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    oController.Fechar;
    char(Key) := #0;
  end;
end;

end.
