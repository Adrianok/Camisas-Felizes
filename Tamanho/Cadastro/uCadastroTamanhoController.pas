unit uCadastroTamanhoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroTamanhoDto, uClasseInterfaceViewBase,
  uCadastroTamanhoRegra, uCadastroTamanhoModel,
  uCadastroTamanhoForm, uInterfaceViewBase,
  uConsultaTamanhoForm, uConsultaTamanhoController;

type
  TCadastroTamanhoController = class(TClassInterfaceViewBase)
  private
    procedure RetornoTamanho(aIdTamanho : integer);
  public
    procedure Excluir; override;
    procedure Inicial; override;
    procedure Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);  override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroTamanhoController: IInterfaceViewBase;

implementation


{ TControllerCadastroTamanho }


constructor TCadastroTamanhoController.Create;
begin
  if (not(assigned(oCadastroTamanhoModel))) then
    oCadastroTamanhoModel := TCadastroTamanhoModel.Create;

  if (not(assigned(oCadastroTamanhoDto))) then
    oCadastroTamanhoDto := TCadastroTamanhoDto.Create;

  if (not(assigned(oCadastroTamanhoRegra))) then
    oCadastroTamanhoRegra := TCadastroTamanhoRegra.Create;
end;

procedure TCadastroTamanhoController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroTamanhoForm.Create(Aowner);
  oFormulario.oController := oCadastroTamanhoController;
  oFormulario.Show;
  inherited;
end;

destructor TCadastroTamanhoController.Destroy;
begin
  if (assigned(oCadastroTamanhoModel)) then
    FreeAndNil(oCadastroTamanhoModel);

  if (assigned(oCadastroTamanhoDto)) then
    FreeAndNil(oCadastroTamanhoDto);

  if (assigned(oCadastroTamanhoRegra)) then
    FreeAndNil(oCadastroTamanhoRegra);

    inherited;
end;



procedure TCadastroTamanhoController.Excluir;
begin
  inherited;
  oCadastroTamanhoRegra.Deletar(oCadastroTamanhoModel, oCadastroTamanhoDto.IdTamanho);
end;

procedure TCadastroTamanhoController.Inicial;
begin
  inherited;

end;

procedure TCadastroTamanhoController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroTamanhoController.NovoID;
begin
 if(oCadastroTamanhoRegra.Novo(oCadastroTamanhoModel, oCadastroTamanhoDto))then
  (oFormulario as TCadastroTamanhoForm).edtCodigo.Text := IntToStr(oCadastroTamanhoDto.IdTamanho);
end;

procedure TCadastroTamanhoController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
 sIdTamanho : string;
begin
  inherited;
  sIdTamanho   :=  (oFormulario as TCadastroTamanhoForm).edtCodigo.Text;

  if(sIdTamanho <> '')then
    oCadastroTamanhoDto.IdTamanho        :=  StrToInt(sIdTamanho);
  oCadastroTamanhoDto.Descricao    :=(oFormulario as TCadastroTamanhoForm).edtTamanho.Text;

  if (not(assigned(oConsultaTamanhoController))) then
    oConsultaTamanhoController := TConsultaTamanhoController.Create;
  oConsultaTamanhoController.CriarForm(Aowner, RetornoTamanho, oCadastroTamanhoDto.Descricao);
end;

procedure TCadastroTamanhoController.RetornoTamanho(aIdTamanho: integer);
begin
  if(aIdTamanho <> 0)then
  begin
    oCadastroTamanhoDto.IdTamanho := aIdTamanho;
    if(oCadastroTamanhoRegra.SelectTamanho(oCadastroTamanhoModel, oCadastroTamanhoDto))then
    with (oFormulario as TCadastroTamanhoForm) do
    begin
      edtCodigo.Text :=   IntToStr(oCadastroTamanhoDto.IdTamanho);
      edtTamanho.Text    :=  oCadastroTamanhoDto.Descricao;
    end;
  end
  else
  begin
    Inicial;
    raise Exception.Create('Não foi escolhido registro');
  end;

end;

procedure TCadastroTamanhoController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroTamanhoForm) do
    begin
      oCadastroTamanhoDto.IdTamanho        :=  StrToInt(edtCodigo.Text);
      oCadastroTamanhoDto.Descricao        :=  edtTamanho.Text;
    end;
    if(oCadastroTamanhoRegra.Salvar(oCadastroTamanhoModel, oCadastroTamanhoDto))then
      ShowMessage('Registro: '+ oCadastroTamanhoDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroTamanhoDto.Descricao +' Inserido com sucesso');
    end;
end;

end.
