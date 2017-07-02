unit uCadastroItensPedidoModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroItensDto,
  uInterfaceCadastroItensPedidoModel,
  uCadastroPedidoDto;

type
  TCadastroItensPedidoModel = class(TinterfacedObject, IInterfaceCadastroItensPedidoModel)
  private
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroItensDto: TCadastroItensDto): Boolean;
    function SelectItensPedido(var oCadastroItensDto: TCadastroItensDto): Boolean;
    function Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Atualizar(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Deletar(const IdItensPedido : integer): Boolean;
    function NovoId(var oCadastroItensDto: TCadastroItensDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroItensPedidoModel.Atualizar(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE ItensPedido SET descricao ='''
//    + oCadastroItensPedidoDto.Descricao + ''' WHERE idItensPedido= '
//    + IntToStr(oCadastroItensPedidoDto.IdItensPedido) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

constructor TCadastroItensPedidoModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroItensPedidoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroItensPedidoModel.Deletar(const IdItensPedido : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM ItensPedido WHERE idItensPedido = ' + IntToStr(IdItensPedido);
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


function TCadastroItensPedidoModel.Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
var
  sSql    : string;
  bAux    : boolean;
  iIndice : integer;
  oLoopControl : TCadastroItensDto;
begin
  try
    Query.SQL.Clear;
    sSql := ' INSERT INTO ItensPedido (idItensPedido, valorItem, idpedido, quantidade'+
    'idmodelo) '+
    ' VALUES ';

      bAux := False;
    for oLoopControl in oCadastroPedidoDto.ItensPedido.Values do
    begin
      if(bAux)then
        sSql := sSql + ',';
      bAux := True;
      sSql := sSql + '('  + IntToStr(oLoopControl.IdItensPedido)
                   + ', ' + CurrToStr(oLoopControl.valorItem)
                   + ', ' + IntToStr(oCadastroPedidoDto.IdPedido)
                   + ', ' + CurrToStr(oLoopControl.quantidade)
                   + ', ' + IntToStr(oLoopControl.idmodelo)
                   + ')';
    end;
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

function TCadastroItensPedidoModel.NovoId(var oCadastroItensDto: TCadastroItensDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idItensPedido) AS id FROM ItensPedido');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroItensDto.IdItensPedido := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroItensPedidoModel.SelectItensPedido(var oCadastroItensDto: TCadastroItensDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.Open('SELECT * FROM ItensPedido WHERE idItensPedido =' + IntToStr(oCadastroItensPedidoDto.IdItensPedido));
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

function TCadastroItensPedidoModel.SelectPorId(var oCadastroItensDto: TCadastroItensDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.Open('SELECT * FROM ItensPedido WHERE idItensPedido =' + IntToStr(oCadastroItensPedidoDto.IdItensPedido));
//    if (not(Query.IsEmpty)) then
//    begin
//      Result := True;
//      oCadastroItensPedidoDto.Descricao   := Query.FieldByName('descricao').AsString;
//      oCadastroItensPedidoDto.iduf := Query.FieldByName('uf_iduf').AsInteger;
//    end
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

end.
