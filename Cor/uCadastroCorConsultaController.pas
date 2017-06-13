unit uCadastroCorConsultaController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.classes, System.SysUtils,
  uCadastroCorDto, uClasseInterfaceConsultaBase,
  uCadastroCorRegra, uCadastroCorModel,
  uInterfaceConsultaBase, uCadastroCorConsultaForm;

type
  TCadastroCorConsultaController = class(TClassInterfaceConsultaBase)
  private
  public
    procedure CriarForm(Aowner: TComponent); override;
    procedure Fechar; override;
    procedure Confirmar; override;
    procedure Cancelar; override;

    destructor Destroy; override;
  end;

var
  oCadastroCorConsultaController: IInterfaceConsultaBase;

implementation

{ TCadastroCorConsultaController }

procedure TCadastroCorConsultaController.Cancelar;
begin
  inherited;

end;

procedure TCadastroCorConsultaController.Confirmar;
begin
  inherited;

end;


procedure TCadastroCorConsultaController.CriarForm(Aowner: TComponent);
begin
   inherited;
   if not(assigned(oFormulario)) then
     oFormulario := TCadastroCorConsultaForm.Create(Aowner);
   oFormulario.oController:= oCadastroCorConsultaController;
   oFormulario.Show;
end;

destructor TCadastroCorConsultaController.Destroy;
begin

  inherited;
end;

procedure TCadastroCorConsultaController.Fechar;
begin
  inherited;
  Showmessage('a');
  if assigned(oFormulario) then
  begin
    oFormulario.Close;
    FreeAndNil(oFormulario);
  end;
end;

end.
