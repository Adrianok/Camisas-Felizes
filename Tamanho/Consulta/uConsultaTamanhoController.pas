unit uConsultaTamanhoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uClasseInterfaceConsultaBase, uConsultaTamanhoModel,
  uInterfaceConsultaBase,uCadastroTamanhoDto, uConsultaTamanhoForm,
  FireDac.Comp.Client, uConsultaTamanhoRegra,
  Vcl.DbGrids, Vcl.Forms, Winapi.Messages,  Winapi.Windows;

type
  TConsultaTamanhoController = class(TClassInterfaceConsultaBase)
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
  oConsultaTamanhoController: IInterfaceConsultaBase;

implementation

{ TConsultaTamanhoConsultaController }

procedure TConsultaTamanhoController.AlimentarDto(Column: TColumn);
begin
  inherited;
   oCadastroTamanhoDto.IdTamanho := StrToInt(Column.Field.Text);
end;

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
  //falta reiniciarSistema
  if (not(assigned(oCadastroTamanhoDto))) then
       raise Exception.Create('Não foi possível abrir este formulário, o sistema será reiniciado');


  if (not(assigned(oConsultaTamanhoController))) then
    oConsultaTamanhoModel := TConsultaTamanhoModel.Create;

  if (not(assigned(oConsultaTamanhoRegra))) then
    oConsultaTamanhoRegra := TConsultaTamanhoRegra.Create;
end;

procedure TConsultaTamanhoController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
  begin
    oFormulario :=  TConsultaTamanhoForm.Create(Aowner);
    oFormulario.oController := oConsultaTamanhoController;
    PreencherGrid;
  end;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := oCadastroTamanhoDto.Descricao;
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
    ShowMessage('Não foram encontrados registros');
end;

end.
