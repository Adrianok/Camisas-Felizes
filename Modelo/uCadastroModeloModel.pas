unit uCadastroModeloModel;

interface

uses
  System.Generics.Collections,FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI,System.Classes,
  uConexaoSingleTon, uCadastroModeloDto;

type
  TCadastroModeloModel = class(TFDQuery)
  private

  public

    function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string,TCadastroModeloDto>): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function NovoId: Integer;

    constructor Create(AOwner: TComponent); override;
  end;

var
  oCadastroModeloModel: TCadastroModeloModel;

implementation

{ TCadastroModeloModel }

function TCadastroModeloModel.Atualizar(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin

end;

constructor TCadastroModeloModel.Create(AOwner: TComponent);
begin
  inherited;
  Connection := TConexaoSigleton.GetInstancia;
end;

function TCadastroModeloModel.Deletar(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin

end;

function TCadastroModeloModel.Inserir(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin

end;

function TCadastroModeloModel.NovoId: Integer;
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

function TCadastroModeloModel.SelecionarTudo(
  var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
begin

end;

end.
