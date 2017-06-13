unit uClasseInterfaceConsultaBase;

interface

uses
  uInterfaceConsultaBase, dialogs,
  uBase, System.SysUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.Controls,
  System.Classes, uConsultaBase,
  FireDAC.Comp.Client, Vcl.DbGrids;

type
  TClassInterfaceConsultaBase = class(TInterfacedObject, IInterfaceConsultaBase)
  private
  protected
    oFormulario: TfrmPesquisaBase;
  public
    procedure PesquisarGrid; virtual;
    procedure AlimentarDto(Column: TColumn); virtual;
    function PreencherGrid : boolean; virtual;
    procedure CriarForm(Aowner: TComponent); virtual;
    procedure Pesquisar; virtual;
    procedure Cancelar; virtual;
    procedure Confirmar; virtual;
    procedure Fechar; virtual;
  end;

implementation

{ TClassInterfaceConsultaBase }

procedure TClassInterfaceConsultaBase.AlimentarDto(Column: TColumn);
begin

end;

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

end;

procedure TClassInterfaceConsultaBase.Pesquisar;
begin

end;

procedure TClassInterfaceConsultaBase.PesquisarGrid;
begin

end;

function TClassInterfaceConsultaBase.PreencherGrid: boolean;
begin

end;

end.
