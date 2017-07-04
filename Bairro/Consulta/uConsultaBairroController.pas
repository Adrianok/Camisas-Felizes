unit uConsultaBairroController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaBairroModel,
  uInterfaceConsultaBase,uCadastroBairroDto, uConsultaBairroForm,
  FireDac.Comp.Client, uConsultaBairroRegra, uFuncaoRetorno,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaBairroController = class(TClassInterfaceConsultaBase)
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
  oConsultaBairroController: IInterfaceConsultaBase;

implementation

{ TConsultaBairroConsultaController }


procedure TConsultaBairroController.Cancelar;
begin
  inherited;

end;

procedure TConsultaBairroController.Confirmar;
begin
  inherited;

end;


constructor TConsultaBairroController.Create;
begin
  if (not(assigned(oConsultaBairroController))) then
    oConsultaBairroModel := TConsultaBairroModel.Create;

  if (not(assigned(oConsultaBairroRegra))) then
    oConsultaBairroRegra := TConsultaBairroRegra.Create;
end;

procedure TConsultaBairroController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string; sWhere: string = '');
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaBairroForm.Create(Aowner);
    oFormulario.oController := oConsultaBairroController;
    sCondicao := sWhere;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := aString;
  inherited;
end;

destructor TConsultaBairroController.Destroy;
begin
  if (assigned(oConsultaBairroModel)) then
    FreeAndNil(oConsultaBairroModel);

  if (assigned(oConsultaBairroRegra)) then
    FreeAndNil(oConsultaBairroRegra);

  if (assigned(oConsultaBairroModel)) then
    FreeAndNil(oConsultaBairroModel);
  inherited;
end;


procedure TConsultaBairroController.PesquisarGrid;
begin
  oFormulario.FDMemTableGrid.Filter := 'descricao like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or idBairro  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaBairroController.PreencherGrid: boolean;
var
  oListaModelo : TList;
begin
  if(oConsultaBairroRegra.SelectAll(oConsultaBairroModel, oFormulario.FDMemTableGrid))then
    oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('Não foram encontrados registros');
end;

end.
