unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  VCLTee.TeeFilters, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs, System.UITypes,
  uConexaoSingleTon,
  uBase;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    IconClientesImageList: TImageList;
    IconFecharImageList: TImageList;
    IconFundoColImageList: TImageList;
    IconBarraWinImageList: TImageList;
    IconAlterarTemaImageList: TImageList;
    QuadradoBrancoClientes: TImage;
    QuadradoColoridoClientes: TImage;
    AlterarCor: TPanel;
    AzulCor: TPanel;
    AmareloCor: TPanel;
    AzulEscuroCor: TPanel;
    VerdeCor: TPanel;
    CinzaCor: TPanel;
    PanelClientes: TPanel;
    ImageBrancaClientes: TImage;
    imageColoridaClientes: TImage;
    QuadradoColoridoFundoCol: TImage;
    QuadradoColoridoBarraWin: TImage;
    QuadradoBrancoFundoCol: TImage;
    QuadradoBrancoBarraWin: TImage;
    QuadradoColoridoFechar: TImage;
    QuadradoBrancoFechar: TImage;
    QuadradoColoridoAlterarTema: TImage;
    QuadradoBrancoAlterarTema: TImage;
    FundoColorido: TPanel;
    ImageBrancaFundoCol: TImage;
    imageColoridaFundoCol: TImage;
    WindowsBar: TPanel;
    ImageBrancaWindows: TImage;
    ImageColoridaBarra: TImage;
    PanelFechar: TPanel;
    ImageFecharBranca: TImage;
    imageColoridaFechar: TImage;
    AlterarTema: TPanel;
    imageBrancaTema: TImage;
    imageColoridaTema: TImage;
    ImageFundos: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure MouseEnter(panel: TPanel; imageAzul: TImage; ImageBranca: TImage;
      quadradoAzul: TImage; quadradoBranco: TImage);
    procedure MouseLeave(panel: TPanel; imageAzul: TImage; ImageBranca: TImage;
      quadradoAzul: TImage; quadradoBranco: TImage);
    procedure PanelClientesMouseEnter(Sender: TObject);
    procedure PanelClientesMouseLeave(Sender: TObject);
    procedure FundoColoridoMouseEnter(Sender: TObject);
    procedure FundoColoridoMouseLeave(Sender: TObject);
    procedure WindowsBarMouseEnter(Sender: TObject);
    procedure WindowsBarMouseLeave(Sender: TObject);
    procedure WindowsBarClick(Sender: TObject);
    procedure FundoColoridoClick(Sender: TObject);
    procedure PanelFecharMouseLeave(Sender: TObject);
    procedure PanelFecharMouseEnter(Sender: TObject);
    procedure AlterarTemaMouseEnter(Sender: TObject);
    procedure AlterarTemaMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PanelFecharClick(Sender: TObject);
    procedure CorCheck(ImageList: TImageList; Image: TImage);
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
    procedure PanelClientesClick(Sender: TObject);
  private
    azul: integer;
    verde: integer;
    azulEscuro: integer;
    amarelo: integer;
    cinza: integer;
    branco: integer;

    auxiliar: boolean;
  public
    colorido: integer;

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

procedure TfrmPrincipal.AlterarTemaMouseEnter(Sender: TObject);
begin
  CorCheck(IconAlterarTemaImageList, imageColoridaTema);
  CorCheck(ImageFundos, QuadradoColoridoAlterarTema);
  if (auxiliar) then
    MouseLeave(AlterarTema, imageColoridaTema, imageBrancaTema,
      QuadradoColoridoAlterarTema, QuadradoBrancoAlterarTema)
  else
    MouseEnter(AlterarTema, imageColoridaTema, imageBrancaTema,
      QuadradoColoridoAlterarTema, QuadradoBrancoAlterarTema);
end;

procedure TfrmPrincipal.AlterarTemaMouseLeave(Sender: TObject);
begin
  CorCheck(IconAlterarTemaImageList, imageColoridaTema);
  CorCheck(ImageFundos, QuadradoColoridoAlterarTema);
  if (auxiliar) then
    MouseEnter(AlterarTema, imageColoridaTema, imageBrancaTema,
      QuadradoColoridoAlterarTema, QuadradoBrancoAlterarTema)
  else
    MouseLeave(AlterarTema, imageColoridaTema, imageBrancaTema,
      QuadradoColoridoAlterarTema, QuadradoBrancoAlterarTema)
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

