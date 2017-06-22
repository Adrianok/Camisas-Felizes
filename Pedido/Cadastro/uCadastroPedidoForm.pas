unit uCadastroPedidoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TCadastroPedidoForm = class(TfrmBase)
    edtPedido: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    dteDataAtual: TDateTimePicker;
    Label1: TLabel;
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
