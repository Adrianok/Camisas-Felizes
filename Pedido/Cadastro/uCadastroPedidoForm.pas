unit uCadastroPedidoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadastroPedidoForm = class(TfrmBase)
    GroupBox1: TGroupBox;
    edtNomeClienteEx: TLabeledEdit;
    Label4: TLabel;
    edtValorTotal: TLabeledEdit;
    Label5: TLabel;
    pgItens: TPageControl;
    pgCabecalho: TTabSheet;
    gpEntrega: TGroupBox;
    Label2: TLabel;
    dtePrev: TDateTimePicker;
    edtReceptor: TLabeledEdit;
    GroupBox5: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtRua: TLabeledEdit;
    edtNmr: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    gpCliente: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    edtCpfCnpj: TLabeledEdit;
    edtNmClient: TLabeledEdit;
    gpNota: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtCodigo: TLabeledEdit;
    dteData: TDateTimePicker;
    edtNomeVendedor: TLabeledEdit;
    chkAltEnd: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    edtObservacoes: TMemo;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    LabeledEdit1: TLabeledEdit;
    TabSheet1: TTabSheet;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    edtCdItensPedido: TLabeledEdit;
    edtModelo: TLabeledEdit;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtQntTam: TLabeledEdit;
    edtTamanho: TLabeledEdit;
    edtCor: TLabeledEdit;
    edtQntItem: TLabeledEdit;
    Label18: TLabel;
    btnAddModelo: TBitBtn;
    btnAddItem: TBitBtn;
    btnExcluirModelo: TBitBtn;
    lvItens: TListView;
    Label19: TLabel;
    btnExcluirItem: TBitBtn;
    Label20: TLabel;
    lvModelos: TListView;
    edtPrecoModelo: TLabeledEdit;
    edtSequencia: TLabeledEdit;
    Label21: TLabel;
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
