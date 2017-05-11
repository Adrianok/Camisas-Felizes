unit uFuncoesPrincipal;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  VCLTee.TeeFilters, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs;

type
  TFuncoesPrincipais = class
  private

    azul: integer;
    verde: integer;
    azulEscuro: integer;
    amarelo: integer;
    cinza: integer;
    branco: integer;
    auxiliar: boolean;
    colorido: integer;
    procedure CorCheck(ImageList: TImageList; Image: TImage);

    procedure MouseLeave(Panel: TPanel; ImageColorida: TImage;
      ImageBranca: TImage; Quadradocolorido: TImage; QuadradoBranco: TImage);

    procedure MouseEnter(Panel: TPanel; ImageColorida: TImage;
      ImageBranca: TImage; Quadradocolorido: TImage; QuadradoBranco: TImage);

  public

    constructor Create;

    procedure MouseLeaveOutput(Panel: TPanel; ImageColorida: TImage;
      ImageBranca: TImage; Quadradocolorido: TImage; QuadradoBranco: TImage;
      IconImageList: TImageList; QuadradoImageList: TImageList;
      auxiliar: boolean; CorDeFundo: integer; formulario: TForm);

    procedure MouseEnterOutput(Panel: TPanel; ImageColorida: TImage;
      ImageBranca: TImage; Quadradocolorido: TImage; QuadradoBranco: TImage;
      IconImageList: TImageList; QuadradoImageList: TImageList;
      auxiliar: boolean; CorDeFundo: integer; formulario: TForm);

    procedure PercorrerImagens(formulario: TForm; var cor: integer);
    procedure FundoColoridoClick(formulario: TForm;
  cor: integer);
  end;

implementation

{ TFuncoesPrincipais }

procedure TFuncoesPrincipais.CorCheck(ImageList: TImageList; Image: TImage);

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

constructor TFuncoesPrincipais.Create;
begin
  amarelo := $00018FF1;
  verde := $00047644;
  cinza := $00535864;
  azul := $00F08000;
  azulEscuro := $006A6838;
  branco := clWhite;
  colorido := azul;
end;

procedure TFuncoesPrincipais.FundoColoridoClick(formulario: TForm;
  cor: integer);
var
  iIndice: integer;
begin
  colorido := cor;
  auxiliar := false;
  for iIndice := formulario.ComponentCount - 1 downto 0 do
  begin
    if (formulario.Components[iIndice] is TCustomPanel) and
      (formulario.Components[iIndice].Tag <> 0) then
    begin
      if (formulario.Color = branco) then
      begin
        (formulario.Components[iIndice] as TPanel).OnMouseEnter(self);
        auxiliar := True;
      end
      else
      begin
        (formulario.Components[iIndice] as TPanel).OnMouseLeave(self);
        auxiliar := false;
      end;

    end;
  end;

end;

procedure TFuncoesPrincipais.MouseEnter(Panel: TPanel; ImageColorida: TImage;
  ImageBranca: TImage; Quadradocolorido: TImage; QuadradoBranco: TImage);
begin
  Panel.Color := branco;
  Panel.Font.Color := colorido;
  ImageColorida.Visible := True;
  ImageBranca.Visible := false;
  Quadradocolorido.Visible := True;
  QuadradoBranco.Visible := false;
end;

procedure TFuncoesPrincipais.MouseLeaveOutput(Panel: TPanel;
  ImageColorida: TImage; ImageBranca: TImage; Quadradocolorido: TImage;
  QuadradoBranco: TImage; IconImageList: TImageList;
  QuadradoImageList: TImageList; auxiliar: boolean; CorDeFundo: integer;
  formulario: TForm);
begin
  colorido := CorDeFundo;
  PercorrerImagens(formulario, colorido);
  if (auxiliar) then
    MouseEnter(Panel, ImageColorida, ImageBranca, Quadradocolorido,
      QuadradoBranco)

  else
    MouseLeave(Panel, ImageColorida, ImageBranca, Quadradocolorido,
      QuadradoBranco)

end;

procedure TFuncoesPrincipais.PercorrerImagens(formulario: TForm;
  var cor: integer);
var
  iIndice: integer;
  iIndiceImageList: integer;
  Image: TImage;
  quadrado: TImage;
  ImageList: TImageList;
begin
  colorido := cor;

  for iIndice := formulario.ComponentCount - 1 downto 0 do
  begin
    if (formulario.Components[iIndice] is TImage) and
      (formulario.Components[iIndice].Tag <> 0) then
    begin
      Image := (formulario.Components[iIndice] as TImage);
      for iIndiceImageList := formulario.ComponentCount - 1 downto 0 do
      begin
        if (formulario.Components[iIndiceImageList] is TImageList) and
          (formulario.Components[iIndiceImageList].Tag = Image.Tag) then
        begin
          ImageList := (formulario.Components[iIndiceImageList] as TImageList);
          CorCheck(ImageList, Image);
        end;
      end;
    end;
  end;

end;

procedure TFuncoesPrincipais.MouseEnterOutput(Panel: TPanel;
  ImageColorida: TImage; ImageBranca: TImage; Quadradocolorido: TImage;
  QuadradoBranco: TImage; IconImageList: TImageList;
  QuadradoImageList: TImageList; auxiliar: boolean; CorDeFundo: integer;
  formulario: TForm);
begin
  colorido := CorDeFundo;
  PercorrerImagens(formulario, colorido);
  if (auxiliar) then
    MouseLeave(Panel, ImageColorida, ImageBranca, Quadradocolorido,
      QuadradoBranco)

  else
    MouseEnter(Panel, ImageColorida, ImageBranca, Quadradocolorido,
      QuadradoBranco)

end;

procedure TFuncoesPrincipais.MouseLeave(Panel: TPanel; ImageColorida: TImage;
  ImageBranca: TImage; Quadradocolorido: TImage; QuadradoBranco: TImage);
begin
  Panel.Color := colorido;
  Panel.Font.Color := branco;
  ImageColorida.Visible := false;
  ImageBranca.Visible := True;
  Quadradocolorido.Visible := false;
  QuadradoBranco.Visible := True;
end;

end.
