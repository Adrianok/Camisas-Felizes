unit uCadastroPedidoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TCadastroPedidoForm = class(TfrmBase)
    PageControl1: TPageControl;
    pgCabecalho: TTabSheet;
    TabSheet1: TTabSheet;
    gpCliente: TGroupBox;
    edtCpfCnpj: TLabeledEdit;
    edtNomeCliente: TLabeledEdit;
    gpVenda: TGroupBox;
    edtReceptor: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtRua: TLabeledEdit;
    edtNmr: TLabeledEdit;
    Label2: TLabel;
    dtePrev: TDateTimePicker;
    edtBairro: TLabeledEdit;
    edtNmClient: TLabeledEdit;
    gpNota: TGroupBox;
    edtCodigo: TLabeledEdit;
    Label1: TLabel;
    dteData: TDateTimePicker;
    edtNomeVendedor: TLabeledEdit;
    Label3: TLabel;
    edtObservacoes: TMemo;
    GroupBox1: TGroupBox;
    edtNomeClienteEx: TLabeledEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtValorTotal: TLabeledEdit;
    Label6: TLabel;
    Label7: TLabel;
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
