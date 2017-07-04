unit uConsultaBairroModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroBairroDto,
  uConexaoSingleTon, uInterfaceConsultaBairroModel;

type
  TConsultaBairroModel = class(TinterfacedObject, IInterfaceConsultaBairroModel)
  private
    Query: TFDQuery;
  public
    function SelectAllWhere(var MemTable: TFDMemTable;   const sCondicao: integer) : boolean;
    function SelectAll(MemTable: TFDMemTable) : boolean;
    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaBairroModel: TConsultaBairroModel;
implementation

{ TConsultaBairroModel }
constructor TConsultaBairroModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaBairroModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaBairroModel.SelectAll(MemTable: TFDMemTable) : boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idBairro, UPPER(descricao) as descricao FROM Bairro');
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

function TConsultaBairroModel.SelectAllWhere(var MemTable: TFDMemTable;const sCondicao: integer): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idBairro, UPPER(descricao) as descricao FROM Bairro WHERE idBairro =' + IntToStr(sCondicao));
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
