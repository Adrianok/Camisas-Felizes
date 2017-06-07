unit uCadastroCorController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroCorDto, uClasseInterfaceViewBase,
  uCadastroCorRegra, uCadastroCorModel,
  uCadastroCorForm, uInterfaceViewBase,
  uCadastroCorConsultaForm, uCadastroCorConsultaController;

type
  TCadastroCorController = class(TClassInterfaceViewBase)
  private
  public
    procedure CriarFormConsulta(Aowner: TComponent); override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Fechar; override;
    procedure Salvar; override;
    procedure Alterar; override;
    procedure Pesquisar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroCorController: IInterfaceViewBase;

implementation


{ TControllerCadastroCor }

procedure TCadastroCorController.Alterar;
begin


  inherited;
end;

constructor TCadastroCorController.Create;
begin
  if (not(assigned(oCadastroCorModel))) then
    oCadastroCorModel := TCadastroCorModel.Create;

  if (not(assigned(oCadastroCorDto))) then
    oCadastroCorDto := TCadastroCorDto.Create;

  if (not(assigned(oCadastroCorRegra))) then
    oCadastroCorRegra := TCadastroCorRegra.Create;
end;

procedure TCadastroCorController.CriarForm(Aowner: TComponent);
begin
  inherited;
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroCorForm.Create(Aowner);
  oFormulario.oController := oCadastroCorController;
  oFormulario.oControllerConsulta := oCadastroCorConsultaController;
  oFormulario.Show;
end;



procedure TCadastroCorController.CriarFormConsulta(Aowner: TComponent);
begin
  if (not(assigned(oCadastroCorConsultaController))) then
    oCadastroCorConsultaController := TCadastroCorConsultaController.Create;
  oCadastroCorConsultaController.CriarForm(Aowner);
end;

destructor TCadastroCorController.Destroy;
begin
  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

  if (assigned(oCadastroCorConsultaController)) then
  begin
    oCadastroCorConsultaController.Fechar;
    FreeAndNil(oCadastroCorConsultaController);
  end;
  if (assigned(oCadastroCorRegra)) then
    FreeAndNil(oCadastroCorRegra);

  if (assigned(oCadastroCorController)) then
    oCadastroCorController := nil;

  inherited;
end;

procedure TCadastroCorController.Fechar;
begin
  inherited;
  if assigned(oFormulario) then
  begin
    oFormulario.Close;
    FreeAndNil(oFormulario);
  end;
end;



procedure TCadastroCorController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroCorController.NovoID;
begin
 if(oCadastroCorRegra.Novo(oCadastroCorDto))then
  (oFormulario as TCadastroCorForm).edtCodigo.Text := IntToStr(oCadastroCorDto.IdCor);
end;

procedure TCadastroCorController.Pesquisar;
begin
  inherited;
    if (not(assigned(oCadastroCorConsultaController))) then
    FreeAndNil(oCadastroCorConsultaController);
end;

procedure TCadastroCorController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroCorForm) do
    begin
      oCadastroCorDto.IdCor        :=  StrToInt(edtCodigo.Text);
      oCadastroCorDto.Descricao          :=  edtCor.Text;
    end;
    if(oCadastroCorRegra.Salvar(oCadastroCorDto))then
      ShowMessage('Registro: '+ oCadastroCorDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroCorDto.Descricao +' Inserido com sucesso');
    end;
end;




end.
