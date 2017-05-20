unit uPrincipalForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroModeloController, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    CadastrodeModelos1: TMenuItem;
    procedure CadastrodeModelos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}



procedure TfrmPrincipal.CadastrodeModelos1Click(Sender: TObject);
begin
  if (not(assigned(oCadastroModeloController))) then
    oCadastroModeloController := TCadastroModeloController.Create(Self);
  oCadastroModeloController.InstanciarForm(Self);

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
  if (assigned(oCadastroModeloController)) then
  begin
    oCadastroModeloController.Destroy;
  end;
end;

end.
