unit uCadastroCorController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroCorDto, uClasseInterfaceViewBase,
  uCadastroCorRegra, uCadastroCorModel,
  uCadastroCorForm, uInterfaceViewBase;

type
  TCadastroCorController = class(TClassInterfaceViewBase)
  private
  public
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Fechar; override;
    procedure Salvar; override;
    procedure Alterar; override;
    procedure NovoID;
    procedure VerificarCor(Sender: TObject);

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

  if not(assigned(oFormulario)) then
    oFormulario := TCadastroCorForm.Create(Aowner);
  oFormulario.oController := oCadastroCorController;
  oFormulario.Show;

  (oFormulario as TCadastroCorForm).edtCor.OnExit := VerificarCor;
end;

destructor TCadastroCorController.Destroy;
begin
  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

  if (assigned(oCadastroCorRegra)) then
    FreeAndNil(oCadastroCorRegra);

  inherited;

  if (assigned(oCadastroCorController)) then
    oCadastroCorController := nil;
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
  NovoID;
  inherited;
end;

procedure TCadastroCorController.NovoID;
begin
 if(oCadastroCorRegra.Novo(oCadastroCorDto))then
  (oFormulario as TCadastroCorForm).edtCodigo.Text := IntToStr(oCadastroCorDto.IdCor);
end;

procedure TCadastroCorController.Salvar;
begin
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

    inherited;
end;

procedure TCadastroCorController.VerificarCor(Sender: TObject);
begin
  if((oFormulario as TCadastroCorForm).edtCor.Text = EmptyStr)then
    exit;
  oCadastroCorDto.Descricao :=  (oFormulario as TCadastroCorForm).edtCor.text;

  if(oCadastroCorRegra.SelectDescricao(oCadastroCorDto))then
    with (oFormulario as TCadastroCorForm) do
    begin
      edtCodigo.Text  :=  IntToStr(oCadastroCorDto.IdCor);
      edtCor.Text     :=  oCadastroCorDto.Descricao;
    end;

end;


end.
