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
    Query: TFDQuery;
  public
    function SelectPorDescricao(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function SelectPorId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function SelectMunicipio(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Inserir(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Atualizar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
    function Deletar(const IdMunicipio : integer): Boolean;
    function NovoId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroMunicipioModel.Atualizar(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE Municipio SET descricao ='''
//    + oCadastroMunicipioDto.Descricao + ''' WHERE idMunicipio= '
//    + IntToStr(oCadastroMunicipioDto.IdMunicipio) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
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

function TCadastroMunicipioModel.Deletar(const IdMunicipio : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM Municipio WHERE idMunicipio = ' + IntToStr(IdMunicipio);
    Query.SQL.Add(sSql);
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroMunicipioModel.Inserir(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' INSERT INTO Municipio (idMunicipio, descricao) VALUES ('
//    + IntToStr(oCadastroMunicipioDto.IdMunicipio) + ', '''
//    + oCadastroMunicipioDto.Descricao + ''');');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

function TCadastroMunicipioModel.NovoId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idMunicipio) AS id FROM Municipio');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroMunicipioDto.IdMunicipio := (Query.FieldByName('id').AsInteger) + 1;
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
    Query.Open('SELECT * FROM Municipio WHERE idMunicipio =' + IntToStr(oCadastroMunicipioDto.IdMunicipio));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroMunicipioModel.SelectPorDescricao(
  var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM municipio WHERE descricao =''' + oCadastroMunicipioDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroMunicipioDto.IdMunicipio := Query.FieldByName('idmunicipio').AsInteger;
      oCadastroMunicipioDto.iduf := Query.FieldByName('uf_iduf').AsInteger;
        Result := True;
    end
    else
      Result := True;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroMunicipioModel.SelectPorId(var oCadastroMunicipioDto: TCadastroMunicipioDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM municipio WHERE idMunicipio =' + IntToStr(oCadastroMunicipioDto.IdMunicipio));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroMunicipioDto.Descricao   := Query.FieldByName('descricao').AsString;
      oCadastroMunicipioDto.iduf := Query.FieldByName('uf_iduf').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
