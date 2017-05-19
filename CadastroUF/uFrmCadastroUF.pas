unit uFrmCadastroUF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, FireDAC.Stan.Async,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUF = class(TfrmBase)
    LedtCódigo: TLabeledEdit;
    LedtUf: TLabeledEdit;
    LedtNome: TLabeledEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUf: TfrmUF;

implementation

{$R *.dfm}

end.
