unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, uModelo,
  uControllerCadastroModelo, uCadastroUfController;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CadastroModelo: TMenuItem;
    Cadastrodemodelos: TMenuItem;
    C1: TMenuItem;
    procedure CadastrodemodelosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure C1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.C1Click(Sender: TObject);
begin
  if (not(Assigned(oCadastroUfController))) then
    oCadastroUfController := TCadastroUfController.Create;

  oCadastroUfController.CriarForm(Self);

end;

procedure TfrmPrincipal.CadastrodemodelosClick(Sender: TObject);
begin
  if (not(Assigned(oControllerModelo))) then
    oControllerModelo := TControllerCadastroModelo.Create(Self);

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
  if (Assigned(oCadastroUfController)) then
    oCadastroUfController.Destroy;
end;

end.
