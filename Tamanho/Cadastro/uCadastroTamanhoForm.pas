                                      unit uCadastroTamanhoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TCadastroTamanhoForm = class(TfrmBase)
    edtCodigo: TLabeledEdit;
    edtTamanho: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroTamanhoForm: TCadastroTamanhoForm;

implementation

{$R *.dfm}

end.
