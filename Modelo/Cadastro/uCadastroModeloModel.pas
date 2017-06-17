unit uCadastroModeloModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroModeloDto,
  uInterfaceCadastroModeloModel;

type
  TCadastroModeloModel = class(TinterfacedObject, IInterfaceCadastroModeloModel)
  private
    // function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectDescricao(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function NovoId(var oCadastroModeloDto: TCadastroModeloDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oCadastroModeloModel: TCadastroModeloModel;

implementation

{ TCadastroModeloModel }

function TCadastroModeloModel.Atualizar(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' UPDATE Modelo SET descricao = '''
    + oCadastroModeloDto.Descricao + ''', preco = '
    +CurrToStr(oCadastroModeloDto.Preco)+
    ' WHERE idModelo= '
    + IntToStr(oCadastroModeloDto.IdModelo) + ';');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

constructor TCadastroModeloModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroModeloModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroModeloModel.Deletar(
  var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin

end;






function TCadastroModeloModel.Inserir(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO Modelo (idModelo, descricao, preco) VALUES ('
    + IntToStr(oCadastroModeloDto.IdModelo) + ', '''
    + oCadastroModeloDto.Descricao          + ''','
    + CurrToStr(oCadastroModeloDto.Preco) + ');');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroModeloModel.NovoId(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idModelo) AS id FROM Modelo');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroModeloDto.IdModelo := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroModeloModel.SelectModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Modelo WHERE idModelo =' + IntToStr(oCadastroModeloDto.IdModelo));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroModeloModel.SelectDescricao(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Modelo WHERE descricao =''' + oCadastroModeloDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroModeloDto.IdModelo := Query.FieldByName('idModelo').AsInteger;
      oCadastroModeloDto.Preco := Query.FieldByName('preco').AsCurrency;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;
function TCadastroModeloModel.SelectPorId(
  var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Modelo WHERE idModelo =' + IntToStr(oCadastroModeloDto.IdModelo));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroModeloDto.Preco := Query.FieldByName('preco').AsCurrency;
      oCadastroModeloDto.Descricao := Query.FieldByName('descricao').AsString;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
