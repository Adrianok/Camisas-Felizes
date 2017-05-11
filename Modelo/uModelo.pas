unit uModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroModelo = class(TfrmBase)
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
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
  Action := cafree;
  frmCadastroModelo := nil;
end;

end.
