unit uCadastroModeloForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TCadastroModeloForm = class(TfrmBase)
    edtCodigo: TLabeledEdit;
    edtPreco: TLabeledEdit;
    edtModelo: TLabeledEdit;
    edtCor: TLabeledEdit;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
