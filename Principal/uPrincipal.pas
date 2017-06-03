unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  uCadastroModeloController, uConexaoSingleTon,
  uCadastroUfController,  uCadastroCorController,
  uCadastroTamanhoController;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    CadastrodeCor: TMenuItem;
    CadastrodeTamanho: TMenuItem;
    procedure C1Click(Sender: TObject);
    procedure CadastrodeModelos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastrodeTamanhoClick(Sender: TObject);
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

procedure TfrmPrincipal.CadastrodeModelos1Click(Sender: TObject);
begin
  if (not(Assigned(oCadastroModeloController))) then
    oCadastroModeloController := TCadastroModeloController.Create;
  oCadastroModeloController.CriarForm(Self);
end;

procedure TfrmPrincipal.CadastrodeTamanhoClick(Sender: TObject);
begin
  if (not(Assigned(oCadastroTamanhoController))) then
    oCadastroTamanhoController := TCadastroTamanhoController.Create;
  oCadastroTamanhoController.CriarForm(Self);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  try
    TConexaoSigleton.GetInstancia;
  except
    ShowMessage('Não foi possível conectar ao banco de dados');
    Application.Terminate;
  end;

end;

end.
