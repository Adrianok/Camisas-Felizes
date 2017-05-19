unit uClasseGenerica;

interface

uses
  Vcl.Forms, System.Classes, System.SysUtils;

type
  TClasseGenerica = class
  private
  public
    class function ConstructorFrm(strClass: string; Aowner : TComponent): TForm;
  end;

implementation

{ TClasseGenerica }







{ TClasseGenerica }

class function TClasseGenerica.ConstructorFrm(strClass: string; Aowner : TComponent): TForm;
var
  oForm: TForm;
  frmClass: TFormClass;
begin
    frmClass := TFormClass(FindClass(strClass));
  begin
    try
      oForm := FrmClass.create(Aowner);
    finally
      oForm.Show;
      Result := oForm;
    end;
  end;
end;

end.
