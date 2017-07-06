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
    function SelectPorCpf(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
    function SelectPorNome(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
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
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
      ' UPDATE cliente'
    + ' SET nome =' + QuotedStr(oCadastroClienteDto.Nome)
    + ', cpf_cnpj = ' + QuotedStr(oCadastroClienteDto.cpf_cnpj)
    + ', idendereco = ' + IntToStr(oCadastroClienteDto.idendereco)
     + ', telefone = ' + QuotedStr(oCadastroClienteDto.telefone)
    + ', celular = ' + QuotedStr(oCadastroClienteDto.celular)
    + ', observacao = ' + QuotedStr(oCadastroClienteDto.observacao)
    + ' WHERE idcliente = ' + IntToStr(oCadastroClienteDto.IdCliente)
    + ';';
    Query.SQL.Add(sSql);
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
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
    ' UPDATE Cliente SET observacao = '''+ 'inativo' +''' WHERE idCliente = ' + IntToStr(IdCliente);
    Query.SQL.Add(sSql);
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;


function TCadastroClienteModel.Inserir(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql := ' INSERT INTO cliente (idcliente, nome, cpf_cnpj, telefone,'
    +'celular, observacao, idendereco) VALUES ('
    + IntToStr(oCadastroClienteDto.IdCliente) + ','
    + QuotedStr(oCadastroClienteDto.Nome) + ','
    + QuotedStr(oCadastroClienteDto.cpf_cnpj) + ','
    + QuotedStr(oCadastroClienteDto.telefone) + ','
    + QuotedStr(oCadastroClienteDto.celular) + ','
    + QuotedStr(oCadastroClienteDto.observacao) + ','
    + IntToStr(oCadastroClienteDto.idendereco)
    + ');';
    Query.SQL.Add(sSql);
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
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
      raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
    end;
end;


function TCadastroClienteModel.SelectCliente(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Cliente WHERE observacao <> '''+'inativo'+''' and idCliente =' + IntToStr(oCadastroClienteDto.IdCliente));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;


function TCadastroClienteModel.SelectPorCpf(
  var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Cliente WHERE observacao <> '''+'inativo'+''' and cpf_cnpj =' + QuotedStr(oCadastroClienteDto.cpf_cnpj));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroClienteDto.IdCliente  := Query.FieldByName('idcliente').AsInteger;
      oCadastroClienteDto.Nome       := Query.FieldByName('nome').AsString;
      oCadastroClienteDto.telefone   := Query.FieldByName('telefone').AsString;
      oCadastroClienteDto.celular    := Query.FieldByName('celular').AsString;
      oCadastroClienteDto.observacao := Query.FieldByName('observacao').AsString;
      oCadastroClienteDto.idendereco := Query.FieldByName('idendereco').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;

function TCadastroClienteModel.SelectPorId(var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Cliente WHERE observacao <> '''+'inativo'+''' and  idCliente =' + IntToStr(oCadastroClienteDto.IdCliente));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroClienteDto.Nome       := Query.FieldByName('nome').AsString;
      oCadastroClienteDto.cpf_cnpj   := Query.FieldByName('cpf_cnpj').AsString;
      oCadastroClienteDto.telefone   := Query.FieldByName('telefone').AsString;
      oCadastroClienteDto.celular    := Query.FieldByName('celular').AsString;
      oCadastroClienteDto.observacao := Query.FieldByName('observacao').AsString;
      oCadastroClienteDto.idendereco := Query.FieldByName('idendereco').AsInteger;
    end
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;

function TCadastroClienteModel.SelectPorNome(
  var oCadastroClienteDto: TCadastroClienteDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cliente WHERE observacao <> '''+'inativo'+''' and nome =''' + oCadastroClienteDto.Nome + ''' ');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroClienteDto.IdCliente := Query.FieldByName('idcliente').AsInteger;
      oCadastroClienteDto.cpf_cnpj := Query.FieldByName('cpf_cnpj').AsString;
      oCadastroClienteDto.telefone := Query.FieldByName('telefone').AsString;
      oCadastroClienteDto.celular := Query.FieldByName('celular').AsString;
      oCadastroClienteDto.observacao := Query.FieldByName('observacao').AsString;
      oCadastroClienteDto.idendereco := Query.FieldByName('idendereco').AsInteger;
      Result := True;
    end
    else
      Result := True;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;

end.
