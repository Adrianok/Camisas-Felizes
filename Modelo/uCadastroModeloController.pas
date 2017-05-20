unit uCadastroModeloController;

interface
uses
  System.classes, System.SysUtils, uCadastroModeloForm, uCadastroModeloDto;
type
  TCadastroModeloController = class
  private
    procedure FecharForm(Sender : TObject);
  public
    procedure InstanciarForm(Aowner : TComponent);
    constructor Create(Aowner : TComponent);
    destructor Destroy;
  end;

var
  oCadastroModeloController : TCadastroModeloController;

implementation

{ TControllerCadastroModelo }


constructor TCadastroModeloController.Create(Aowner : TComponent);
begin
  if(not(assigned(oCadastroModeloDto)))then
    oCadastroModeloDto := TCadastroModeloDto.Create;
end;

destructor TCadastroModeloController.Destroy;
begin
  if(assigned(oCadastroModeloDto))then
    FreeAndNil(oCadastroModeloDto);
end;

procedure TCadastroModeloController.FecharForm(Sender: TObject);
begin
  if(assigned(frmCadastroModelo))then
  begin
    frmCadastroModelo.Close;
    FreeAndNil(frmCadastroModelo);
  end;
end;

procedure TCadastroModeloController.InstanciarForm(Aowner: TComponent);
begin
  if not(assigned(frmCadastroModelo)) then
    frmCadastroModelo := TfrmCadastroModelo.Create(Aowner);

  frmCadastroModelo.btnFechar.OnClick := FecharForm;
  frmCadastroModelo.Show;
end;

initialization

finalization
  if (not(assigned(oCadastroModeloController))) then
    FreeAndNil(oCadastroModeloController);
end.
