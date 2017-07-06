unit uCadastroCorController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroCorDto, uClasseInterfaceViewBase,
  uCadastroCorRegra, uCadastroCorModel,
  uCadastroCorForm, uInterfaceViewBase,
  uConsultaCorForm, uConsultaCorController,
  uCor_ModeloModel;

type
  TCadastroCorController = class(TClassInterfaceViewBase)
  private
    oCadastroCorDto : TCadastroCorDto;
    oCadastroCorRegra: TCadastroCorRegra;
    oCadastroCorModel: TCadastroCorModel;
    oCor_ModeloModel : TCor_ModeloModel;
    oForm : TCadastroCorForm;

    procedure RetornoCor(aIdCor : integer);
  public
    procedure Excluir; override;
    procedure Inicial; override;
    procedure Verificar(ActiveControl: TWinControl); override;
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl); override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroCorController: IInterfaceViewBase;

implementation


{ TControllerCadastroCor }

constructor TCadastroCorController.Create;
begin
  if (not(assigned(oCor_ModeloModel))) then
    oCor_ModeloModel := TCor_ModeloModel.Create;

  if (not(assigned(oCadastroCorModel))) then
    oCadastroCorModel := TCadastroCorModel.Create;

  if (not(assigned(oCadastroCorDto))) then
    oCadastroCorDto := TCadastroCorDto.Create;

  if (not(assigned(oCadastroCorRegra))) then
    oCadastroCorRegra := TCadastroCorRegra.Create;
end;

procedure TCadastroCorController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroCorForm.Create(Aowner);
  oFormulario.oController := oCadastroCorController;
  oFormulario.Show;
  oForm := (oFormulario as TCadastroCorForm);
  inherited;
end;

destructor TCadastroCorController.Destroy;
begin
  if (assigned(oCor_ModeloModel)) then
    FreeAndNil(oCor_ModeloModel);

  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

  if (assigned(oCadastroCorRegra)) then
    FreeAndNil(oCadastroCorRegra);

    inherited;
end;



procedure TCadastroCorController.Excluir;
begin
  inherited;
  oCadastroCorRegra.Deletar(oCor_ModeloModel, oCadastroCorModel, oCadastroCorDto.IdCor);
end;

procedure TCadastroCorController.Inicial;
begin
  inherited;

end;

procedure TCadastroCorController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroCorController.NovoID;
begin
 if(oCadastroCorRegra.Novo(oCadastroCorModel, oCadastroCorDto))then
  (oFormulario as TCadastroCorForm).edtCodigo.Text := IntToStr(oCadastroCorDto.IdCor);
end;

procedure TCadastroCorController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
 sIdCor : string;
begin
  inherited;
  sIdCor :=    (oFormulario as TCadastroCorForm).edtCodigo.Text;

  if(sIdCor <> '')then
    oCadastroCorDto.IdCor        :=  StrToInt(sIdCor);
  oCadastroCorDto.Descricao    :=(oFormulario as TCadastroCorForm).edtCor.Text;

  if (not(assigned(oConsultaCorController))) then
    oConsultaCorController := TConsultaCorController.Create;
  oConsultaCorController.CriarForm(Aowner, RetornoCor, oCadastroCorDto.Descricao);
end;

procedure TCadastroCorController.RetornoCor(aIdCor: integer);
begin
  if(aIdCor <> 0)then
  begin
    oCadastroCorDto.IdCor :=  aIdCor;
    if(oCadastroCorRegra.SelectCor(oCadastroCorModel, oCadastroCorDto))then
    with (oFormulario as TCadastroCorForm) do
    begin
      edtCodigo.Text :=   IntToStr(oCadastroCorDto.IdCor);
      edtCor.Text    :=  oCadastroCorDto.Descricao;
    end;
  end;
end;

procedure TCadastroCorController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroCorForm) do
    begin
      oCadastroCorDto.IdCor        :=  StrToInt(edtCodigo.Text);
      oCadastroCorDto.Descricao          :=  edtCor.Text;
    end;
    if(oCadastroCorRegra.SelectDescricao(oCadastroCorModel, oCadastroCorDto))then
      if(oForm.edtCodigo.Text <> IntToStr(oCadastroCorDto.IdCor)and(oForm.edtCodigo.Text <> ''))then
        raise Exception.Create('Essa cor já possui cadastro');
    if(oCadastroCorRegra.Salvar(oCadastroCorModel, oCadastroCorDto))then
      ShowMessage('Registro: '+ oCadastroCorDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroCorDto.Descricao +' Inserido com sucesso');
    end;
end;




procedure TCadastroCorController.Verificar(ActiveControl: TWinControl);
begin
  inherited;
  if(ActiveControl = oForm.edtCodigo)then
  begin
    if(oCadastroCorRegra.SelectCor(oCadastroCorModel, oCadastroCorDto))then
      oForm.edtCor.Text := oCadastroCorDto.Descricao
    else
      NovoID;
  end
  else
  if(ActiveControl = oForm.edtCor)then
  begin
    if(oCadastroCorRegra.SelectDescricao(oCadastroCorModel, oCadastroCorDto))then
      oForm.edtCodigo.Text := IntToStr(oCadastroCorDto.IdCor)
  end;
end;

end.
