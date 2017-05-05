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
    Consuta: TTabSheet;
    DBGridCadastro: TDBGrid;
    edtPesquisa: TEdit;
    btnPesquisa: TBitBtn;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnAlterar: TBitBtn;
    Panel3: TPanel;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure pgControllChange(Sender: TObject);
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
  edtPesquisa.Visible := false;
  btnPesquisa.Visible := false;
  btnSalvar.Enabled := false;
end;

procedure TfrmBase.pgControllChange(Sender: TObject);
begin
  edtPesquisa.Visible := false;
  btnPesquisa.Visible := false;

  if Assigned(frmBase) then
  begin
    if (pgControll.ActivePage = Cadastro) then
    begin
      edtPesquisa.Visible := false;
      btnPesquisa.Visible := false;
      btnSalvar.Enabled := true;
      btnPesquisar.Enabled := true;
      btnNovo.Enabled := true;
      btnSalvar.Enabled := false;
    end
    else if (pgControll.ActivePage = Consuta) then
    begin
      edtPesquisa.Visible := true;
      btnPesquisa.Visible := true;
      btnSalvar.Enabled := false;
      btnPesquisar.Enabled := false;
      btnNovo.Enabled := true;
      btnSalvar.Enabled := false;
    end;
  end;
end;

end.
