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


implementation

{ TCadastroModeloModel }

function TCadastroMunicipioModel.Atualizar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE Municipio SET descricao =' + QuotedStr(oCadastroMunicipioDto.Municipio) +
                  'AND uf_iduf =' + IntToStr(oCadastroMunicipioDto.estado) +
                  ' WHERE idmunicipio = '   + IntToStr(oCadastroMunicipioDto.id)) ;
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
    Query.SQL.Add(' DELETE FROM Municipio WHERE idMunicipio = '+ IntToStr(oCadastroMunicipioDto.Id));
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
    Query.SQL.Add('INSERT INTO Municipio (idMunicipio, descricao, uf_iduf) VALUES ('
                  + IntToStr(oCadastroMunicipioDto.Id) + ','
                  + QuotedStr(oCadastroMunicipioDto.Municipio) + ','
                  + IntToStr(oCadastroMunicipioDto.Estado) + ')');

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
    Query.Open('SELECT idMunicipio, descricao, uf_iduf FROM Municipio WHERE descricao =' + QuotedStr(oCadastroMunicipioDto.Municipio));
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
    Query.Open('SELECT idMunicipio, descricao, uf_iduf FROM Municipio WHERE descricao =' + QuotedStr(oCadastroMunicipioDto.Municipio));
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
    Query.Open('SELECT idMunicipio, descricao, uf_iduf FROM Municipio WHERE idMunicipio =' + IntToStr(oCadastroMunicipioDto.Id));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroMunicipioDto.Municipio := Query.FieldByName('descricao').AsString;
      oCadastroMunicipioDto.Estado := Query.FieldByName('uf_iduf').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
