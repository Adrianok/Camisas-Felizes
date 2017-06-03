unit uCadastroTamanhoController;


interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroTamanhoDto, uClasseInterfaceViewBase,
  uCadastroTamanhoRegra, uCadastroTamanhoModel,
  uCadastroTamanhoForm;

type
  TCadastroTamanhoController = class(TClassInterfaceViewBase)
  private
    oCadastroTamanhoModel : TCadastroTamanhoModel;
    oCadastroTamanhoDto   : TCadastroTamanhoDto;
    oCadastroTamanhoRegra : TCadastroTamanhoRegra;
  public
    procedure CriarForm(Aowner: TComponent);
    procedure Novo; override;
    procedure Fechar; override;
    procedure Alterar; override;
    procedure Salvar; override;
    procedure VerificarTamanho(Sender : TObject);
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroTamanhoController: TCadastroTamanhoController;

implementation

{ TControllerCadastroTamanho }

procedure TCadastroTamanhoController.Alterar;
begin


  inherited;
end;

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

  (oFormulario as TCadastroTamanhoForm).edtTamanho.OnExit := VerificarTamanho;
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

  if (assigned(oCadastroTamanhoController)) then
    oCadastroTamanhoController := nil;
end;

procedure TCadastroTamanhoController.Fechar;
begin
  inherited;
  if assigned(oFormulario) then
  begin
    oFormulario.Close;
    FreeAndNil(oFormulario);
  end;
end;

procedure TCadastroTamanhoController.Novo;
begin
  inherited;
  NovoID;

end;

procedure TCadastroTamanhoController.NovoID;
begin
 if(oCadastroTamanhoRegra.Novo(oCadastroTamanhoDto))then
  (oFormulario as TCadastroTamanhoForm).edtCodigo.Text := IntToStr(oCadastroTamanhoDto.IdTamanho);
end;

procedure TCadastroTamanhoController.Salvar;
begin
    with (oFormulario as TCadastroTamanhoForm) do
    begin
      oCadastroTamanhoDto.IdTamanho        :=  StrToInt(edtCodigo.Text);
      oCadastroTamanhoDto.Descricao          :=  edtTamanho.Text;
    end;
    if(oCadastroTamanhoRegra.Salvar(oCadastroTamanhoDto))then
      ShowMessage('Registro: '+ oCadastroTamanhoDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroTamanhoDto.Descricao +' Inserido com sucesso');
    end;

    inherited;
end;

procedure TCadastroTamanhoController.VerificarTamanho(Sender: TObject);
begin
  if((oFormulario as TCadastroTamanhoForm).edtTamanho.Text = EmptyStr)then
    exit;
  oCadastroTamanhoDto.Descricao :=  (oFormulario as TCadastroTamanhoForm).edtTamanho.text;

  if(oCadastroTamanhoRegra.SelectDescricao(oCadastroTamanhoDto))then
    with (oFormulario as TCadastroTamanhoForm) do
    begin
      edtCodigo.Text  :=  IntToStr(oCadastroTamanhoDto.IdTamanho);
      edtTamanho.Text     :=  oCadastroTamanhoDto.Descricao;
    end;

end;


end.

