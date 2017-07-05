unit uConsultaClienteController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaClienteModel,
  uInterfaceConsultaBase,uCadastroClienteDto, uConsultaClienteForm,
  FireDac.Comp.Client, uConsultaClienteRegra, uFuncaoRetorno,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows, uCadastroClienteRegra;

type
  TConsultaClienteController = class(TClassInterfaceConsultaBase)
  private
    oConsultaClienteRegra : TConsultaClienteRegra;
    oConsultaClienteModel : TConsultaClienteModel;
  public
    procedure PesquisarGrid;  override;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string; sWhere: string = '');    override;
    procedure Confirmar; override;
    procedure Cancelar; override;


    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaClienteController: IInterfaceConsultaBase;

implementation

{ TConsultaClienteConsultaController }


procedure TConsultaClienteController.Cancelar;
begin
  inherited;

end;

procedure TConsultaClienteController.Confirmar;
begin
  inherited;

end;


constructor TConsultaClienteController.Create;
begin
  if (not(assigned(oConsultaClienteController))) then
    oConsultaClienteModel := TConsultaClienteModel.Create;

  if (not(assigned(oConsultaClienteRegra))) then
    oConsultaClienteRegra := TConsultaClienteRegra.Create;
end;

procedure TConsultaClienteController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string; sWhere: string = '');
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaClienteForm.Create(Aowner);
    oFormulario.oController := oConsultaClienteController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := aString;
  inherited;
end;

destructor TConsultaClienteController.Destroy;
begin
  if (assigned(oConsultaClienteModel)) then
    FreeAndNil(oConsultaClienteModel);

  if (assigned(oConsultaClienteRegra)) then
    FreeAndNil(oConsultaClienteRegra);

  if (assigned(oConsultaClienteModel)) then
    FreeAndNil(oConsultaClienteModel);

  inherited;
end;


procedure TConsultaClienteController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'nome like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or idCliente  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaClienteController.PreencherGrid: boolean;
begin
  if(oConsultaClienteRegra.SelectAll(oConsultaClienteModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('Não foram encontrados registros');
end;



end.
