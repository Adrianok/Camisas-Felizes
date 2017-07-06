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
    function SelectItensPedido(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Inserir(const oCadastroItensPedido: TCadastroItensDto; const idItensPedido : integer;const idPedido : integer): Boolean;
    function Deletar(const IdItensPedido : integer): Boolean;
    function NovoId: integer;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

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


function TCadastroItensPedidoModel.Inserir(const oCadastroItensPedido: TCadastroItensDto; const idItensPedido : integer;const idPedido : integer): Boolean;
var
  sSql    : string;
  bAux    : boolean;
  iIndice : integer;
begin
  try
    Query.SQL.Clear;
    sSql := ' INSERT INTO ItensPedido (idItensPedido, valorItem, idpedido, quantidade'
    + ',idmodelo) '
    + ' VALUES '
    + '('  + IntToStr(idItensPedido)
                   + ', ' + StringReplace(CurrToStr(oCadastroItensPedido.valorItem), ',', '.', [rfReplaceAll])
                   + ', ' + IntToStr(IdPedido)
                   + ', ' + CurrToStr(oCadastroItensPedido.quantidade)
                   + ', ' + IntToStr(oCadastroItensPedido.idmodelo)
                   + ')';
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

function TCadastroItensPedidoModel.NovoId: integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idItensPedido) AS id FROM ItensPedido');
    if (not(Query.IsEmpty)) then
    begin
      Result := Query.FieldByName('id').AsInteger + 1;
    end
    else
      Result := 0;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroItensPedidoModel.SelectItensPedido(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
var
  oLoopControl : TCadastroItensDto;
  oCadastroItensDto : TCadastroItensDto;
  bAchou : boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM ItensPedido WHERE idpedido =' + IntToStr(oCadastroPedidoDto.IdPedido));
  if (not(Query.IsEmpty)) then
    begin
      oCadastroPedidoDto.ItensPedido.Clear;
      Query.First;
      while (not(Query.Eof)) do
      begin
        oCadastroItensDto := TCadastroItensDto.Create;
        oCadastroItensDto.IdItensPedido := Query.FieldByName('iditensPedido').AsInteger;
        oCadastroItensDto.valorItem := Query.FieldByName('valoritem').AsCurrency;
        oCadastroItensDto.quantidade := Query.FieldByName('quantidade').AsInteger;
        oCadastroItensDto.idmodelo := Query.FieldByName('idmodelo').AsInteger;

        bAchou := False;
        for oLoopControl in oCadastroPedidoDto.ItensPedido.Values do
        begin
          if(oLoopControl.idmodelo = oCadastroItensDto.idmodelo)then
            bAchou := True;
        end;
        if(not(bAchou))then
          oCadastroPedidoDto.ItensPedido.Add(oCadastroItensDto.IdItensPedido, oCadastroItensDto);
        Query.Next;
      end;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
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
