unit uControllerPrincipal;

interface
uses
  uModelo, System.SysUtils;
type
  TControllerPrincipal = class
   private
  public
    procedure intanciarViewCadastroModelo;
    destructor Destroy;
  end;

implementation



  destructor TControllerPrincipal.Destroy;
  begin
    if(assigned(frmCadastroModelo))then
      FreeAndNil(frmCadastroModelo);
  end;

  procedure TControllerPrincipal.intanciarViewCadastroModelo;
  begin
    if(not(assigned(frmCadastroModelo))) then
      frmCadastroModelo := TfrmCadastroModelo.Create(nil);
    frmCadastroModelo.Show;
  end;

end.
