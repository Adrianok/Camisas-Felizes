unit uConsultaUfController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaUfModel,
  uInterfaceConsultaBase, uCadastroUfDto, uConsultaUfForm,
  FireDac.Comp.Client, uConsultaUfRegra,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages, Winapi.Windows;

type
  TConsultaUfController = class(TClassInterfaceConsultaBase)
  private
  public
    procedure PesquisarGrid;  override;
    procedure AlimentarDto(Column : TColumn); override;
    function PreencherGrid:boolean; override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaUfController: IInterfaceConsultaBase;

implementation

{ TConsultaCorConsultaController }

procedure TConsultaUfController.AlimentarDto(Column: TColumn);
begin
  inherited;
  oCadastroUfDto.id := StrToInt(Column.Field.Text);
end;

procedure TConsultaUfController.Cancelar;
begin
  inherited;
end;

procedure TConsultaUfController.Confirmar;
begin
  inherited;

end;


constructor TConsultaUfController.Create;
begin
  //falta reiniciarSistema
  if (not(assigned(oCadastroUfDto))) then
    raise Exception.Create('Não foi possível abrir este formulário, o sistema será reiniciado');

  if (not(assigned(oConsultaUfController))) then
    oConsultaUfModel := TConsultaUfModel.Create;

  if (not(assigned(oConsultaUfRegra))) then
    oConsultaUfRegra := TConsultaUfRegra.Create;
end;

procedure TConsultaUfController.CriarForm(Aowner: TComponent);
begin
  inherited;
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaUfForm.Create(Aowner);
    oFormulario.oController := oConsultaUfController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := oCadastroUfDto.uf;

end;

destructor TConsultaUfController.Destroy;
begin
  if (assigned(oConsultaUfModel)) then
    FreeAndNil(oConsultaUfModel);

  if (assigned(oConsultaUfRegra)) then
    FreeAndNil(oConsultaUfRegra);

  if (assigned(oConsultaUfModel)) then
    FreeAndNil(oConsultaUfModel);

  inherited;
end;


procedure TConsultaUfController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'sigla like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or iduf  like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or descricao  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';;
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaUfController.PreencherGrid: boolean;
begin
  if(oConsultaUfRegra.SelectAll(oConsultaUfModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('Não foram encontrados registros');
end;

end.
