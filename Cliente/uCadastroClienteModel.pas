unit uCadastroClienteModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroClienteDto,
  uInterfaceCadastroClienteModel;

type
  TCadastroClienteModel = class(TinterfacedObject, IInterfaceCadastroClienteModel)
  private
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
    function SelectCliente(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
    function Inserir(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
    function Atualizar(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
    function Deletar(const IdCliente : integer): Boolean;
    function NovoId(var oCadastroClienteDto: TCadastroClienteDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroClienteModel.Atualizar(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE Cliente SET descricao ='''
//    + oCadastroClienteDto.Descricao + ''' WHERE idCliente= '
//    + IntToStr(oCadastroClienteDto.IdCliente) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

constructor TCadastroClienteModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroClienteModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroClienteModel.Deletar(const IdCliente : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM Cliente WHERE idCliente = ' + IntToStr(IdCliente);
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


function TCadastroClienteModel.Inserir(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' INSERT INTO Cliente (idCliente, descricao) VALUES ('
//    + IntToStr(oCadastroClienteDto.IdCliente) + ', '''
//    + oCadastroClienteDto.Descricao + ''');');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

function TCadastroClienteModel.NovoId(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idCliente) AS id FROM Cliente');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroClienteDto.IdCliente := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroClienteModel.SelectCliente(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Cliente WHERE idCliente =' + IntToStr(oCadastroClienteDto.IdCliente));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroClienteModel.SelectPorId(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
var
  Query: TFDQuery;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Cliente WHERE idCliente =' + IntToStr(oCadastroClienteDto.IdCliente));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroClienteDto.Nome       := Query.FieldByName('nome').AsString;
      oCadastroClienteDto.cpf_cnpj   := Query.FieldByName('cpf_cnpj').AsCurrency;
      oCadastroClienteDto.telefone   := Query.FieldByName('telefone').AsInteger;
      oCadastroClienteDto.celular    := Query.FieldByName('celular').AsInteger;
      oCadastroClienteDto.observacao := Query.FieldByName('observacao').AsString;
      oCadastroClienteDto.idendereco := Query.FieldByName('idendereco').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
