unit uCadastroUfController;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uCadastroUfModel, uConexaoSingleTon, uCadastroUfDTO;

type
  TUfController = class

  private
    oUfModel = TUfModel;

  public

    function Salvar(var aEstado = TUfDto): boolean;

    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TUfController }

constructor TUfController.Create;
begin
  oUfModel := TUfModel.Create;
end;

destructor TUfController.Destroy;
begin
  if (Assigned(oUfModel)) then
    FreeAndNil(oUfModel);

  inherited;
end;

function TUfController.Salvar(var aEstado): boolean;
begin
result := false;

end;

end.
