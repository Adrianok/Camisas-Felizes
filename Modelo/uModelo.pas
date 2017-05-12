unit uModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uControllerCadastroModelo;

type
  TfrmCadastroModelo = class(TfrmBase)
    edtModelo: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    edtPreCo: TLabeledEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    oControllerModelo: TControllerCadastroModelo;
  public
    { Public declarations }
  end;

var
  frmCadastroModelo: TfrmCadastroModelo;

implementation

{$R *.dfm}

procedure TfrmCadastroModelo.btnFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadastroModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (assigned(oControllerModelo)) then
    FreeAndNil(oControllerModelo);

  Action := cafree;
  frmCadastroModelo := nil;
end;

procedure TfrmCadastroModelo.FormCreate(Sender: TObject);
begin
  inherited;
  oControllerModelo.Create;
end;

end.
