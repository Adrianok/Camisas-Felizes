unit uCadastroTamanhoModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroTamanhoDto,
  uInterfaceCadastroTamanhoModel;

type
  TCadastroTamanhoModel = class(TinterfacedObject, IInterfaceCadastroTamanhoModel)
  private
    // function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function SelectTamanho(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function SelectDescricao(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Inserir(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Atualizar(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function Deletar(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
    function NovoId(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oCadastroTamanhoModel: TCadastroTamanhoModel;

implementation

{ TCadastroModeloModel }

function TCadastroTamanhoModel.Atualizar(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' UPDATE Tamanho SET descricao ='''
    + oCadastroTamanhoDto.Descricao + ''' WHERE idTamanho= '
    + IntToStr(oCadastroTamanhoDto.IdTamanho) + ';');
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

constructor TCadastroTamanhoModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroTamanhoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroTamanhoModel.Deletar(
  var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin

end;






function TCadastroTamanhoModel.Inserir(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO Tamanho (idTamanho, descricao) VALUES ('
    + IntToStr(oCadastroTamanhoDto.IdTamanho) + ', '''
    + oCadastroTamanhoDto.Descricao + ''');');
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

function TCadastroTamanhoModel.NovoId(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idTamanho) AS id FROM Tamanho');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroTamanhoDto.IdTamanho := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroTamanhoModel.SelectTamanho(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Tamanho WHERE idTamanho =' + IntToStr(oCadastroTamanhoDto.IdTamanho));
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

function TCadastroTamanhoModel.SelectDescricao(var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Tamanho WHERE descricao =''' + oCadastroTamanhoDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroTamanhoDto.IdTamanho := Query.FieldByName('idTamanho').AsInteger;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;
function TCadastroTamanhoModel.SelectPorId(
  var oCadastroTamanhoDto: TCadastroTamanhoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Tamanho WHERE idTamanho =' + IntToStr(oCadastroTamanhoDto.IdTamanho));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroTamanhoDto.Descricao := Query.FieldByName('descricao').AsString;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
