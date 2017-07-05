unit uCadastroCorModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroCorDto,
  uInterfaceCadastroCorModel, uListaCores;

type
  TCadastroCorModel = class(TinterfacedObject, IInterfaceCadastroCorModel)
  private
    Query: TFDQuery;
  public
    function SelectPorId(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function SelectCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function SelectAllLista(var oListaCores: TListaCores): Boolean;
    function SelectDescricaoDivergente(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function SelectPorDescricao(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Inserir(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Atualizar(var oCadastroCorDto: TCadastroCorDto): Boolean;
    function Deletar(const IdCor : integer): Boolean;
    function NovoId(var oCadastroCorDto: TCadastroCorDto): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oCadastroCorModel: TCadastroCorModel;

implementation

{ TCadastroModeloModel }

function TCadastroCorModel.Atualizar(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' UPDATE cor SET descricao ='''
    + oCadastroCorDto.Descricao + ''' WHERE idcor= '
    + IntToStr(oCadastroCorDto.IdCor) + ';');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

constructor TCadastroCorModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCadastroCorModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCadastroCorModel.Deletar(const IdCor : integer): Boolean;
var
  sSql : string;
begin
  try
    Query.SQL.Clear;
    sSql :=
    ' DELETE FROM cor WHERE idcor = ' + IntToStr(IdCor);
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


function TCadastroCorModel.Inserir(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.SQL.Add(' INSERT INTO cor (idcor, descricao) VALUES ('
    + IntToStr(oCadastroCorDto.IdCor) + ', '''
    + oCadastroCorDto.Descricao + ''');');
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroCorModel.NovoId(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT MAX(idcor) AS id FROM cor');
    if (not(Query.IsEmpty)) then
    begin
      oCadastroCorDto.IdCor := (Query.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroCorModel.SelectAllLista(var oListaCores: TListaCores): Boolean;
var
  oCadastroCorDto: TCadastroCorDto;
  sDescricao : String;
begin
  try
    Query.Open('select idcor, UPPER(descricao) as descricao from cor');
    if (not(Query.IsEmpty)) then
    begin
      Query.First;
      while (not(Query.Eof)) do
      begin
        oCadastroCorDto := TCadastroCorDto.Create;
        oCadastroCorDto.IdCor := Query.FieldByName('idcor').AsInteger;
        oCadastroCorDto.Descricao := Query.FieldByName('descricao').AsString;

        oListaCores.Add(oCadastroCorDto.Descricao, oCadastroCorDto);

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

function TCadastroCorModel.SelectCor(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor WHERE idcor =' + IntToStr(oCadastroCorDto.IdCor));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroCorModel.SelectPorDescricao(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idcor FROM cor WHERE descricao =''' + oCadastroCorDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
    begin
        oCadastroCorDto.IdCor := Query.FieldByName('idcor').AsInteger;
        Result := True
    end
    else
      Result := True;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;
function TCadastroCorModel.SelectDescricaoDivergente(var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor WHERE descricao =''' + oCadastroCorDto.Descricao + ''' ');
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCadastroCorModel.SelectPorId(
  var oCadastroCorDto: TCadastroCorDto): Boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor WHERE idcor =' + IntToStr(oCadastroCorDto.IdCor));
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
      oCadastroCorDto.Descricao := Query.FieldByName('descricao').AsString;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
