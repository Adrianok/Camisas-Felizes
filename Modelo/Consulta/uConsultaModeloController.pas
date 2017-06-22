unit uConsultaModeloController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaModeloModel,
  uInterfaceConsultaBase,uCadastroModeloDto, uConsultaModeloForm,
  FireDac.Comp.Client, uConsultaModeloRegra, uFuncaoRetorno,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaModeloController = class(TClassInterfaceConsultaBase)
  private
  public
    procedure PesquisarGrid;  override;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta); override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaModeloController: IInterfaceConsultaBase;

implementation

{ TConsultaModeloConsultaController }

procedure TConsultaModeloController.Cancelar;
begin
  inherited;
end;

procedure TConsultaModeloController.Confirmar;
begin
  inherited;

end;


constructor TConsultaModeloController.Create;
begin
  //falta reiniciarSistema
  if (not(assigned(oCadastroModeloDto))) then
       raise Exception.Create('Não foi possível abrir este formulário, o sistema será reiniciado');

  if(not(oCadastroModeloDto.IdModelo > 0))then
    oCadastroModeloDto.Descricao := '!';

  if (not(assigned(oConsultaModeloController))) then
    oConsultaModeloModel := TConsultaModeloModel.Create;

  if (not(assigned(oConsultaModeloRegra))) then
    oConsultaModeloRegra := TConsultaModeloRegra.Create;


end;

procedure TConsultaModeloController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta);
begin

  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaModeloForm.Create(Aowner);
    oFormulario.oController := oConsultaModeloController;
    PreencherGrid;
  end;
  oFormulario.Show;

  if(oCadastroModeloDto.Descricao <> '!')then
    oFormulario.edtPesquisa.Text := oCadastroModeloDto.Descricao;

  inherited;
end;

destructor TConsultaModeloController.Destroy;
begin
  if (assigned(oConsultaModeloModel)) then
    FreeAndNil(oConsultaModeloModel);

  if (assigned(oConsultaModeloRegra)) then
    FreeAndNil(oConsultaModeloRegra);

  if (assigned(oConsultaModeloModel)) then
    FreeAndNil(oConsultaModeloModel);

  inherited;
end;


procedure TConsultaModeloController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'descricao like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or idModelo  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaModeloController.PreencherGrid: boolean;
begin
  if(oConsultaModeloRegra.SelectAll(oConsultaModeloModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('Não foram encontrados registros');
end;

end.
