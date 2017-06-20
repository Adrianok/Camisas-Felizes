unit uConsultaMunicipioModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroMunicipioDto,
  uConexaoSingleTon, uInterfaceConsultaMunicipioModel;

type
  TConsultaMunicipioModel = class(TinterfacedObject, IInterfaceConsultaMunicipioModel)
  private
    Query: TFDQuery;
  public
   function SelectId(sDescricao : String): Integer;
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaMunicipioModel: TConsultaMunicipioModel;
implementation

{ TConsultaCorModel }
constructor TConsultaMunicipioModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaMunicipioModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaMunicipioModel.SelectAll(MemTable: TFDMemTable): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idMunicipio, UPPER(descricao) as descricao, uf_iduf FROM Municipio');
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

function TConsultaMunicipioModel.SelectId(sDescricao: String): Integer;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT * FROM Municipio where descricao = '+QuotedStr(sDescricao));
    if (not(Query.IsEmpty)) then
    begin
      Result := Query.FieldByName('idMunicipio').AsInteger;
    end
    else
      Result := 0;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;
end;

end.
