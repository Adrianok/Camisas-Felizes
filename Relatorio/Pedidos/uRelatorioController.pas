unit uRelatorioController;

interface

uses
  Vcl.Controls, Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.classes, System.SysUtils,
  uRelatorioModel, uRelatorioForm, uRelatorioDto, uBase,
  FireDac.Comp.Client, Vcl.DbGrids, Vcl.Forms, Winapi.Messages, Winapi.Windows,
  System.Variants, Vcl.Graphics, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,  frxClass,
  frxDBSet, Data.DB, FireDAC.Comp.DataSet,  FireDAC.Comp.UI,
  Vcl.Grids;

type
  TRelatorioController = class (TFrmBase)

  private
  oRelatorioModel : TRelatorioModel;
  oForm : TFrmRelatorio;
  oRelatorioDto : TRelatorioDto;

  public
   procedure CriarForm(Aowner: TComponent);
   procedure PreencherGrid(Sender: TObject); virtual;
   procedure Fechar(Sender: TObject); virtual;
   procedure AlimentarDto;
   procedure AbrirRelatorio(Sender: TObject);

   constructor Create;
   destructor Destroy; override;
  end;

var
  oRelatorioController: TRelatorioController;

implementation

{ TRelatorioConsultaController }

procedure TRelatorioController.AbrirRelatorio;
begin
  oForm.FDMemTable1.Open;
  oForm.ReportSintetico.ShowReport;
end;

procedure TRelatorioController.AlimentarDto;
begin
  oRelatorioDto.ClienteInicial := StrToInt(oForm.EdtClienteInicial.Text);
  oRelatorioDto.ClienteFinal := StrToInt(oForm.EdtClienteFinal.Text);
  oRelatorioDto.DataInicial := (oForm.DtpInicial.Date);
  oRelatorioDto.DataFinal := (oForm.DtpFinal.Date);
  oRelatorioDto.PedidoInicial := StrToInt(oForm.EdtPedidoInicial.Text);
  oRelatorioDto.PedidoFinal := StrToInt(oForm.EdtPedidoFinal.Text);
  oRelatorioDto.ProdutoInicial := StrToInt(oForm.EdtProdutoInicial.Text);
  oRelatorioDto.ProdutoFinal := StrToInt(oform.EdtProdutoFinal.Text);
  oRelatorioDto.MunicipioInicial := StrToInt(oForm.EdtMunicipioInicial.Text);
  oRelatorioDto.MunicipioFinal := StrToInt(oForm.EdtMunicipioFinal.Text);
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
    oForm := TFrmRelatorio.Create(Aowner);

  oForm.btnFecharRel.OnClick := Fechar;
  oForm.btnRelAnalitico.OnClick := AbrirRelatorio;
  oForm.btnFiltrar.onClick := PreencherGrid;
  oForm.DtpInicial.Date := Date - 30;
  oForm.DtpFinal.Date := Date;

  oForm.show;

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
  oForm.FDMemTable1.Close;

  if assigned(oForm) then
    FreeAndNil(oForm);
  if assigned(oRelatorioController) then
    FreeAndNil(oRelatorioController);
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
