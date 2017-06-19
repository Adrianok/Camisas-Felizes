unit uCadastroMunicipioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TCadastroMunicipioForm = class(TfrmBase)
    LedtCodigo: TLabeledEdit;
    LedtMunicipio: TLabeledEdit;
    LedtEstado: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroMunicipioForm: TCadastroMunicipioForm;

implementation

{$R *.dfm}

end.