procedure TfrmPrincipal.ChangeColor;
begin
  if (frmPrincipal.Color = branco) then
  begin
    FundoColoridoMouseLeave(self);
    PanelClientesMouseLeave(self);
    WindowsBarMouseLeave(self);
    PanelFecharMouseLeave(self);
    AlterarTemaMouseLeave(self);
  end
  else
  begin
    frmPrincipal.Color := colorido;
    FundoColoridoMouseLeave(self);
    PanelClientesMouseLeave(self);
    WindowsBarMouseLeave(self);
    PanelFecharMouseLeave(self);
    AlterarTemaMouseLeave(self);
  end;
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

procedure TfrmPrincipal.CorCheck(ImageList: TImageList; Image: TImage);
begin
  // Para um funcionamento correto as imagens devem estar dispostas no imagelist
  // nessa ordem : amarelo, azul, azulEscuro, cinza e verde, também devem estar no formato .bmp
  if (colorido = amarelo) then
    ImageList.GetIcon(0, Image.Picture.icon)
  else if (colorido = azul) then
    ImageList.GetIcon(1, Image.Picture.icon)
  else if (colorido = azulEscuro) then
    ImageList.GetIcon(2, Image.Picture.icon)
  else if (colorido = cinza) then
    ImageList.GetIcon(3, Image.Picture.icon)
  else if (colorido = verde) then
    ImageList.GetIcon(4, Image.Picture.icon)
  else
    ImageList.GetIcon(1, Image.Picture.icon)
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
  if MessageDlg('Deseja fechar o programa?', mtConfirmation, mbYesNo, 0) <> MrYes
  then
    Action := caNone;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  amarelo := $00018FF1;
  verde := $00047644;
  cinza := $00535864;
  azul := $00F08000;
  azulEscuro := $006A6838;
  branco := clWhite;
  colorido := azul;
  frmPrincipal.Color := branco;
  imageColoridaClientes.Visible := False;
  imageColoridaFundoCol.Visible := False;
  ImageColoridaBarra.Visible := False;
  imageColoridaFechar.Visible := False;
  imageColoridaTema.Visible := False;

  try
    TConexaoSigleton.GetInstancia;
  except
    ShowMessage('Não foi possível conectar ao banco de dados!');
    Application.Terminate;
  end;

end;

procedure TfrmPrincipal.FundoColoridoClick(Sender: TObject);
begin
  auxiliar := False;
  if (frmPrincipal.Color = branco) then
  begin
    frmPrincipal.Color := colorido;
    FundoColoridoMouseLeave(self);
    PanelClientesMouseEnter(self);
    WindowsBarMouseEnter(self);
    PanelFecharMouseEnter(self);
    AlterarTemaMouseEnter(self);
    auxiliar := True;
  end
  else
  begin
    frmPrincipal.Color := branco;
    FundoColoridoMouseEnter(self);
    PanelClientesMouseLeave(self);
    WindowsBarMouseLeave(self);
    PanelFecharMouseLeave(self);
    AlterarTemaMouseLeave(self);
    auxiliar := False;
  end;
end;

procedure TfrmPrincipal.FundoColoridoMouseEnter(Sender: TObject);
begin
  CorCheck(ImageFundos, QuadradoColoridoFundoCol);
  CorCheck(IconFundoColImageList, imageColoridaFundoCol);
  if (auxiliar) then
    MouseLeave(FundoColorido, imageColoridaFundoCol, ImageBrancaFundoCol,
      QuadradoColoridoFundoCol, QuadradoBrancoFundoCol)
  else
    MouseEnter(FundoColorido, imageColoridaFundoCol, ImageBrancaFundoCol,
      QuadradoColoridoFundoCol, QuadradoBrancoFundoCol);
end;

procedure TfrmPrincipal.FundoColoridoMouseLeave(Sender: TObject);
begin
  CorCheck(ImageFundos, QuadradoColoridoFundoCol);
  CorCheck(IconFundoColImageList, imageColoridaFundoCol);
  if (auxiliar) then
    MouseEnter(FundoColorido, imageColoridaFundoCol, ImageBrancaFundoCol,
      QuadradoColoridoFundoCol, QuadradoBrancoFundoCol)
  else
    MouseLeave(FundoColorido, imageColoridaFundoCol, ImageBrancaFundoCol,
      QuadradoColoridoFundoCol, QuadradoBrancoFundoCol);
end;

procedure TfrmPrincipal.MouseEnter(panel: TPanel; imageAzul: TImage;
  ImageBranca: TImage; quadradoAzul: TImage; quadradoBranco: TImage);
begin
  panel.Color := branco;
  panel.Font.Color := colorido;
  imageAzul.Visible := True;
  ImageBranca.Visible := False;
  quadradoAzul.Visible := True;
  quadradoBranco.Visible := False;
end;

procedure TfrmPrincipal.MouseLeave(panel: TPanel; imageAzul: TImage;
  ImageBranca: TImage; quadradoAzul: TImage; quadradoBranco: TImage);
