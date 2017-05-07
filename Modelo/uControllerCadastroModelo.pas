unit uControllerCadastroModelo;

interface
uses
  uCadastroModelo, System.SysUtils,  System.Classes;
type
  TControllerCadastroModelo = class
  private
    vCadastroModelo : TfrmCadastroModelo;
  public
    procedure intanciarView;
    destructor Destroy;
  end;

implementation

{ TControllerCadastroModelo }


  destructor TControllerCadastroModelo.Destroy;
  begin
    if(assigned(vCadastroModelo))then
      FreeAndNil(vCadastroModelo);

  end;

  procedure TControllerCadastroModelo.intanciarView;
  begin
    if(not(assigned(vCadastroModelo))) then
      vCadastroModelo := TfrmCadastroModelo.Create(nil);
    vCadastroModelo.Show;
  end;

end.
