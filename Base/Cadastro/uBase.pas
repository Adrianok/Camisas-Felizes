unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, uInterfaceViewBase;

type
  TfrmBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnPesquisar: TBitBtn;
    Panel3: TPanel;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    oController: IInterfaceViewBase;
  end;

implementation

{$R *.dfm}

procedure TfrmBase.btnExcluirClick(Sender: TObject);
begin
  oController.Excluir;
end;



procedure TfrmBase.btnFecharClick(Sender: TObject);
begin
  oController.Fechar;
end;



procedure TfrmBase.btnNovoClick(Sender: TObject);
begin
  oController.Novo
end;



procedure TfrmBase.btnPesquisarClick(Sender: TObject);
begin
  oController.Pesquisar(ActiveControl);
end;



procedure TfrmBase.btnSalvarClick(Sender: TObject);
begin
  oController.Salvar;
end;



procedure TfrmBase.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  oController.KeyDown(Key, ActiveControl);
end;

end.
