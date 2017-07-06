unit uCadastroUfModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroUfDto,
  uInterfaceCadastroUfModel;

type
  TCadastroUfModel = class(TinterfacedObject, IInterfaceCadastroUfModel)
  private
    // function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function SelectUf(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function SelectDescricao(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function Inserir(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function Atualizar(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function Deletar(var oCadastroUfDto: TCadastroUfDto): Boolean;
    function NovoId(var oCadastroUfDto: TCadastroUfDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroUfModel.Atualizar(var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE Uf SET descricao =' + QuotedStr(oCadastroUfDto.nome) +
                           ', sigla = ' + QuotedStr(oCadastroUfDto.uf) +
                           ' WHERE iduf = ' + IntToStr(oCadastroUfDto.id));
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

constructor TCadastroUfModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroUfModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroUfModel.Deletar(var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
   try
    Query.SQL.Clear;
    Query.SQL.Add(' DELETE FROM Uf WHERE iduf = '+ IntToStr(oCadastroUfDto.Id));
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


function TCadastroUfModel.Inserir(var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add('INSERT INTO Uf (iduf, sigla, descricao) VALUES ('
                  + IntToStr(oCadastroUfDto.Id) + ','
                  + QuotedStr(oCadastroUfDto.uf) + ','
                  + QuotedStr(oCadastroUfDto.nome) + ')');

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

function TCadastroUfModel.NovoId(var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idUf) AS id FROM Uf');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroUfDto.Id := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroUfModel.SelectUf(var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT iduf, sigla, descricao FROM Uf WHERE iduf =' + IntToStr(oCadastroUfDto.id));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroUfDto.uf   := Query.FieldByName('descricao').AsString;
      oCadastroUfDto.nome := Query.FieldByName('sigla').AsString;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroUfModel.SelectDescricao(var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT iduf, sigla, descricao  FROM Uf WHERE sigla =''' + QuotedStr(oCadastroUfDto.uf) + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroUfDto.Id := Query.FieldByName('idUf').AsInteger;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;
function TCadastroUfModel.SelectPorId(
  var oCadastroUfDto: TCadastroUfDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT iduf, sigla, descricao FROM Uf WHERE idUf =' + IntToStr(oCadastroUfDto.Id));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroUfDto.uf := Query.FieldByName('sigla').AsString;
      oCadastroUfDto.nome := Query.FieldByName('descricao').AsString;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
