unit uConsultaTamanhoModel;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI, System.Classes, Dialogs, uCadastroTamanhoDto,
  uConexaoSingleTon, uInterfaceConsultaTamanhoModel;

type
  TConsultaTamanhoModel = class(TinterfacedObject, IInterfaceConsultaTamanhoModel)
  private
    Query: TFDQuery;
  public
   function SelectAll(MemTable: TFDMemTable) : boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  var
    oConsultaTamanhoModel: TConsultaTamanhoModel;
implementation

{ TConsultaTamanhoModel }
constructor TConsultaTamanhoModel.Create;
begin
    Query := TFDQuery.Create(nil);
    Query.Connection := TConexaoSigleton.GetInstancia;
end;

destructor TConsultaTamanhoModel.Destroy;
begin
  FreeAndNil(Query);
  inherited;
end;

function TConsultaTamanhoModel.SelectAll(MemTable: TFDMemTable): boolean;
begin
  try
    Query.SQL.Clear;
    Query.Open('SELECT idTamanho, UPPER(descricao) as descricao FROM Tamanho');
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
