unit uCadastroUfController;

interface

uses
  System.SysUtils, System.classes, FireDAC.Comp.Client, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, Dialogs,
  FireDAC.Comp.DataSet,
  uCadastroUfModel,
  uConexaoSingleTon,
  uCadastroUfDTO,
  uCadastroUfRegra,
  uCadastroUfForm,
  uClasseInterfaceViewBase,
  uInterfaceViewBase,
  uBase;

type
  TCadastroUfController = class(TClassInterfaceViewBase)
  private
    oCadastroUfDTO: TCadastroUfDTO;
    oCadastroUfModel: TCadastroUfModel;
    oCadastroUfRegra: TCadastroUfRegra;
  public
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Fechar; override;
    procedure Salvar; override;
    procedure Deletar(Sender: TObject);
    procedure PreencherForm;

    constructor Create;
    destructor Destroy; override;

  end;

var
  oCadastroUfController: IInterfaceViewBase;

implementation

{ TUfController }


constructor TCadastroUfController.Create;
begin
  oCadastroUfDTO := TCadastroUfDTO.Create;
  oCadastroUfModel := TCadastroUfModel.Create;
  oCadastroUfRegra := TCadastroUfRegra.Create;
end;

procedure TCadastroUfController.CriarForm(Aowner: TComponent);
begin
  if (not(Assigned(oFormulario))) then
    oFormulario := TCadastroUfForm.Create(Aowner);
  oFormulario.oController := oCadastroUfController;
  oFormulario.Show;
end;

procedure TCadastroUfController.Deletar;
var
  IdUf: Integer;
begin
  IdUf := StrToInt((oFormulario as TCadastroUfForm).LedtCodigo.Text);
  oCadastroUfRegra.Deletar(oCadastroUfModel, IdUf);
end;

destructor TCadastroUfController.Destroy;
begin
  inherited;

  if (Assigned(oCadastroUfDTO)) then
    FreeAndNil(oCadastroUfDTO);

  if (Assigned(oCadastroUfModel)) then
    FreeAndNil(oCadastroUfModel);

  if (Assigned(oCadastroUfRegra)) then
    FreeAndNil(oCadastroUfRegra);
end;

procedure TCadastroUfController.Fechar;
begin
  inherited;
  if (Assigned(oFormulario)) then
  begin
    oFormulario.Close;
    FreeAndNil(oFormulario);
  end;
end;

procedure TCadastroUfController.Novo;
begin
  if (oCadastroUfRegra.Novo(oCadastroUfDTO)) then
    (oFormulario as TCadastroUfForm).LedtCodigo.Text := IntToStr(oCadastroUfDTO.id);
  inherited;

end;

procedure TCadastroUfController.PreencherForm;
begin
  { oCadastroUfForm. }
end;

procedure TCadastroUfController.Salvar;
begin


  with (oFormulario as TCadastroUfForm) do
  begin
    oCadastroUfDTO.id := StrToInt(LedtCodigo.Text);
    oCadastroUfDTO.uf := LedtUf.Text;
    oCadastroUfDTO.nome := LedtNome.Text;
  end;

  if (oCadastroUfRegra.Salvar(oCadastroUfModel, oCadastroUfDTO)) then
    ShowMessage('Registro: ' + oCadastroUfDTO.uf + ' Atualizado com sucesso')
  else
    ShowMessage('Registro: ' + oCadastroUfDTO.uf + ' Inserido com sucesso');

  inherited;
end;

end.
