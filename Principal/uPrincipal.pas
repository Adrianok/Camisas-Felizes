unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  VCLTee.TeeFilters, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs, System.UITypes, uBase, uConexaoSingleTon,
  uFuncoesPrincipal, uControllerPrincipal;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    IconClientesImageList: TImageList;
    IconFecharImageList: TImageList;
    IconFundoColImageList: TImageList;
    IconBarraWinImageList: TImageList;
    IconAlterarTemaImageList: TImageList;
    ImageFundos: TImageList;
    AlterarCor: TPanel;
    AzulCor: TPanel;
    AmareloCor: TPanel;
    AzulEscuroCor: TPanel;
    VerdeCor: TPanel;
    CinzaCor: TPanel;
    Panel1: TPanel;
    QuadradoColoridoFundoCol: TImage;
    QuadradoBrancoFundoCol: TImage;
    QuadradoColoridoAlterarTema: TImage;
    QuadradoBrancoAlterarTema: TImage;
    FundoColorido: TPanel;
    ImageBrancaFundoCol: TImage;
    imageColoridaFundoCol: TImage;
    AlterarTema: TPanel;
    imageBrancaTema: TImage;
    PanelClientes: TPanel;
    ImageBrancaClientes: TImage;
    imageColoridaClientes: TImage;
    QuadradoColoridoClientes: TImage;
    QuadradoBrancoClientes: TImage;
    QuadradoColoridoCadastroModelo: TImage;
    QuadradoBrancoCadastroModelo: TImage;
    CadastroModelo: TPanel;
    ImageBrancaCadastroModelo: TImage;
    ImageColoridaCadastroModelo: TImage;
    IconCadastroModeloImageList: TImageList;
    ImageColoridaTema: TImage;
    QuadradoColoridoUF: TImage;
    QuadradoBrancoUF: TImage;
    PanelUF: TPanel;
    ImageBrancaUF: TImage;
    ImageColoridaUf: TImage;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure PanelClientesMouseEnter(Sender: TObject);
    procedure PanelClientesMouseLeave(Sender: TObject);
    procedure FundoColoridoMouseEnter(Sender: TObject);
    procedure FundoColoridoMouseLeave(Sender: TObject);
    procedure FundoColoridoClick(Sender: TObject);
    procedure AlterarTemaMouseEnter(Sender: TObject);
    procedure PanelFecharClick(Sender: TObject);
    procedure AlterarTemaClick(Sender: TObject);
    procedure AzulCorClick(Sender: TObject);
    procedure AzulEscuroCorClick(Sender: TObject);
    procedure AmareloCorClick(Sender: TObject);
    procedure CinzaCorClick(Sender: TObject);
    procedure VerdeCorClick(Sender: TObject);
    procedure ChangeColor;
    procedure AmareloCorMouseEnter(Sender: TObject);
    procedure AmareloCorMouseLeave(Sender: TObject);
    procedure AzulCorMouseLeave(Sender: TObject);
    procedure AzulCorMouseEnter(Sender: TObject);
    procedure AzulEscuroCorMouseEnter(Sender: TObject);
    procedure AzulEscuroCorMouseLeave(Sender: TObject);
    procedure CinzaCorMouseLeave(Sender: TObject);
    procedure CinzaCorMouseEnter(Sender: TObject);
    procedure VerdeCorMouseLeave(Sender: TObject);
    procedure VerdeCorMouseEnter(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CadastroModeloClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AlterarTemaMouseLeave(Sender: TObject);

  private
    oFuncoesPrincipais: TFuncoesPrincipais;
    oControllerPrincipal: TControllerPrincipal;

    azul: integer;
    verde: integer;
    azulEscuro: integer;
    amarelo: integer;
    cinza: integer;
    branco: integer;
  public
    colorido: integer;
    auxiliar: boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AlterarTemaClick(Sender: TObject);
begin
  if (AlterarCor.Visible) then
  begin
    AlterarCor.Visible := False;
  end
  else
  begin
    AlterarCor.Visible := True;
    AzulEscuroCor.Color := azulEscuro;
    AmareloCor.Color := amarelo;
    VerdeCor.Color := verde;
    CinzaCor.Color := cinza;
  end;

end;

procedure TfrmPrincipal.AmareloCorClick(Sender: TObject);
begin
  colorido := amarelo;
  ChangeColor;
  AlterarCor.Visible := False;
end;

procedure TfrmPrincipal.AmareloCorMouseEnter(Sender: TObject);
begin
  AmareloCor.Color := branco;
  AmareloCor.Font.Color := amarelo;
end;

procedure TfrmPrincipal.AmareloCorMouseLeave(Sender: TObject);
begin
  AmareloCor.Color := amarelo;
  AmareloCor.Font.Color := branco;
end;

procedure TfrmPrincipal.AzulCorClick(Sender: TObject);
begin
  colorido := azul;
  ChangeColor;
  AlterarCor.Visible := False;
end;

procedure TfrmPrincipal.AzulCorMouseEnter(Sender: TObject);
begin
  AzulCor.Color := branco;
  AzulCor.Font.Color := azul;
end;

procedure TfrmPrincipal.AzulCorMouseLeave(Sender: TObject);
begin
  AzulCor.Color := azul;
  AzulCor.Font.Color := branco;
end;

procedure TfrmPrincipal.AzulEscuroCorClick(Sender: TObject);
begin
  colorido := azulEscuro;
  ChangeColor;
  AlterarCor.Visible := False;
end;

procedure TfrmPrincipal.AzulEscuroCorMouseEnter(Sender: TObject);
begin
  AzulEscuroCor.Color := branco;
  AzulEscuroCor.Font.Color := azulEscuro;
end;

procedure TfrmPrincipal.AzulEscuroCorMouseLeave(Sender: TObject);
begin
  AzulEscuroCor.Color := azulEscuro;
  AzulEscuroCor.Font.Color := branco;
end;

procedure TfrmPrincipal.CadastroModeloClick(Sender: TObject);
begin
  oControllerPrincipal.intanciarViewCadastroModelo(Self);
end;

procedure TfrmPrincipal.ChangeColor;
begin
  if (frmPrincipal.Color <> branco) then
  begin
    frmPrincipal.Color := colorido;
  end;

  oFuncoesPrincipais.PercorrerImagens(frmPrincipal, colorido);
  FundoColoridoMouseLeave(self);
  PanelClientesMouseLeave(self);
  AlterarTemaMouseLeave(self);

end;

procedure TfrmPrincipal.CinzaCorClick(Sender: TObject);
begin
  colorido := cinza;
  ChangeColor;
  AlterarCor.Visible := False;
end;

procedure TfrmPrincipal.CinzaCorMouseEnter(Sender: TObject);
begin
  CinzaCor.Color := branco;
  CinzaCor.Font.Color := cinza;
end;

procedure TfrmPrincipal.CinzaCorMouseLeave(Sender: TObject);
begin
  CinzaCor.Color := cinza;
  CinzaCor.Font.Color := branco;
end;

procedure TfrmPrincipal.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := WS_DLGFRAME;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  auxiliar := False;
  amarelo := $00018FF1;
  verde := $00047644;
  cinza := $00535864;
  azul := $00F08000;
  azulEscuro := $006A6838;
  branco := clWhite;
  colorido := azulEscuro;
  imageColoridaClientes.Visible := False;
  imageColoridaFundoCol.Visible := False;
  ImageColoridaTema.Visible := False;
  ImageColoridaCadastroModelo.Visible := False;

  if (not(assigned(oFuncoesPrincipais))) then
    oFuncoesPrincipais := TFuncoesPrincipais.Create;
  ChangeColor;
  try
    TConexaoSigleton.GetInstancia;
  except
    ShowMessage('Não foi possível conectar ao banco de dados!');
    Application.Terminate;
  end;

  oControllerPrincipal := TControllerPrincipal.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  if (assigned(oControllerPrincipal)) then
    oControllerPrincipal.Destroy;

  if (assigned(oFuncoesPrincipais)) then
    FreeAndnil(oFuncoesPrincipais);
end;


procedure TfrmPrincipal.PanelFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.VerdeCorClick(Sender: TObject);
begin
  colorido := verde;
  ChangeColor;
  AlterarCor.Visible := False;
end;

procedure TfrmPrincipal.VerdeCorMouseEnter(Sender: TObject);
begin
  VerdeCor.Color := branco;
  VerdeCor.Font.Color := verde;
end;

procedure TfrmPrincipal.VerdeCorMouseLeave(Sender: TObject);
begin
  VerdeCor.Color := verde;
  VerdeCor.Font.Color := branco;
end;

procedure TfrmPrincipal.PanelClientesMouseEnter(Sender: TObject);
begin
  oFuncoesPrincipais.MouseEnterOutput(PanelClientes, imageColoridaClientes,
    ImageBrancaClientes, QuadradoColoridoClientes, QuadradoBrancoClientes,
    ImageFundos, IconClientesImageList, auxiliar, colorido, frmPrincipal);
end;

procedure TfrmPrincipal.PanelClientesMouseLeave(Sender: TObject);
begin

  oFuncoesPrincipais.MouseLeaveOutput(PanelClientes, imageColoridaClientes,
    ImageBrancaClientes, QuadradoColoridoClientes, QuadradoBrancoClientes,
    ImageFundos, IconClientesImageList, auxiliar, colorido, frmPrincipal);
end;

procedure TfrmPrincipal.AlterarTemaMouseEnter(Sender: TObject);
begin
  oFuncoesPrincipais.MouseEnterOutput(AlterarTema, ImageColoridaTema,
    imageBrancaTema, QuadradoColoridoAlterarTema, QuadradoBrancoAlterarTema,
    ImageFundos, IconAlterarTemaImageList, auxiliar, colorido, frmPrincipal);

end;

procedure TfrmPrincipal.AlterarTemaMouseLeave(Sender: TObject);
begin
  oFuncoesPrincipais.MouseLeaveOutput(AlterarTema, ImageColoridaTema,
    imageBrancaTema, QuadradoColoridoAlterarTema, QuadradoBrancoAlterarTema,
    ImageFundos, IconAlterarTemaImageList, auxiliar, colorido, frmPrincipal);

end;

procedure TfrmPrincipal.FundoColoridoClick(Sender: TObject);
begin
oFuncoesPrincipais.FundoColoridoClick(frmPrincipal, colorido);
  if(frmPrincipal.color = branco)then
    frmPrincipal.Color:=colorido
   else
   frmPrincipal.Color :=branco;

end;

procedure TfrmPrincipal.FundoColoridoMouseEnter(Sender: TObject);
begin
oFuncoesPrincipais.MouseLeaveOutput(FundoColorido, imageColoridaFundoCol,
    ImageBrancaFundoCol, QuadradoColoridoFundoCol, QuadradoBrancoFundoCol,
    ImageFundos, IconFundoColImageList, auxiliar, colorido, frmPrincipal);
end;

procedure TfrmPrincipal.FundoColoridoMouseLeave(Sender: TObject);
begin
oFuncoesPrincipais.MouseEnterOutput(FundoColorido, imageColoridaFundoCol,
    ImageBrancaFundoCol, QuadradoColoridoFundoCol, QuadradoBrancoFundoCol,
    ImageFundos, IconFundoColImageList, auxiliar, colorido, frmPrincipal);
end;

end.
