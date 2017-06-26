unit uCadastroUfForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, FireDAC.Stan.Async,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadastroUfForm = class(TfrmBase)
    LedtNome: TLabeledEdit;
    LedtUf: TLabeledEdit;
    LedtCodigo: TLabeledEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroUfForm: TCadastroUfForm;

implementation

{$R *.dfm}

end.
