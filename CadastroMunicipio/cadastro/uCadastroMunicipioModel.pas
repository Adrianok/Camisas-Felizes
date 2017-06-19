unit uCadastroMunicipioModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroMunicipioDto,
  uInterfaceCadastroMunicipioModel;

type
  TCadastroMunicipioModel = class(TinterfacedObject, IInterfaceCadastroMunicipioModel)
  private
    // function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function SelectMunicipio(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function SelectDescricao(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Inserir(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Atualizar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Deletar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function NovoId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oCadastroMunicipioModel: TCadastroMunicipioModel;

implementation

{ TCadastroModeloModel }

function TCadastroMunicipioModel.Atualizar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE Municipio SET ' +
                  'descricao =' + QuotedStr(oCadastroMunicipioDto.municipio) +
                  ', uf_iduf =' + IntToStr(oCadastroMunicipioDto.estadoid) +
                  ' WHERE idmunicipio = ' + IntToStr(oCadastroMunicipioDto.id));
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

constructor TCadastroMunicipioModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroMunicipioModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroMunicipioModel.Deletar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
   try
    Query.SQL.Clear;
    Query.SQL.Add(' DELETE FROM Municipio WHERE iduf = '+ IntToStr(oCadastroMunicipioDto.Id));
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


function TCadastroMunicipioModel.Inserir(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add('INSERT INTO Municipio (idmunicipio, descricao, id_iduf) VALUES ('
                  + IntToStr(oCadastroMunicipioDto.Id) + ','
                  + QuotedStr(oCadastroMunicipioDto.municipio) + ','
                  + IntToStr(oCadastroMunicipioDto.estadoid) + ')');

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

function TCadastroMunicipioModel.NovoId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idMunicipio) AS id FROM Municipio');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroMunicipioDto.Id := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroMunicipioModel.SelectMunicipio(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idmunicipio, descricao, uf_iduf FROM municipio WHERE sigla =' + QuotedStr(oCadastroMunicipioDto.municipio));
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

function TCadastroMunicipioModel.SelectDescricao(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idmunicipio, descricao, uf_iduf  FROM municipio WHERE descricao =''' + QuotedStr(oCadastroMunicipioDto.municipio) + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroMunicipioDto.Id := Query.FieldByName('idMunicipio').AsInteger;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;
function TCadastroMunicipioModel.SelectPorId(
  var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT iduf, sigla, descricao FROM Municipio WHERE idMunicipio =' + IntToStr(oCadastroMunicipioDto.Id));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroMunicipioDto.estado := Query.FieldByName('iduf').AsString;
      oCadastroMunicipioDto.municipio := Query.FieldByName('descricao').AsString;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
