unit uConsultaCorController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaCorModel,
  uInterfaceConsultaBase,uCadastroCorDto, uConsultaCorForm,
  FireDac.Comp.Client, uConsultaCorRegra,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaCorController = class(TClassInterfaceConsultaBase)
  private
  public
    procedure PesquisarGrid;  override;
    procedure AlimentarDto(Column : TColumn); override;
    function PreencherGrid:boolean; virtual;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Confirmar; override;
    procedure Cancelar; override;
    procedure MarcarPassagem; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oConsultaCorController: IInterfaceConsultaBase;

implementation

{ TConsultaCorConsultaController }

procedure TConsultaCorController.AlimentarDto(Column: TColumn);
begin
  inherited;
   oCadastroCorDto.IdCor := StrToInt(Column.Field.Text);
end;

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
  //falta reiniciarSistema
  if (not(assigned(oCadastroCorDto))) then
       raise Exception.Create('Não foi possível abrir este formulário, o sistema será reiniciado');

  MarcarPassagem;

  if (not(assigned(oConsultaCorController))) then
    oConsultaCorModel := TConsultaCorModel.Create;

  if (not(assigned(oConsultaCorRegra))) then
    oConsultaCorRegra := TConsultaCorRegra.Create;
end;

procedure TConsultaCorController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaCorForm.Create(Aowner);
    oFormulario.oController := oConsultaCorController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := oCadastroCorDto.Descricao;
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


procedure TConsultaCorController.MarcarPassagem;
begin
  inherited;
  if(not(oCadastroCorDto.IdCor > 0))then
    oCadastroCorDto.Descricao := '!';
end;

procedure TConsultaCorController.PesquisarGrid;
begin
  inherited;
  oFormulario.FDMemTableGrid.Filter := 'descricao like ''%' + oFormulario.edtPesquisa.Text + '%'' '
                                      +'or idcor  like ''%' + oFormulario.edtPesquisa.Text + '%'' ';
  oFormulario.FDMemTableGrid.Filtered := True;
 end;

function TConsultaCorController.PreencherGrid: boolean;
begin
  if(oConsultaCorRegra.SelectAll(oConsultaCorModel, oFormulario.FDMemTableGrid))then
  oFormulario.FDMemTableGrid.Open
  else
    ShowMessage('Não foram encontrados registros');
end;

end.
