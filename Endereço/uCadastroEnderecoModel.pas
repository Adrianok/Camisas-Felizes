unit uCadastroEnderecoModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroEnderecoDto,
  uInterfaceCadastroEnderecoModel;

type
  TCadastroEnderecoModel = class(TinterfacedObject, IInterfaceCadastroEnderecoModel)
  private
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
    function SelectEndereco(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
    function Inserir(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
    function Atualizar(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
    function Deletar(const IdEndereco : integer): Boolean;
    function NovoId(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroEnderecoModel.Atualizar(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE Endereco SET descricao ='''
//    + oCadastroEnderecoDto.Descricao + ''' WHERE idEndereco= '
//    + IntToStr(oCadastroEnderecoDto.IdEndereco) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

constructor TCadastroEnderecoModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroEnderecoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroEnderecoModel.Deletar(const IdEndereco : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM Endereco WHERE idEndereco = ' + IntToStr(IdEndereco);
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


function TCadastroEnderecoModel.Inserir(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' INSERT INTO Endereco (idEndereco, descricao) VALUES ('
//    + IntToStr(oCadastroEnderecoDto.IdEndereco) + ', '''
//    + oCadastroEnderecoDto.Descricao + ''');');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

function TCadastroEnderecoModel.NovoId(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idEndereco) AS id FROM Endereco');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroEnderecoDto.IdEndereco := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroEnderecoModel.SelectEndereco(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Endereco WHERE idEndereco =' + IntToStr(oCadastroEnderecoDto.IdEndereco));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroEnderecoModel.SelectPorId(var oCadastroEnderecoDto: TCadastroEnderecoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Endereco WHERE idEndereco =' + IntToStr(oCadastroEnderecoDto.IdEndereco));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroEnderecoDto.Endereco       := Query.FieldByName('endereco').AsString;
      oCadastroEnderecoDto.numero   := Query.FieldByName('numero').AsString;
      oCadastroEnderecoDto.idbairro   := Query.FieldByName('idbairro').AsInteger;
      oCadastroEnderecoDto.status    := Query.FieldByName('status').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
