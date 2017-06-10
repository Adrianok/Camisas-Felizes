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
    function PreencherGrid(MemTable : TFDMemTable):boolean; override;
    procedure CriarForm(Aowner: TComponent;var oCadastroCorDto : TCadastroCorDto); override;
    procedure Confirmar; override;
    procedure Cancelar; override;

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



  if (not(assigned(oConsultaCorController))) then
    oConsultaCorModel := TConsultaCorModel.Create;

  if (not(assigned(oConsultaCorRegra))) then
    oConsultaCorRegra := TConsultaCorRegra.Create;
end;

procedure TConsultaCorController.CriarForm(Aowner: TComponent;var oCadastroCorDto : TCadastroCorDto);
begin
  inherited;
  if not(assigned(oFormulario)) then
    oFormulario :=  TConsultaCorForm.Create(Aowner);
  oFormulario.oController := oConsultaCorController;
  oFormulario.Show;

  oFormulario.edtPesquisa.Text := oCadastroCorDto.Descricao;

  PreencherGrid(oFormulario.FDMemTableGrid);
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
var
  iPos : Integer;
begin
  inherited;
  //Falta pesquisar no dbgrid


// if(oConsultaCorRegra.SelectId(oConsultaCorModel, oFormulario.edtPesquisa.Text) = 0) then
//  ShowMessage('Registro Não Encontrado')
// else
  //ShowMessage(IntTostr(oFormulario.DBGrid1.ComponentCount));
//  iPos := oConsultaCorRegra.SelectId(oConsultaCorModel, oFormulario.edtPesquisa.Text);
     // oFormulario.DBGrid1.Options.dgEditing := True;
    oFormulario.DBGrid1.SelectedIndex := 13;
  //ShowMessage(oFormulario.DBGrid1.Columns[iPos].Field.Text);
  //oFormulario.DBGrid1.SelectedIndex := oConsultaCorRegra.SelectId(oConsultaCorModel, oFormulario.edtPesquisa.Text);
 end;

function TConsultaCorController.PreencherGrid(MemTable: TFDMemTable): boolean;
begin

  if(oConsultaCorRegra.SelectAll(oConsultaCorModel, MemTable))then
    MemTable.Open
  else
    ShowMessage('Não foram encontrados registros');

end;

end.
