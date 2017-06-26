unit uCadastroBairroModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroBairroDto,
  uInterfaceCadastroBairroModel;

type
  TCadastroBairroModel = class(TinterfacedObject, IInterfaceCadastroBairroModel)
  private
    Query: TFDQuery;
  public
    function SelectPorDescricao(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
    function SelectPorId(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
    function SelectBairro(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
    function Inserir(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
    function Atualizar(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
    function Deletar(const IdBairro : integer): Boolean;
    function NovoId(var oCadastroBairroDto: TCadastroBairroDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroBairroModel.Atualizar(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE Bairro SET descricao ='''
//    + oCadastroBairroDto.Descricao + ''' WHERE idBairro= '
//    + IntToStr(oCadastroBairroDto.IdBairro) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

constructor TCadastroBairroModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroBairroModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroBairroModel.Deletar(const IdBairro : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM Bairro WHERE idBairro = ' + IntToStr(IdBairro);
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


function TCadastroBairroModel.Inserir(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' INSERT INTO Bairro (idBairro, descricao) VALUES ('
//    + IntToStr(oCadastroBairroDto.IdBairro) + ', '''
//    + oCadastroBairroDto.Descricao + ''');');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

function TCadastroBairroModel.NovoId(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idBairro) AS id FROM Bairro');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroBairroDto.IdBairro := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroBairroModel.SelectBairro(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Bairro WHERE idBairro =' + IntToStr(oCadastroBairroDto.IdBairro));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroBairroModel.SelectPorDescricao(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM bairro WHERE descricao =''' + oCadastroBairroDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroBairroDto.IdBairro := Query.FieldByName('idbairro').AsInteger;
      oCadastroBairroDto.cep := Query.FieldByName('cep').AsCurrency;
      oCadastroBairroDto.idmunicipio := Query.FieldByName('municipio_idmunicipio').AsInteger;
      Result := True;
    end
    else
      Result := True;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroBairroModel.SelectPorId(var oCadastroBairroDto: TCadastroBairroDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Bairro WHERE idBairro =' + IntToStr(oCadastroBairroDto.IdBairro));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroBairroDto.Descricao   := Query.FieldByName('descricao').AsString;
      oCadastroBairroDto.cep         := Query.FieldByName('cep').AsCurrency;
      oCadastroBairroDto.idmunicipio := Query.FieldByName('municipio_idmunicipio').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
