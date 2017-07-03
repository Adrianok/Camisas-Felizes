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
    function SelectDetalheItens(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
    function Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
    function Atualizar(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
    function Deletar(const IdDetalheItens : integer): Boolean;
    function NovoId(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;

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
    ' DELETE FROM DetalheItens WHERE idDetalheItens = ' + IntToStr(IdDetalheItens);
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


function TCadastroDetalheItensModel.Inserir(var oCadastroPedidoDto: TCadastroPedidoDto): Boolean;
var
  oLoopControlDetalhe : TCadastroDetalheItemDto;
  oLoopControlItens   : TCadastroItensDto;
  sSql                : string;
  bAux                : boolean;
begin
  try
    Query.SQL.Clear;
    sSql := ' INSERT INTO detalheitem (iddetalheitem, iditenspedido, idtamanho, idcor'+
    ',quantidade) '+
    ' VALUES ';
    bAux := False;
    for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values do
    begin
      for oLoopControlDetalhe in oLoopControlItens.DetalheItem.Values do
      sSql := sSql + '('  + IntToStr(oLoopControlDetalhe.IdDetalhe)
                   + ', ' + IntToStr(oLoopControlItens.IdItensPedido)
                   + ', ' + CurrToStr(oLoopControlDetalhe.idtamanho)
                   + ', ' + IntToStr(oLoopControlDetalhe.idcor)
                   + ', ' + IntToStr(oLoopControlDetalhe.quantidade)
                   + ')';
      if(bAux)then
        sSql := sSql + ',';
      bAux := True;
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

function TCadastroDetalheItensModel.NovoId(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idDetalheItem) AS id FROM DetalheItem');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroDetalheItemDto.IdDetalhe:= (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;


function TCadastroDetalheItensModel.SelectDetalheItens(var oCadastroDetalheItemDto: TCadastroDetalheItemDto): Boolean;
begin
//  try
//    Query.SQL.Clear;
//    Query.Open('SELECT * FROM DetalheItens WHERE idDetalheItens =' + IntToStr(oCadastroDetalheDetalheItensDto.IdDetalheItens));
//    if (not(Query.IsEmpty)) then
//      Result := True
//    else
//      Result := False;
//  except
//    raise Exception.Create('Não Foi possível acessar o banco de dados');
//  end;
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
