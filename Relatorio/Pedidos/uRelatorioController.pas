unit uRelatorioController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uRelatorioModel, uRelatorioForm, uRelatorioDto, uBase,
  FireDac.Comp.Client, Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TRelatorioController = class (TFrmBase)
  private

  public
   procedure CriarForm(Aowner: TComponent);
   procedure PreencherGrid(Sender: TObject);
   procedure Fechar(Sender: TObject);
   procedure AlimentarDto;

   constructor Create;
   destructor Destroy; override;
  end;

var
  oRelatorioModel : TRelatorioModel;
  oForm : TFrmRelatorio;
  oRelatorioDto : TRelatorioDto;


implementation

{ TRelatorioConsultaController }

procedure TRelatorioController.AlimentarDto;
begin
  oRelatorioDto.ClienteInicial := StrToInt(oForm.EdtClienteInicial.Text);
  oRelatorioDto.ClienteFinal := StrToInt(oForm.EdtClienteFinal.Text);
  oRelatorioDto.DataInicial := (oForm.DtpInicial.Date);
  oRelatorioDto.DataFinal := (oForm.DtpFinal.Date);
  oRelatorioDto.PedidoInicial := StrToInt(oForm.EdtPedidoInicial.Text);
  oRelatorioDto.PedidoFinal := StrToInt(oForm.EdtPedidoFinal.Text);
end;

constructor TRelatorioController.Create;
begin
  if (not(assigned(oRelatorioModel))) then
    oRelatorioModel := TRelatorioModel.create;

  if (not(assigned(oRelatorioDto))) then
    oRelatorioDto := TRelatorioDto.create;
end;

procedure TRelatorioController.CriarForm(Aowner: TComponent);
begin
  if (not(Assigned(oForm))) then
    oForm := TFrmRelatorio.Create(aOwner);

  oForm.btnFechar.OnClick := Fechar;
  oForm.btnFiltrar.onClick := PreencherGrid;

  oForm.Show;

end;

destructor TRelatorioController.Destroy;
begin
  if (assigned(oRelatorioModel)) then
    FreeAndNil(oRelatorioModel);

  if (assigned(oRelatorioDto)) then
    FreeAndNil(oRelatorioDto);

  inherited;
end;

procedure TRelatorioController.Fechar;
begin
  oForm.Close;
end;

procedure TRelatorioController.PreencherGrid(Sender: TObject);
 begin
  AlimentarDto;

  if(oRelatorioModel.SelectAll(oForm.FDMemTable1, oRelatorioDto))then
   oForm.FDMemTable1.Open
  else
    ShowMessage('Não foram encontrados registros');
 end;


end.
