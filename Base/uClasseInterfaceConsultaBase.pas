unit uClasseInterfaceConsultaBase;

interface

uses
  uInterfaceConsultaBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls,
  System.Classes, uConsultaBase;

type
  TClassInterfaceConsultaBase = class(TInterfacedObject, IInterfaceConsultaBase)
  private
  protected
    oFormulario : TfrmPesquisaBase;
  public
    procedure CriarForm(Aowner: TComponent); virtual;
    procedure Pesquisar; virtual;
    procedure Cancelar;  virtual;
    procedure Confirmar; virtual;
    procedure Fechar;    virtual;

  end;

implementation

{ TClassInterfaceConsultaBase }

procedure TClassInterfaceConsultaBase.Cancelar;
begin

end;

procedure TClassInterfaceConsultaBase.Confirmar;
begin

end;

procedure TClassInterfaceConsultaBase.CriarForm(Aowner: TComponent);
begin

end;

procedure TClassInterfaceConsultaBase.Fechar;
begin
  inherited;
    Showmessage('a');
end;

procedure TClassInterfaceConsultaBase.Pesquisar;
begin

end;

end.
