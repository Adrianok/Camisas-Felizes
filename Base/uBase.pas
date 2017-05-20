unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBase = class(TForm)
    Panel1: TPanel;
    pgControll: TPageControl;
    Cadastro: TTabSheet;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnAlterar: TBitBtn;
    Panel3: TPanel;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

uses uConsultaBase;

procedure TfrmBase.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.btnNovoClick(Sender: TObject);
begin
  btnSalvar.Enabled := true;
  btnNovo.Enabled := false;
  btnAlterar.Enabled := false;
end;

procedure TfrmBase.btnPesquisarClick(Sender: TObject);
begin
  if (not(Assigned(frmPesquisaBase))) then
    frmPesquisaBase := TfrmPesquisaBase.Create(self);
  frmPesquisaBase.Show;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmBase := nil;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  pgControll.ActivePage := Cadastro;
  btnSalvar.Enabled := false;
end;

end.
