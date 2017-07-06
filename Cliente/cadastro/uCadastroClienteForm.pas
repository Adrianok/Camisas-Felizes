unit uCadastroClienteForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, FireDAC.Stan.Async,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TCadastroClienteForm = class(TfrmBase)
    EdtNome: TLabeledEdit;
    EdtCodigo: TLabeledEdit;
    EdtTelefone: TLabeledEdit;
    EdtCelular: TLabeledEdit;
    edtObservacoes: TMemo;
    Label3: TLabel;
    EdtRua: TLabeledEdit;
    edtNum: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtCpfCnpj: TLabeledEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroClienteForm: TCadastroClienteForm;

implementation

{$R *.dfm}

end.
