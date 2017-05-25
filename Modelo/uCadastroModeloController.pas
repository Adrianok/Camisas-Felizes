unit uCadastroModeloController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroModeloDto, uClassInterface,
  uCadastroModeloRegra, uCadastroModeloModel,
  uCadastroModeloForm;

type
  TCadastroModeloController = class(TClassInterface)
  private
  public
    procedure CriarForm(Aowner: TComponent);
    procedure Novo; override;
    procedure Fechar; override;
    procedure Salvar; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroModeloController: TCadastroModeloController;

implementation

{ TControllerCadastroModelo }

constructor TCadastroModeloController.Create;
begin
  if (not(assigned(oCadastroModeloModel))) then
    oCadastroModeloModel := TCadastroModeloModel.Create(nil);

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
  (oFormulario as TCadastroModeloForm).edtCodigo.Text := inttostr(oCadastroModeloRegra.Novo);
   inherited;
end;

procedure TCadastroModeloController.Salvar;
begin
  if(not(ValidarVazio(oFormulario)))then
    begin
      exit;
    end;
    oCadastroModeloRegra.Salvar(oCadastroModeloDto);

    with (oFormulario as TCadastroModeloForm) do
    begin
      oCadastroModeloDto.IdModelo        :=  StrToInt(edtCodigo.Text);
      oCadastroModeloDto.Preco           :=  StrToCurr(edtPreco.Text);
      oCadastroModeloDto.Modelo          :=  edtModelo.Text;
      oCadastroModeloDto.Cor.Descricao   :=  edtModelo.Text;
    end;

end;

end.
