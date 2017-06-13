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
    pgControll: TPageControl;
    Cadastro: TTabSheet;
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
    procedure FormActivate(Sender: TObject);
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
  oController.Pesquisar(Self);
end;

procedure TfrmBase.btnSalvarClick(Sender: TObject);
begin
  oController.Salvar;
end;

procedure TfrmBase.FormActivate(Sender: TObject);
begin
  if(assigned(oController))then
    oController.Consulta;
end;

procedure TfrmBase.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    oController.Pesquisar(Self);
end;

end.
