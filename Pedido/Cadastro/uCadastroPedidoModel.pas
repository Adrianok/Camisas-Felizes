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
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE Pedido SET descricao ='''
//    + oCadastroPedidoDto.Descricao + ''' WHERE idPedido= '
//    + IntToStr(oCadastroPedidoDto.IdPedido) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
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
    Query.SQL.Add(' DELETE FROM Pedido WHERE idPedido = ' + IntToStr(oCadastroPedidoDto.IdPedido));
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
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO Pedido (idPedido, data, dataentrega, enderecoentrega,'
    +'nomereceptor, nomevendedor, valortotal, observacao, idcliente, usuario) VALUES ('
    + QuotedStr(IntToStr(oCadastroPedidoDto.IdPedido)) + ','+ QuotedStr(DateToStr(oCadastroPedidoDto.data))
    + QuotedStr(DateToStr(oCadastroPedidoDto.dataentrega)) + ','+ QuotedStr(oCadastroPedidoDto.enderecoentrega)
    + QuotedStr(oCadastroPedidoDto.nomereceptor) + ','+ QuotedStr(oCadastroPedidoDto.nomevendedor)
    + QuotedStr(CurrToStr(oCadastroPedidoDto.valortotal)) + ','+ QuotedStr(oCadastroPedidoDto.observacao)
    + QuotedStr(IntToStr(oCadastroPedidoDto.idcliente)) + ','+ QuotedStr(oCadastroPedidoDto.usuario)
    + ');');
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
      oCadastroPedidoDto.enderecoentrega := Query.FieldByName('enderecoentrega').AsString;
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
