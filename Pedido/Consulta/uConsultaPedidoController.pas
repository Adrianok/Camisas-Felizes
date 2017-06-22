unit uConsultaPedidoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaPedidoModel,
  uInterfaceConsultaBase,uCadastroPedidoDto, uConsultaPedidoForm,
  FireDac.Comp.Client, uConsultaPedidoRegra,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaPedidoController = class(TClassInterfaceConsultaBase)
  private
  public
    procedure PesquisarGrid;  override;
    procedure AlimentarDto(Column : TColumn); override;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaPedidoController: IInterfaceConsultaBase;

implementation

{ TConsultaPedidoConsultaController }

procedure TConsultaPedidoController.AlimentarDto(Column: TColumn);
begin
  inherited;
   oCadastroPedidoDto.IdPedido := StrToInt(Column.Field.Text);
end;

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
  //falta reiniciarSistema
  if (not(assigned(oCadastroPedidoDto))) then
       raise Exception.Create('Não foi possível abrir este formulário, o sistema será reiniciado');

  if (not(assigned(oConsultaPedidoController))) then
    oConsultaPedidoModel := TConsultaPedidoModel.Create;

  if (not(assigned(oConsultaPedidoRegra))) then
    oConsultaPedidoRegra := TConsultaPedidoRegra.Create;
end;

procedure TConsultaPedidoController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaPedidoForm.Create(Aowner);
    oFormulario.oController := oConsultaPedidoController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := IntToStr(oCadastroPedidoDto.IdPedido);
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
