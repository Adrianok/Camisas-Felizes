unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList ,
  Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, uModelo, uControllerCadastroModelo;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CadastroModelo: TMenuItem;
    Cadastrodemodelos: TMenuItem;
    procedure CadastrodemodelosClick(Sender: TObject);
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

procedure TfrmPrincipal.CadastrodemodelosClick(Sender: TObject);
begin
  oControllerModelo.InstanciarForm(Self);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
