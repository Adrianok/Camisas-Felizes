unit uCadastroPedidoModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroPedidoDto,
  uInterfaceCadastroPedidoModel;

type
  TCadastroPedidoModel = class(TinterfacedObject, IInterfaceCadastroPedidoModel)
  private
    Query: TFDQuery;
    oCadastroPedidoDto : TCadastroPedidoDto;
  public
    function SelectPorId(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function SelectPedido(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Atualizar(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Deletar(const IdPedido: integer): Boolean;
    function NovoId(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroPedidoModel.Atualizar(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' UPDATE pedido'
    + ' SET data =' + DateToStr(oCadastroPedidoDto.data)
    + ', dataentrega = ' + DateToStr(oCadastroPedidoDto.dataentrega)
    + ', idendereco = ' + IntToStr(oCadastroPedidoDto.idendereco)
    + ', nomereceptor = ' + QuotedStr(oCadastroPedidoDto.nomereceptor)
    + ', nomevendedor = ' + QuotedStr(oCadastroPedidoDto.nomevendedor)
    + ', valortotal = ' + StringReplace(CurrToStr(oCadastroPedidoDto.valortotal), ',', '.', [rfReplaceAll])
    + ', observacao = ' + QuotedStr(oCadastroPedidoDto.observacao)
    + ', idcliente = ' + IntToStr(oCadastroPedidoDto.idcliente)
    + ', usuario = ' + QuotedStr(oCadastroPedidoDto.usuario)
    + ' WHERE idpedido = ' + IntToStr(oCadastroPedidoDto.IdPedido)
    + ';');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;

constructor TCadastroPedidoModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroPedidoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroPedidoModel.Deletar(const IdPedido: integer): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' DELETE FROM Pedido WHERE idPedido = ' + IntToStr(IdPedido));
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;






function TCadastroPedidoModel.Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql := ' INSERT INTO Pedido (idPedido, data, dataentrega, idendereco,'
    +'nomereceptor, nomevendedor, valortotal, observacao, idcliente, usuario) VALUES ('
    + IntToStr(oCadastroPedidoDto.IdPedido) + ','
    + DateToStr(oCadastroPedidoDto.data) + ','
    + DateToStr(oCadastroPedidoDto.dataentrega) + ','
    + IntToStr(oCadastroPedidoDto.IdPedido) + ','
    + QuotedStr(oCadastroPedidoDto.nomereceptor) + ','
    + QuotedStr(oCadastroPedidoDto.nomevendedor)+ ','
    + CurrToStr(oCadastroPedidoDto.valortotal) + ','
    + QuotedStr(oCadastroPedidoDto.observacao)+ ','
    + IntToStr(oCadastroPedidoDto.idcliente) + ','
    + QuotedStr(oCadastroPedidoDto.usuario)
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

function TCadastroPedidoModel.NovoId(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idPedido) AS id FROM Pedido');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroPedidoDto.IdPedido := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;

function TCadastroPedidoModel.SelectPedido(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Pedido WHERE idPedido =' + IntToStr(oCadastroPedidoDto.IdPedido));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;


function TCadastroPedidoModel.SelectPorId(
  var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Pedido WHERE idPedido =' + IntToStr(oCadastroPedidoDto.IdPedido));
    if (not(Query.IsEmpty)) then
    begin
      oCadastroPedidoDto.data            := Query.FieldByName('data').AsDateTime;
      oCadastroPedidoDto.dataentrega     := Query.FieldByName('dataentrega').AsDateTime;
      oCadastroPedidoDto.idendereco      := Query.FieldByName('idendereco').AsInteger;
      oCadastroPedidoDto.nomereceptor    := Query.FieldByName('nomereceptor').AsString;
      oCadastroPedidoDto.nomevendedor    := Query.FieldByName('nomevendedor').AsString;
      oCadastroPedidoDto.valortotal      := Query.FieldByName('valortotal').AsCurrency;
      oCadastroPedidoDto.observacao      := Query.FieldByName('observacao').AsString;
      oCadastroPedidoDto.idcliente       := Query.FieldByName('idcliente').AsInteger;
      oCadastroPedidoDto.usuario         := Query.FieldByName('usuario').AsString;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');
  end;
end;

end.
