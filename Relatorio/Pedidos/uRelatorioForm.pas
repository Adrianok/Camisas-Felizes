unit uRelatorioForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, frxClass;

type
  TFrmRelatorio = class(TForm)
    Panel1: TPanel;
    btnFechar: TBitBtn;
    DBGridRelatório: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    Panel2: TPanel;
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
    btnImprimir: TButton;
    Button1: TButton;
    ReportSintetico: TfrxReport;
    ReportAnalitico: TfrxReport;
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
