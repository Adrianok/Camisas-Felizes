unit uCadastroModeloController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroModeloDto, uClasseInterfaceViewBase,
  uCadastroModeloRegra, uCadastroModeloModel,
  uCadastroModeloForm;

type
  TCadastroModeloController = class(TClassInterfaceViewBase)
  private
  public
    procedure CriarForm(Aowner: TComponent);
    procedure Novo; override;
    procedure Fechar; override;
    procedure Alterar; override;
    procedure Salvar; override;
    procedure VerificarModelo(Sender : TObject);
    procedure VerificarCor(Sender : TObject);
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroModeloController: TCadastroModeloController;

implementation

{ TControllerCadastroModelo }

procedure TCadastroModeloController.Alterar;
begin

  inherited;
end;

constructor TCadastroModeloController.Create;
begin
  if (not(assigned(oCadastroModeloModel))) then
    oCadastroModeloModel := TCadastroModeloModel.Create;

  if (not(assigned(oCadastroModeloDto))) then
    oCadastroModeloDto := TCadastroModeloDto.Create;

  if (not(assigned(oCadastroModeloRegra))) then
    oCadastroModeloRegra := TCadastroModeloRegra.Create;


end;

procedure TCadastroModeloController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroModeloForm.Create(Aowner);
  oFormulario.oController := oCadastroModeloController;
  oFormulario.Show;
  (oFormulario as TCadastroModeloForm).edtModelo.OnExit := VerificarModelo;
   //temporario
  (oFormulario as TCadastroModeloForm).edtCor.OnExit := VerificarCor;
  (oFormulario as TCadastroModeloForm).edtCor.OnExit := VerificarCor;
end;

destructor TCadastroModeloController.Destroy;
begin
  if (assigned(oCadastroModeloModel)) then
    FreeAndNil(oCadastroModeloModel);

  if (assigned(oCadastroModeloDto)) then
    FreeAndNil(oCadastroModeloDto);

  if (assigned(oCadastroModeloRegra)) then
    FreeAndNil(oCadastroModeloRegra);

  inherited;

  if (assigned(oCadastroModeloController)) then
    oCadastroModeloController := nil;
end;

procedure TCadastroModeloController.Fechar;
begin
  inherited;
  if assigned(oFormulario) then
  begin
    oFormulario.Close;
    FreeAndNil(oFormulario);
  end;
end;

procedure TCadastroModeloController.Novo;
begin
  inherited;
  NovoID;

end;

procedure TCadastroModeloController.NovoID;
begin
 if(oCadastroModeloRegra.Novo(oCadastroModeloDto))then
  (oFormulario as TCadastroModeloForm).edtCodigo.Text := IntToStr(oCadastroModeloDto.IdModelo);
end;

procedure TCadastroModeloController.Salvar;
begin
  if(not(ValidarVazio))then
    begin
      exit;
    end;

    with (oFormulario as TCadastroModeloForm) do
    begin
      oCadastroModeloDto.IdModelo        :=  StrToInt(edtCodigo.Text);
      oCadastroModeloDto.Preco           :=  StrToCurr(edtPreco.Text);
      oCadastroModeloDto.Modelo          :=  edtModelo.Text;
      oCadastroModeloDto.Cor.Descricao   :=  edtCor.Text;
    end;
    if(oCadastroModeloRegra.Salvar(oCadastroModeloDto))then
      ShowMessage('Registro: '+ oCadastroModeloDto.Modelo +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroModeloDto.Modelo +' Inserido com sucesso');
    end;

    inherited;
end;

procedure TCadastroModeloController.VerificarCor(Sender: TObject);
begin
  if((oFormulario as TCadastroModeloForm).edtCor.Text = EmptyStr)then
    exit;
  oCadastroModeloDto.cor.Descricao :=  (oFormulario as TCadastroModeloForm).edtCor.text;
    if((oCadastroModeloRegra.SelectCor(oCadastroModeloDto))=false)then
      raise exception.Create('Esta cor não possui cadastro');
end;

procedure TCadastroModeloController.VerificarModelo(Sender: TObject);
begin
  if((oFormulario as TCadastroModeloForm).edtModelo.Text = EmptyStr)then
    exit;
  oCadastroModeloDto.Modelo :=  (oFormulario as TCadastroModeloForm).edtModelo.text;

  if(oCadastroModeloRegra.SelectDescricao(oCadastroModeloDto))then
    with (oFormulario as TCadastroModeloForm) do
    begin
      if(oCadastroModeloDto.Preco <> 0)then
        edtPreco.Text :=  CurrToStr(oCadastroModeloDto.Preco);

      edtCodigo.Text  :=  IntToStr(oCadastroModeloDto.IdModelo);
      edtCor.Text     :=  oCadastroModeloDto.Cor.Descricao;
    end;

end;


end.
