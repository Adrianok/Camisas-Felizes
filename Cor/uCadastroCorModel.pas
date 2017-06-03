unit uCadastroCorModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroCorDto,
  uInterfaceCadastroCorModel;

type
  TCadastroCorModel = class(TinterfacedObject, IInterfaceCadastroCorModel)
  private
    // function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
    Query: TFDQuery;
  public
    // function SelectPorCor(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Inserir(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Atualizar(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Deletar(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function NovoId(var oCadastroCorDto: TCadastroCorDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oCadastroCorModel: TCadastroCorModel;

implementation

{ TCadastroModeloModel }

function TCadastroCorModel.Atualizar(var oCadastroCorDto: TCadastroCorDto): Boolean;
var
   Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.SQL.Add(' UPDATE cor SET idcor='
    + IntToStr(oCadastroCorDto.IdCor) + ', descricao = '''
    + oCadastroCorDto.Descricao + ''');');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
    FreeAndNil(Query);
  end;

end;

constructor TCadastroCorModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;



function TCadastroCorModel.Deletar(
  var oCadastroCorDto: TCadastroCorDto): Boolean;
begin

end;

destructor TCadastroCorModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;




function TCadastroCorModel.Inserir(var oCadastroCorDto: TCadastroCorDto): Boolean;
var
   Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO cor (idcor, descricao) VALUES ('
    + IntToStr(oCadastroCorDto.IdCor) + ', '''
    + oCadastroCorDto.Descricao + ''');');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
    FreeAndNil(Query);
  end;

end;

function TCadastroCorModel.NovoId(var oCadastroCorDto: TCadastroCorDto): Boolean;
var
   Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idcor) AS id FROM cor');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroCorDto.IdCor := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
    FreeAndNil(Query);
  end;

end;

function TCadastroCorModel.SelectCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
var
   Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor WHERE idcor =' + IntToStr(oCadastroCorDto.IdCor));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
    FreeAndNil(Query);
  end;

end;

end.
