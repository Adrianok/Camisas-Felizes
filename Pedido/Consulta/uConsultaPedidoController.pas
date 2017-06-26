unit uConsultaPedidoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaPedidoModel,
  uInterfaceConsultaBase,uCadastroPedidoDto, uConsultaPedidoForm,
  FireDac.Comp.Client, uConsultaPedidoRegra, uFuncaoRetorno,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaPedidoController = class(TClassInterfaceConsultaBase)
  private
    oCadastroPedidoDto : TCadastroPedidoDto;
  public
    procedure PesquisarGrid;  override;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string); override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaPedidoController: IInterfaceConsultaBase;

implementation

{ TConsultaPedidoConsultaController }

procedure TConsultaPedidoController.Cancelar;
begin
  inherited;

end;

procedure TConsultaPedidoController.Confirmar;
begin
  inherited;

end;


constructor TConsultaPedidoController.Create;
begin
  if (not(assigned(oConsultaPedidoController))) then
    oConsultaPedidoModel := TConsultaPedidoModel.Create;

  if (not(assigned(oConsultaPedidoRegra))) then
    oConsultaPedidoRegra := TConsultaPedidoRegra.Create;
end;

procedure TConsultaPedidoController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string);
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaPedidoForm.Create(Aowner);
    oFormulario.oController := oConsultaPedidoController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := aString;
  inherited;
end;

destructor TConsultaPedidoController.Destroy;
begin
  if (assigned(oConsultaPedidoModel)) then
    FreeAndNil(oConsultaPedidoModel);

  if (assigned(oConsultaPedidoRegra)) then
    FreeAndNil(oConsultaPedidoRegra);

  if (assigned(oConsultaPedidoModel)) then
    FreeAndNil(oConsultaPedidoModel);

  inherited;
end;

procedure TConsultaPedidoController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'idpedido like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or valortotal  like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or nome  like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or data  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaPedidoController.PreencherGrid: boolean;
begin
  if(oConsultaPedidoRegra.SelectAll(oConsultaPedidoModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('Não foram encontrados registros');
end;

end.
