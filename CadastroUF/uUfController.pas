unit uUfController;

interface

uses
  System.SysUtils, System.classes, FireDAC.Comp.Client, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uUfModel, uConexaoSingleTon, uUfDTO, uUfRegra,
  uFrmCadastroUF;

type
  TUfController = class
  private
    oUfDto: TUfDTO;
    oUfModel: TUfModel;
    oUfRegra: TUfRegra;
    oUfForm: TfrmUF;

    procedure CriarForm(aOwner: TComponent);
  public

    constructor Create;
    destructor Destroy; override;

  end;

var
  oUfController: TUfController;

implementation

{ TUfController }

constructor TUfController.Create;
begin
  oUfDto := TUfDTO.Create;
  oUfModel := TUfModel.Create;
  oUfRegra := TUfRegra.Create;

end;

procedure TUfController.CriarForm(aOwner: TComponent);
begin
  if (not(Assigned(oUfForm))) then
    oUfForm := TfrmUF.Create(aOwner);
end;

destructor TUfController.Destroy;
begin
  if (Assigned(oUfDto)) then
    FreeAndNil(oUfDto);

  if (Assigned(oUfModel)) then
    FreeAndNil(oUfModel);

  if (Assigned(oUfRegra)) then
    FreeAndNil(oUfRegra);

  inherited;

end;

end.
