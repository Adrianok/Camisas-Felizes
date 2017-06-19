unit uConsultaModeloModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroModeloDto,
  uConexaoSingleTon, uInterfaceConsultaModeloModel;

type
  TConsultaModeloModel = class(TinterfacedObject, IInterfaceConsultaModeloModel)
  private
    Query: TFDQuery;
  public
   function SelectId(sDescricao : String): Integer;
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaModeloModel: TConsultaModeloModel;
implementation

{ TConsultaModeloModel }
constructor TConsultaModeloModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaModeloModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaModeloModel.SelectAll(MemTable: TFDMemTable): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idModelo, UPPER(descricao) as descricao FROM Modelo');
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

function TConsultaModeloModel.SelectId(sDescricao: String): Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Modelo where descricao = '+QuotedStr(sDescricao));
    if (not(Query.IsEmpty)) then
    begin
      Result := Query.FieldByName('idModelo').AsInteger;
    end
    else
      Result := 0;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
