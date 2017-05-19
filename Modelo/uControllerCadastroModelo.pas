unit uControllerCadastroModelo;

interface
uses
  System.classes, System.SysUtils, uModelo;
type
  TControllerCadastroModelo = class
  private
    procedure FecharForm(Sender : TObject);
  public
    procedure InstanciarForm(Aowner : TComponent);
    constructor Create(Aowner : TComponent);
  end;

var
  oControllerModelo : TControllerCadastroModelo;

implementation

{ TControllerCadastroModelo }


constructor TControllerCadastroModelo.Create(Aowner : TComponent);
begin

  InstanciarForm(Aowner);

end;

procedure TControllerCadastroModelo.FecharForm(Sender: TObject);
begin
  if(not(assigned(frmCadastroModelo)))then
    exit;

  frmCadastroModelo.Close;
  FreeAndNil(frmCadastroModelo);
end;

procedure TControllerCadastroModelo.InstanciarForm(Aowner: TComponent);
begin
  if not(assigned(frmCadastroModelo)) then
    frmCadastroModelo := TfrmCadastroModelo.Create(Aowner);

  frmCadastroModelo.btnFechar.OnClick := FecharForm;
  frmCadastroModelo.Show;
end;

initialization

finalization
  if (not(assigned(oControllerModelo))) then
    FreeAndNil(oControllerModelo);
end.
