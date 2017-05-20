unit uUf_Controller;

interface

uses
  System.SysUtils, System.classes, FireDAC.Comp.Client, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uUf_Model, uConexaoSingleTon, uUf_DTO, uUf_Regra,
  uUf_Form;

type
  TUf_Controller = class
  private
    oUf_DTO: TUf_DTO;
    oUf_Model: TUf_Model;
    oUf_Regra: TUf_Regra;
    oUf_Form: TUf_Form;

  public
    procedure CriarForm(aOwner: TComponent);

    constructor Create;
    destructor Destroy; override;

  end;

var
  oUf_Controller: TUf_Controller;

implementation

{ TUfController }

constructor TUf_Controller.Create;
begin
  oUf_DTO := TUf_DTO.Create;
  oUf_Model := TUf_Model.Create;
  oUf_Regra := TUf_Regra.Create;

end;

procedure TUf_Controller.CriarForm(aOwner: TComponent);
begin
  if (not(Assigned(oUf_Form))) then
    oUf_Form := TUf_Form.Create(aOwner);
end;

destructor TUf_Controller.Destroy;
begin
  if (Assigned(oUf_DTO)) then
    FreeAndNil(oUf_DTO);

  if (Assigned(oUf_Model)) then
    FreeAndNil(oUf_Model);

  if (Assigned(oUf_Regra)) then
    FreeAndNil(oUf_Regra);

  inherited;

end;

end.
