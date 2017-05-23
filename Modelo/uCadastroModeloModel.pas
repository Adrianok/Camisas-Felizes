unit uCadastroModeloModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  System.Classes, uConexaoSingleTon;

type
  TCadastroModeloModel = class(TFDQuery)
  private

  public
    function Novo: Integer;
    constructor Create(AOwner: TComponent); override;
  end;

var
  oCadastroModeloModel: TCadastroModeloModel;

implementation

{ TCadastroModeloModel }

constructor TCadastroModeloModel.Create(AOwner: TComponent);
begin
  inherited;
  Connection := TConexaoSigleton.GetInstancia;
end;

function TCadastroModeloModel.Novo: Integer;
var
  Retorno: Integer;
begin
  try
    SQL.Clear;
    Open('select max(idmodelo) as id from modelo');
    if (not(oCadastroModeloModel.IsEmpty)) then
    begin
      Result := (oCadastroModeloModel.FieldByName('id').AsInteger) + 1;
    end
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;

end;

end.
