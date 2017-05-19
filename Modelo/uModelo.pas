unit uModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroModelo = class(TfrmBase)
    edtCodigo: TLabeledEdit;
    edtPreCo: TLabeledEdit;
    edtModelo: TLabeledEdit;
  public
    { Public declarations }
  end;

var
  frmCadastroModelo : TfrmCadastroModelo;


implementation

{$R *.dfm}





end.
