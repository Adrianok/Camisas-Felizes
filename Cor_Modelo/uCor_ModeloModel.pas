unit uCor_ModeloModel;

interface
uses
  FireDac.Comp.Client, uInterfaceCor_ModeloModel,
  uConexaoSingleTon, System.SysUtils, Dialogs, System.Classes;

  type
    TCor_ModeloModel = class(TInterfacedObject, IInterfaceCor_ModeloModel)
    private
      Query : TFDQuery;
    public
      function SelectPorIdCor(const IdCor : integer): boolean;
      function SelectPorIdModelo(const IdModelo : integer): boolean;
      function SelectRegistros(var oListaIdCores : TList; const IdModelo : Integer):boolean;
      function Salvar(const oListaIdCores: TList; const IdModelo : Integer): boolean;
      function DeletarModelo(const IdModelo : Integer): boolean;
      function DeletarCor(const IdCor : Integer): boolean;
      constructor Create;
      destructor Destroy; override;
    end;
var
  oCor_ModeloModel : TCor_ModeloModel;

implementation

{ TCor_ModeloModel }

constructor TCor_ModeloModel.Create;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexaoSigleton.GetInstancia;
end;

function TCor_ModeloModel.DeletarCor(const IdCor: Integer): boolean;
var
  Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM cor_modelo WHERE cor_idcor =' + IntToStr(IdCor));
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

function TCor_ModeloModel.DeletarModelo(const IdModelo : Integer): boolean;
var
  Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM cor_modelo WHERE modelo_idmodelo =' + IntToStr(IdModelo));
    Query.ExecSQL;
    if (not(Query.IsEmpty)) then
    begin
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

destructor TCor_ModeloModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCor_ModeloModel.Salvar(const oListaIdCores: TList; const IdModelo : Integer): boolean;
var
  iIndice : Integer;
  bAux : boolean;
  sSql : string;
  Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    DeletarModelo(IdModelo);
    Query.SQL.Clear;
     sSql := 'INSERT INTO cor_modelo (cor_idcor, modelo_idmodelo) '
               + ' VALUES ';
    bAux := False;
    for iIndice := 0 to oListaIdCores.Count -1 do
    begin
      if(bAux)then
        sSql := sSql + ',';
      bAux := True;
      sSql := sSql + '(' + IntToStr(integer(oListaIdCores[iIndice]))
                   + ',' + IntToStr(IdModelo)
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
  FreeAndNil(Query);
end;

function TCor_ModeloModel.SelectPorIdCor(const IdCor: integer): boolean;
var
  Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor_modelo WHERE cor_idcor =' + IntToStr(IdCor));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
  FreeAndNil(Query);
end;

function TCor_ModeloModel.SelectPorIdModelo(const IdModelo: integer): boolean;
var
  Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor_modelo WHERE modelo_idmodelo =' + IntToStr(IdModelo));
    if (not(Query.IsEmpty)) then
      Result := True
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
  FreeAndNil(Query);
end;



function TCor_ModeloModel.SelectRegistros(var oListaIdCores : TList; const IdModelo : Integer):boolean;
var
  Query : TFDQuery;
begin
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor_modelo WHERE modelo_idmodelo =' + IntToStr(IdModelo));
    if (not(Query.IsEmpty)) then
    begin
      oListaIdCores.Clear;
      Query.First;
      while (not(Query.Eof)) do
      begin
        oListaIdCores.Add(pointer(Query.FieldByName('cor_idcor').AsInteger));

        Query.Next;
      end;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
  FreeAndNil(Query);
end;

end.

