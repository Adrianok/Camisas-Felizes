unit uCadastroPedidoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst;

type
  TCadastroPedidoForm = class(TfrmBase)
    GroupBox1: TGroupBox;
    edtNomeClienteEx: TLabeledEdit;
    Label4: TLabel;
    edtValorTotal: TLabeledEdit;
    Label5: TLabel;
    pgpedido: TPageControl;
    pgCabecalho: TTabSheet;
    gpEntrega: TGroupBox;
    Label2: TLabel;
    dtePrev: TDateTimePicker;
    edtReceptor: TLabeledEdit;
    gpEndereco: TGroupBox;
    edtRua: TLabeledEdit;
    edtNmr: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    gpCliente: TGroupBox;
    edtNmClient: TLabeledEdit;
    gpNota: TGroupBox;
    Label1: TLabel;
    edtCodigo: TLabeledEdit;
    dteData: TDateTimePicker;
    edtNomeVendedor: TLabeledEdit;
    chkAltEnd: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    edtObservacoes: TMemo;
    GroupBox4: TGroupBox;
    edtUsuario: TLabeledEdit;
    pgItens: TTabSheet;
    GroupBox6: TGroupBox;
    edtCdItensPedido: TLabeledEdit;
    edtModelo: TLabeledEdit;
    GroupBox7: TGroupBox;
    edtQntTam: TLabeledEdit;
    edtTamanho: TLabeledEdit;
    edtCor: TLabeledEdit;
    btnAddItem: TBitBtn;
    btnExcluirDetalhe: TBitBtn;
    Label19: TLabel;
    btnExcluirItem: TBitBtn;
    Label20: TLabel;
    edtPrecoItem: TLabeledEdit;
    logo: TImage;
    Label6: TLabel;
    edtQntTot: TLabeledEdit;
    edtQntItm: TLabeledEdit;
    chlItens: TListView;
    chlDetalheItem: TListView;
    edtCpfCnpj: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroPedidoForm: TCadastroPedidoForm;

implementation

{$R *.dfm}

end.
