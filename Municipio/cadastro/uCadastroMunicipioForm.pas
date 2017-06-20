unit uCadastroMunicipioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, FireDAC.Stan.Async,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

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
