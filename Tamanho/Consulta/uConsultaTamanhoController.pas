unit uConsultaTamanhoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaTamanhoModel,
  uInterfaceConsultaBase,uCadastroTamanhoDto, uConsultaTamanhoForm,
  FireDac.Comp.Client, uConsultaTamanhoRegra, uFuncaoRetorno,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaTamanhoController = class(TClassInterfaceConsultaBase)
  private
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
  oConsultaTamanhoController: IInterfaceConsultaBase;

implementation

{ TConsultaTamanhoConsultaController }

procedure TConsultaTamanhoController.Cancelar;
begin
  inherited;

end;

procedure TConsultaTamanhoController.Confirmar;
begin
  inherited;

end;


constructor TConsultaTamanhoController.Create;
begin
  if (not(assigned(oConsultaTamanhoController))) then
    oConsultaTamanhoModel := TConsultaTamanhoModel.Create;

  if (not(assigned(oConsultaTamanhoRegra))) then
    oConsultaTamanhoRegra := TConsultaTamanhoRegra.Create;
end;

procedure TConsultaTamanhoController.CriarForm(Aowner: TComponent; aRetorno: TRetornoConsulta; aString : string);
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaTamanhoForm.Create(Aowner);
    oFormulario.oController := oConsultaTamanhoController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := aString;
  inherited;
end;

destructor TConsultaTamanhoController.Destroy;
begin
  if (assigned(oConsultaTamanhoModel)) then
    FreeAndNil(oConsultaTamanhoModel);

  if (assigned(oConsultaTamanhoRegra)) then
    FreeAndNil(oConsultaTamanhoRegra);

  if (assigned(oConsultaTamanhoModel)) then
    FreeAndNil(oConsultaTamanhoModel);

  inherited;
end;


procedure TConsultaTamanhoController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'descricao like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or idTamanho  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaTamanhoController.PreencherGrid: boolean;
begin
  if(oConsultaTamanhoRegra.SelectAll(oConsultaTamanhoModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('N�o foram encontrados registros');
end;

end.
