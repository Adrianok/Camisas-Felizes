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
    sSql :=
      ' UPDATE pedido'
    + ' SET data =' + QuotedStr(FormatDateTime('yyyy/mm/dd', oCadastroPedidoDto.data))
    + ', dataentrega = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', oCadastroPedidoDto.dataentrega))
    + ', idendereco = ' ;
    if(oCadastroPedidoDto.idendereco = 0)then
      sSql := sSql + 'NULL,'
    else
      sSql := sSql + IntToStr(oCadastroPedidoDto.idendereco);
    sSql := sSql +
      ', nomereceptor = ' + QuotedStr(oCadastroPedidoDto.nomereceptor)
    + ', nomevendedor = ' + QuotedStr(oCadastroPedidoDto.nomevendedor)
    + ', valortotal = ' + StringReplace(CurrToStr(oCadastroPedidoDto.valortotal), ',', '.', [rfReplaceAll])
    + ', observacao = ' + QuotedStr({oCadastroPedidoDto.observacao}'aaaa')
    + ', idcliente = ' + IntToStr(oCadastroPedidoDto.idcliente)
    + ', usuario = ' + QuotedStr(oCadastroPedidoDto.usuario)
    + ' WHERE idpedido = ' + IntToStr(oCadastroPedidoDto.IdPedido)
    + ';';
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
    raise Exception.Create('Não Foi possível acessar o banco de dados');
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
    + QuotedStr(FormatDateTime('yyyy/mm/dd', oCadastroPedidoDto.data)) + ','
    + QuotedStr(FormatDateTime('yyyy/mm/dd', oCadastroPedidoDto.dataentrega)) + ',';
    if(oCadastroPedidoDto.idendereco = 0)then
      sSql := sSql + 'NULL,'
    else
      sSql := sSql + IntToStr(oCadastroPedidoDto.idendereco) + ',';
    sSql := sSql +
      QuotedStr(oCadastroPedidoDto.nomereceptor) + ','
    + QuotedStr(oCadastroPedidoDto.nomevendedor)+ ','
    + StringReplace(CurrToStr(oCadastroPedidoDto.valortotal), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ','
    + QuotedStr({oCadastroPedidoDto.observacao}'aaaa') + ','
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
    raise Exception.Create('Não Foi possível acessar o banco de dados');
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
    raise Exception.Create('Não Foi possível acessar o banco de dados');
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
    raise Exception.Create('Não Foi possível acessar o banco de dados');
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
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