begin
  panel.Color := colorido;
  panel.Font.Color := branco;
  imageAzul.Visible := False;
  ImageBranca.Visible := True;
  quadradoAzul.Visible := False;
  quadradoBranco.Visible := True;
end;

procedure TfrmPrincipal.PanelFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.PanelFecharMouseEnter(Sender: TObject);
begin
  CorCheck(IconFecharImageList, imageColoridaFechar);
  CorCheck(ImageFundos, QuadradoColoridoFechar);
  if (auxiliar) then
    MouseLeave(PanelFechar, imageColoridaFechar, ImageFecharBranca,
      QuadradoColoridoFechar, QuadradoBrancoFechar)
  else
    MouseEnter(PanelFechar, imageColoridaFechar, ImageFecharBranca,
      QuadradoColoridoFechar, QuadradoBrancoFechar)

end;

procedure TfrmPrincipal.PanelFecharMouseLeave(Sender: TObject);
begin
  CorCheck(IconFecharImageList, imageColoridaFechar);
  CorCheck(ImageFundos, QuadradoColoridoFechar);
  if (auxiliar) then
    MouseEnter(PanelFechar, imageColoridaFechar, ImageFecharBranca,
      QuadradoColoridoFechar, QuadradoBrancoFechar)
  else
    MouseLeave(PanelFechar, imageColoridaFechar, ImageFecharBranca,
      QuadradoColoridoFechar, QuadradoBrancoFechar);
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

procedure TfrmPrincipal.PanelClientesClick(Sender: TObject);
begin
  // Quando For Abrir o form base é necessário dar PanelFundoPrincipal.Visible := False;
  // E quando voltar para o form principal PanelFundoPrincipal.Visible := True;
  if not(Assigned(frmBase)) then
  begin
    frmBase := TfrmBase.Create(self);
    frmBase.Show;
  end;

end;

procedure TfrmPrincipal.PanelClientesMouseEnter(Sender: TObject);
begin
  CorCheck(IconClientesImageList, imageColoridaClientes);
  CorCheck(ImageFundos, QuadradoColoridoClientes);
  if (auxiliar) then
    MouseLeave(PanelClientes, imageColoridaClientes, ImageBrancaClientes,
      QuadradoColoridoClientes, QuadradoBrancoClientes)
  else
    MouseEnter(PanelClientes, imageColoridaClientes, ImageBrancaClientes,
      QuadradoColoridoClientes, QuadradoBrancoClientes);
end;

procedure TfrmPrincipal.PanelClientesMouseLeave(Sender: TObject);
begin
  CorCheck(IconClientesImageList, imageColoridaClientes);
  CorCheck(ImageFundos, QuadradoColoridoClientes);
  if (auxiliar) then
    MouseEnter(PanelClientes, imageColoridaClientes, ImageBrancaClientes,
      QuadradoColoridoClientes, QuadradoBrancoClientes)
  else
    MouseLeave(PanelClientes, imageColoridaClientes, ImageBrancaClientes,
      QuadradoColoridoClientes, QuadradoBrancoClientes);
end;

procedure TfrmPrincipal.WindowsBarClick(Sender: TObject);
begin

  if (frmPrincipal.BorderStyle = bsNone) then
    frmPrincipal.BorderStyle := bsSizeable
  else
    frmPrincipal.BorderStyle := bsNone;
end;

procedure TfrmPrincipal.WindowsBarMouseEnter(Sender: TObject);
begin
  CorCheck(IconBarraWinImageList, ImageColoridaBarra);
  CorCheck(ImageFundos, QuadradoColoridoBarraWin);
  if (auxiliar) then
    MouseLeave(WindowsBar, ImageColoridaBarra, ImageBrancaWindows,
      QuadradoColoridoBarraWin, QuadradoBrancoBarraWin)
  else
    MouseEnter(WindowsBar, ImageColoridaBarra, ImageBrancaWindows,
      QuadradoColoridoBarraWin, QuadradoBrancoBarraWin);
end;

procedure TfrmPrincipal.WindowsBarMouseLeave(Sender: TObject);
begin
  CorCheck(IconBarraWinImageList, ImageColoridaBarra);
  CorCheck(ImageFundos, QuadradoColoridoBarraWin);
  if (auxiliar) then
    MouseEnter(WindowsBar, ImageColoridaBarra, ImageBrancaWindows,
      QuadradoColoridoBarraWin, QuadradoBrancoBarraWin)
  else
    MouseLeave(WindowsBar, ImageColoridaBarra, ImageBrancaWindows,
      QuadradoColoridoBarraWin, QuadradoBrancoBarraWin);
end;

end.
