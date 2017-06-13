unit uConsultaUfModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroUfDto,
  uConexaoSingleTon, uInterfaceConsultaUfModel;

type
  TConsultaUfModel = class(TinterfacedObject, IInterfaceConsultaUfModel)
  private
    Query: TFDQuery;
  public
   function SelectId(sDescricao : String): Integer;
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaUfModel: TConsultaUfModel;
implementation

{ TConsultaUfModel }
constructor TConsultaUfModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaUfModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaUfModel.SelectAll(MemTable: TFDMemTable): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Uf');
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

function TConsultaUfModel.SelectId(sDescricao: String): Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Uf where descricao = '+QuotedStr(sDescricao));
    if (not(Query.IsEmpty)) then
    begin
      Result := Query.FieldByName('idUf').AsInteger;
    end
    else
      Result := 0;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
