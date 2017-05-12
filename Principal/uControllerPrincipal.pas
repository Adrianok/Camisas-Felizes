unit uControllerPrincipal;

interface

uses
  System.Classes,
  uModelo, System.SysUtils;

type
  TControllerPrincipal = class
   private
  public
    procedure intanciarViewCadastroModelo(AOwner: TComponent);
    destructor Destroy; override;
  end;

implementation



  destructor TControllerPrincipal.Destroy;
  begin
    if(assigned(frmCadastroModelo))then
      FreeAndNil(frmCadastroModelo);

    inherited;
  end;

  procedure TControllerPrincipal.intanciarViewCadastroModelo(AOwner: TComponent);
  begin
    if(not(assigned(frmCadastroModelo))) then
      frmCadastroModelo := TfrmCadastroModelo.Create(AOwner);

    frmCadastroModelo.Show;
  end;

end.
