unit uPrincipalBorda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPrincipal, System.UITypes;

type
  TfrmPrincipalBorda = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    oPrincipal: TfrmPrincipal;
  public
  end;

var
  frmPrincipalBorda: TfrmPrincipalBorda;

implementation

{$R *.dfm}


procedure TfrmPrincipalBorda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
  if MessageDlg('Deseja fechar o programa?', mtConfirmation, mbYesNo, 0) <> MrYes
  then
    abort

end;

procedure TfrmPrincipalBorda.FormResize(Sender: TObject);
begin
  if (assigned(frmPrincipal)) then
  begin
    frmPrincipal.Height := Self.Height - 52;
    frmPrincipal.Width := Self.Width - 32;
    frmPrincipal.Position := poMainFormCenter;
  end;
end;

end.
