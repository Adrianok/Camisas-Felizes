unit uConsultaMunicipioController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaMunicipioModel,
  uInterfaceConsultaBase, uCadastroMunicipioDto, uConsultaMunicipioForm,
  FireDac.Comp.Client, uConsultaMunicipioRegra,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages, Winapi.Windows, uFuncaoRetorno;

type
  TConsultaMunicipioController = class(TClassInterfaceConsultaBase)
  private
  public
    procedure PesquisarGrid;  override;
    procedure AlimentarDto(Column : TColumn); override;
    function PreencherGrid:boolean; override;
    procedure CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta); override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaMunicipioController: IInterfaceConsultaBase;

implementation

{ TConsultaCorConsultaController }

procedure TConsultaMunicipioController.AlimentarDto(Column: TColumn);
begin
  inherited;
  oCadastroMunicipioDto.id := StrToInt(Column.Field.Text);
end;

procedure TConsultaMunicipioController.Cancelar;
begin
  inherited;
end;

procedure TConsultaMunicipioController.Confirmar;
begin
  inherited;

end;


constructor TConsultaMunicipioController.Create;
begin
  //falta reiniciarSistema
  if (not(assigned(oCadastroMunicipioDto))) then
    raise Exception.Create('N�o foi poss�vel abrir este formul�rio, o sistema ser� reiniciado');

  if (not(assigned(oConsultaMunicipioController))) then
    oConsultaMunicipioModel := TConsultaMunicipioModel.Create;

  if (not(assigned(oConsultaMunicipioRegra))) then
    oConsultaMunicipioRegra := TConsultaMunicipioRegra.Create;
end;

procedure TConsultaMunicipioController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta);
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaMunicipioForm.Create(Aowner);
    oFormulario.oController := oConsultaMunicipioController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := oCadastroMunicipioDto.Municipio;
  inherited;
end;

destructor TConsultaMunicipioController.Destroy;
begin
  if (assigned(oConsultaMunicipioModel)) then
    FreeAndNil(oConsultaMunicipioModel);

  if (assigned(oConsultaMunicipioRegra)) then
    FreeAndNil(oConsultaMunicipioRegra);

  if (assigned(oConsultaMunicipioModel)) then
    FreeAndNil(oConsultaMunicipioModel);

  inherited;
end;


procedure TConsultaMunicipioController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'idMunicipio  like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or descricao  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';;
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaMunicipioController.PreencherGrid: boolean;
begin
  if(oConsultaMunicipioRegra.SelectAll(oConsultaMunicipioModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('N�o foram encontrados registros');
end;

end.
