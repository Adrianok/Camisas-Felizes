unit uCadastroModeloForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uBase;

type
  TCadastroModeloForm = class(TfrmBase)
    edtCodigo: TLabeledEdit;
    edtPreCo: TLabeledEdit;
    edtModelo: TLabeledEdit;
    edtCor: TLabeledEdit;
  public
    { Public declarations }
  end;

var
  CadastroModeloForm : TCadastroModeloForm;


implementation

{$R *.dfm}





end.
