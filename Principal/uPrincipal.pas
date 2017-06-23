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
  uCadastroTamanhoController, uCadastroPedidoController, uCadastroMunicipioController;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    CadastrodeCor: TMenuItem;
    CadastrodeTamanho: TMenuItem;
    CadastrodePedidos: TMenuItem;
    CadastrodeMunicipio1: TMenuItem;
    procedure C1Click(Sender: TObject);
    procedure CadastrodeModelos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastrodeCorClick(Sender: TObject);
    procedure CadastrodeTamanhoClick(Sender: TObject);
    procedure CadastrodePedidosClick(Sender: TObject);
    procedure CadastrodeMunicipio1Click(Sender: TObject);
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

procedure TfrmPrincipal.CadastrodeCorClick(Sender: TObject);
begin
  if (not(Assigned(oCadastroCorController))) then
    oCadastroCorController := TCadastroCorController.Create;
  oCadastroCorController.CriarForm(Self);
end;

procedure TfrmPrincipal.CadastrodeModelos1Click(Sender: TObject);
begin
  if (not(Assigned(oCadastroModeloController))) then
    oCadastroModeloController := TCadastroModeloController.Create;
  oCadastroModeloController.CriarForm(Self);
end;

procedure TfrmPrincipal.CadastrodeMunicipio1Click(Sender: TObject);
begin
  if (not(Assigned(oCadastroMunicipioController))) then
    oCadastroMunicipioController := TCadastroMunicipioController.Create;
  oCadastroMunicipioController.CriarForm(Self);
end;

procedure TfrmPrincipal.CadastrodePedidosClick(Sender: TObject);
begin
  if (not(Assigned(oCadastroPedidoController))) then
    oCadastroPedidoController := TCadastroPedidoController.Create;
  oCadastroPedidoController.CriarForm(Self);
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
    ShowMessage('Não foi possível ConsultaCorCadastro ao banco de dados');
    Application.Terminate;
  end;

end;

end.
