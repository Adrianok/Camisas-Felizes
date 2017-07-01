unit uConsultaCorController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaCorModel,
  uInterfaceConsultaBase,uCadastroCorDto, uConsultaCorForm,
  FireDac.Comp.Client, uConsultaCorRegra, uFuncaoRetorno,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows,
  uCor_ModeloModel;

type
  TConsultaCorController = class(TClassInterfaceConsultaBase)
  private
    sCondicao : string;
  public
    procedure PesquisarGrid;  override;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string; sWhere: string = '');  override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaCorController: IInterfaceConsultaBase;

implementation

{ TConsultaCorConsultaController }


procedure TConsultaCorController.Cancelar;
begin
  inherited;

end;

procedure TConsultaCorController.Confirmar;
begin
  inherited;

end;


constructor TConsultaCorController.Create;
begin
  if (not(assigned(oConsultaCorController))) then
    oConsultaCorModel := TConsultaCorModel.Create;

  if (not(assigned(oConsultaCorRegra))) then
    oConsultaCorRegra := TConsultaCorRegra.Create;
end;

procedure TConsultaCorController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string; sWhere: string = '');
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaCorForm.Create(Aowner);
    oFormulario.oController := oConsultaCorController;
    sCondicao := sWhere;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := aString;
  inherited;
end;

destructor TConsultaCorController.Destroy;
begin
  if (assigned(oConsultaCorModel)) then
    FreeAndNil(oConsultaCorModel);

  if (assigned(oConsultaCorRegra)) then
    FreeAndNil(oConsultaCorRegra);

  if (assigned(oConsultaCorModel)) then
    FreeAndNil(oConsultaCorModel);
  inherited;
end;


procedure TConsultaCorController.PesquisarGrid;
begin
  oFormulario.FDMemTableGrid.Filter := 'descricao like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or idcor  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaCorController.PreencherGrid: boolean;
var
  oListaModelo : TList;
begin
  if(sCondicao <> '')then
  try
    oListaModelo := TList.Create;
    if (not(assigned(oCor_ModeloModel))) then
      oCor_ModeloModel := TCor_ModeloModel.Create;
    if(oConsultaCorRegra.SelectAllWhere(oCor_ModeloModel, oFormulario.FDMemTableGrid, oListaModelo, StrToInt(sCondicao)))then
      oFormulario.FDMemTableGrid.Open
    else
      ShowMessage('Não foram encontrados registros');
  finally
    sCondicao := '';
    if (assigned(oCor_ModeloModel)) then
      FreeAndNil(oCor_ModeloModel);
  end
  else
    if(oConsultaCorRegra.SelectAll(oConsultaCorModel, oFormulario.FDMemTableGrid))then
      oFormulario.FDMemTableGrid.Open
    else
      ShowMessage('Não foram encontrados registros');
end;

end.
