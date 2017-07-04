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
    function SelectAllWhere(var MemTable: TFDMemTable; const oListaModelos: TList) : boolean;
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

function TConsultaBairroModel.SelectAllWhere(var MemTable: TFDMemTable;
  const oListaModelos: TList): boolean;
var
  iIndiceLista : integer;
  sSql : string;
begin
  try
    sSql := 'in (';
    for iIndiceLista := 0 to oListaModelos.Count -1 do
    begin
      if(iIndiceLista > 0)then
        sSql := sSql + ', ';
      sSql := sSql + IntToStr(integer(oListaModelos.Items[iIndiceLista])) ;
    end;
    sSql := sSql + ')';


    Query.SQL.Clear;
    Query.Open('SELECT idBairro, UPPER(descricao) as descricao FROM Bairro WHERE idBairro ' + sSql);
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
