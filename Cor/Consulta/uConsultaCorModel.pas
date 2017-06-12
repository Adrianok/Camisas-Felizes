unit uConsultaCorModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroCorDto,
  uConexaoSingleTon, uInterfaceConsultaCorModel;

type
  TConsultaCorModel = class(TinterfacedObject, IInterfaceConsultaCorModel)
  private
    Query: TFDQuery;
  public
   function SelectId(sDescricao : String): Integer;
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaCorModel: TConsultaCorModel;
implementation

{ TConsultaCorModel }
constructor TConsultaCorModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaCorModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaCorModel.SelectAll(MemTable: TFDMemTable): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idcor, UPPER(descricao) as descricao FROM cor');
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

function TConsultaCorModel.SelectId(sDescricao: String): Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM cor where descricao = '+QuotedStr(sDescricao));
    if (not(Query.IsEmpty)) then
    begin
      Result := Query.FieldByName('idcor').AsInteger;
    end
    else
      Result := 0;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
