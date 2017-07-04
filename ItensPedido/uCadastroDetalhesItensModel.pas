unit uCadastroDetalhesItensModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroDetalheItemDto,
  uInterfaceCadastroDetalhesItensModel, uCadastroPedidoDto,
  uCadastroItensDto;

type
  TCadastroDetalheItensModel = class(TinterfacedObject, IInterfaceCadastroDetalhesItensModel)
  private
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
    function SelectDetalheItens(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Inserir(const oCadastroDetalheDto: TCadastroDetalheItemDto; const idDetalhe : integer; const IdItem : integer): Boolean;
    function Atualizar(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
    function Deletar(const IdDetalheItens : integer): Boolean;
    function NovoId: integer;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCadastroModeloModel }

function TCadastroDetalheItensModel.Atualizar(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.SQL.Add(' UPDATE DetalheItens SET descricao ='''
//    + oCadastroDetalheDetalheItensDto.Descricao + ''' WHERE idDetalheItens= '
//    + IntToStr(oCadastroDetalheDetalheItensDto.IdDetalheItens) + ';');
//    Query.ExecSQL;
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

constructor TCadastroDetalheItensModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroDetalheItensModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroDetalheItensModel.Deletar(const IdDetalheItens : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM DetalheItem WHERE idDetalheItem = ' + IntToStr(IdDetalheItens);
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


function TCadastroDetalheItensModel.Inserir(const oCadastroDetalheDto: TCadastroDetalheItemDto; const idDetalhe : integer; const IdItem : integer): Boolean;
var
  sSql                : string;
begin
  try
    Query.SQL.Clear;
    sSql := ' INSERT INTO detalheitem (iddetalheitem, iditenspedido, idtamanho, idcor'
    + ',quantidade) '
    + ' VALUES '
    + '('  + IntToStr(IdDetalhe)
    + ', ' + IntToStr(IdItem)
    + ', ' + CurrToStr(oCadastroDetalheDto.idtamanho)
    + ', ' + IntToStr(oCadastroDetalheDto.idcor)
    + ', ' + IntToStr(oCadastroDetalheDto.quantidade)
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

function TCadastroDetalheItensModel.NovoId: integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idDetalheItem) AS id FROM DetalheItem');
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


function TCadastroDetalheItensModel.SelectDetalheItens(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
var
  oLoopControlItens   : TCadastroItensDto;
  oCadastroDetalheDto : TCadastroDetalheItemDto;
  sSql                : string;
  bAux                : boolean;
begin
  try
    bAux := False;
    sSql :=  '(';
    for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values  do
    begin
      if(bAux)then
        sSql := sSql + ', ';
      bAux := True;
      sSql  := sSql + IntToStr(oLoopControlItens.IdItensPedido);
      oLoopControlItens.DetalheItem.Clear;
    end;
      sSql := sSql + ')';

    Query.SQL.Clear;
    Query.Open('SELECT * FROM detalheitem WHERE iditenspedido in' + sSql);
    if (not(Query.IsEmpty)) then
    begin
      Query.First;
      while (not(Query.Eof)) do
      begin
        oCadastroDetalheDto := TCadastroDetalheItemDto.Create;
        oCadastroDetalheDto.IdDetalhe := Query.FieldByName('iddetalheitem').AsInteger;
        oCadastroDetalheDto.idtamanho := Query.FieldByName('idtamanho').AsInteger;
        oCadastroDetalheDto.idcor := Query.FieldByName('idcor').AsInteger;
        oCadastroDetalheDto.quantidade := Query.FieldByName('quantidade').AsInteger;

        oCadastroPedidoDto.ItensPedido.Items[Query.FieldByName('iditenspedido').AsInteger].DetalheItem.Add(oCadastroDetalheDto.IdDetalhe, oCadastroDetalheDto);
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


function TCadastroDetalheItensModel.SelectPorId(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.Open('SELECT * FROM DetalheItens WHERE idDetalheItens =' + IntToStr(oCadastroDetalheDetalheItensDto.IdDetalheItens));
//    if (not(Query.IsEmpty)) then
//    begin
//      Result := True;
//      oCadastroDetalheDetalheItensDto.Descricao   := Query.FieldByName('descricao').AsString;
//      oCadastroDetalheDetalheItensDto.iduf := Query.FieldByName('uf_iduf').AsInteger;
//    end
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
end;

end.
