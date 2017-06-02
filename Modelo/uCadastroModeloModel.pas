unit uCadastroModeloModel;

interface

uses
  System.Generics.Collections,FireDAC.Comp.Client,
  System.SysUtils, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI,System.Classes, Dialogs,
  uConexaoSingleTon, uCadastroModeloDto;

type
  TCadastroModeloModel = class(TFDQuery)
  private
    //function SelecionarTudo(var oCadastroModeloDto: TObjectDictionary<string, TCadastroModeloDto>): Boolean;

  public
    function SelectPorCor(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectPorModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectModelo(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function SelectID(var oCadastroModeloDto: TCadastroModeloDto): Boolean;
    function Inserir(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Atualizar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function Deletar(var oCadastroModeloDto: TCadastroModeloDto):boolean;
    function NovoId(var oCadastroModeloDto : TCadastroModeloDto) : boolean;

    constructor Create(AOwner: TComponent); override;
  end;
      //falta fazer a lista hash buscar os registros de idcor que tem idmodelo vinculado
      //na tabela cor_modelo, retornar uma lista hash com as relaçoes e em seguida
      //fazer select na tabela cor pra pegar as descrições que competem a aqueles idcor
      //na lista hash, após isso carregar essas informações numa memTable e transferir
      //para um db grid que aparece quando pressionado f2
var
  oCadastroModeloModel: TCadastroModeloModel;

implementation

{ TCadastroModeloModel }

function TCadastroModeloModel.Atualizar(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin

end;

constructor TCadastroModeloModel.Create(AOwner: TComponent);
begin
  inherited;
  Connection := TConexaoSigleton.GetInstancia;
end;

function TCadastroModeloModel.Deletar(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin

end;

function TCadastroModeloModel.Inserir(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
  try
    SQL.Clear;
     SQL.Add('SET AUTOCOMMIT=0; START  TRANSACTION;  '+
            ' INSERT INTO modelo (idmodelo, modelo, preco) VALUES (' +IntToStr(oCadastroModeloDto.IdModelo) + ', ''' + oCadastroModeloDto.Modelo + ''', ' +CurrToStr(oCadastroModeloDto.Preco) + ');'+
            ' INSERT INTO cor_modelo (cor_idcor, modelo_idmodelo) VALUES (' +IntToStr(oCadastroModeloDto.Cor.IdCor) + ', ' +IntToStr(oCadastroModeloDto.IdModelo) + ');'+
            ' COMMIT; SET AUTOCOMMIT=1;');
    ExecSQL;
    if (not(oCadastroModeloModel.IsEmpty)) then
    begin
      Result := True;
    end
    else if (oCadastroModeloModel.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('Não Foi possível inserir o cadastro');
  end;
end;


function TCadastroModeloModel.NovoId(var oCadastroModeloDto : TCadastroModeloDto) : boolean;
var
  Retorno: Integer;
begin
  try
    SQL.Clear;
    Open('select max(idmodelo) as id from modelo');
    if (not(oCadastroModeloModel.IsEmpty)) then
    begin
      oCadastroModeloDto.IdModelo := (oCadastroModeloModel.FieldByName('id').AsInteger) + 1;
      Result := True;
    end
    else
      Result := False;
  except
    raise Exception.Create('Não Foi possível acessar o banco de dados');
  end;

end;




function TCadastroModeloModel.SelectID(
  var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    SQL.Clear;
    open('SELECT * from modelo WHERE idmodelo = ' +IntToStr(oCadastroModeloDto.IdModelo) + '');
    if (not(oCadastroModeloModel.IsEmpty)) then
     begin
          Result := True;
     end
    else if (oCadastroModeloModel.IsEmpty) then
      Result := False;
  except
    raise Exception.create('Não Foi possível acessar o banco de dados');

  end;
end;


function TCadastroModeloModel.SelectModelo(
  var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    SQL.Clear;
    Open('SELECT * FROM modelo JOIN cor_modelo ON modelo_idmodelo = idmodelo ' +
    'join cor on idcor = cor_idcor WHERE idmodelo = ' +IntToStr(oCadastroModeloDto.IdModelo) + '');
    if (not(oCadastroModeloModel.IsEmpty)) then
     begin
      oCadastroModeloDto.Modelo := FieldByName('modelo').AsString;
      oCadastroModeloDto.Preco := FieldByName('preco').AsCurrency;
      oCadastroModeloDto.Cor.Descricao := FieldByName('descricao').AsString;
      oCadastroModeloDto.Cor.IdCor := FieldByName('idcor').AsInteger;

      Result := True;
     end
    else if (oCadastroModeloModel.IsEmpty) then
      Result := False;
  except
    raise Exception.create('Não Foi possível acessar o banco de dados');

  end;
end;

function TCadastroModeloModel.SelectPorCor(
  var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    SQL.Clear;
    Open('SELECT * FROM cor  WHERE descricao = '''+(oCadastroModeloDto.Cor.Descricao) + ''' ');
    if (not(oCadastroModeloModel.IsEmpty)) then
     begin
      oCadastroModeloDto.Cor.IdCor := FieldByName('idcor').AsInteger;
      Result := True;
     end
    else if (oCadastroModeloModel.IsEmpty) then
      Result := False;
  except
    raise Exception.create('Não Foi possível acessar o banco de dados');

  end;


end;

function TCadastroModeloModel.SelectPorModelo(
  var oCadastroModeloDto: TCadastroModeloDto): Boolean;
begin
  try
    SQL.Clear;
      Open('SELECT idmodelo FROM modelo WHERE modelo = ''' +oCadastroModeloDto.Modelo+''' ');
    if (not(oCadastroModeloModel.IsEmpty)) then
     begin
      oCadastroModeloDto.IdModelo := FieldByName('idmodelo').AsInteger;
      Result := True;
     end
    else if (oCadastroModeloModel.IsEmpty) then
      Result := False;
  except
    raise Exception.create('Não Foi possível acessar o banco de dados');

  end;

end;

end.
