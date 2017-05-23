unit uCadastroModeloController;

interface

uses
  Dialogs,
  System.classes, System.SysUtils,
  uCadastroModeloDto, uClassInterface,
  uCadastroModeloRegra, uCadastroModeloModel,
  uCadastroModeloForm;

type
  TCadastroModeloController = class(TClassInterface)
  private
  public
    procedure CriarForm(Aowner: TComponent);
    procedure Fechar;
    procedure Novo; override;

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
end;

procedure TCadastroModeloController.Fechar;
begin
  if not(assigned(oFormulario)) then
    exit;
  oFormulario.Close;
  FreeAndNil(oFormulario);
end;

procedure TCadastroModeloController.Novo;
begin
  inherited;
  Showmessage('selectbanco');
end;

initialization

finalization
  if (not(assigned(oCadastroModeloController))) then
    FreeAndNil(oCadastroModeloController);

end.
