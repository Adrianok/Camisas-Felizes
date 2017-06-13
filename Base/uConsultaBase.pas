unit uConsultaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uInterfaceConsultaBase;

type
  TfrmPesquisaBase = class(TForm)
    Panel1: TPanel;
    edtPesquisa: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    btnFechar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
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

procedure TfrmPesquisaBase.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPesquisaBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmPesquisaBase := nil;
end;

end.
