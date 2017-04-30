unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBase = class(TForm)
    Panel1: TPanel;
    pgControll: TPageControl;
    Cadastro: TTabSheet;
    Consuta: TTabSheet;
    btnSalvar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.btnFecharClick(Sender: TObject);
begin
    Close;
end;

end.
