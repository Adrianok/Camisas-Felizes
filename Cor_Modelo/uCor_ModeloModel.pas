unit uCor_ModeloModel;

interface
uses
  FireDac.Comp.Client, uInterfaceCor_ModeloModel,
  uConexaoSingleTon, System.SysUtils, Dialogs;

  type
    TCor_ModeloModel = class(TInterfacedObject, IInterfaceCor_ModeloModel)
    private
      Query : TFDQuery;
    public
      function SelectRegistros(const MemTable : TFDMemTable; const IdModelo : Integer):boolean;

      constructor Create;
      destructor Destroy;
    end;

implementation

{ TCor_ModeloModel }

constructor TCor_ModeloModel.Create;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TCor_ModeloModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TCor_ModeloModel.SelectRegistros(const MemTable : TFDMemTable; const IdModelo : Integer):boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor_modelo WHERE modelo_idmodelo =' + IntToStr(IdModelo));
    if (not(Query.IsEmpty)) then
    begin
      MemTable.Data := Query.Data;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.

