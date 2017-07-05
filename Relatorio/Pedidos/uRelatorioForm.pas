unit uRelatorioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, frxClass, frxDBSet, FireDAC.Stan.Async, FireDAC.DApt, frxChart;

type
  TFrmRelatorio = class
    Panelrel: TPanel;
    btnFecharRel: TBitBtn;
    DBGridRelatorio: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    Panel22: TPanel;
    Label1: TLabel;
    btnFiltrar: TButton;
    EdtClienteInicial: TEdit;
    EdtPedidoinicial: TEdit;
    EdtPedidoFinal: TEdit;
    EdtClienteFinal: TEdit;
    DtpInicial: TDateTimePicker;
    Label2: TLabel;
    DtpFinal: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    btnRelAnalitico: TButton;
    ReportSintetico: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDMemTable1idpedido: TIntegerField;
    FDMemTable1data: TDateField;
    FDMemTable1valortotal: TCurrencyField;
    FDMemTable1nome: TStringField;
    FDMemTable1idcliente: TIntegerField;
    frxChartObject1: TfrxChartObject;
    EdtMunicipioInicial: TEdit;
    Label5: TLabel;
    EdtMunicipioFinal: TEdit;
    EdtProdutoInicial: TEdit;
    Label8: TLabel;
    EdtProdutoFinal: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    FDMemTable1modelo: TIntegerField;
    FDMemTable1municipio: TIntegerField;
    FDMemTable1valoritem: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

end.
