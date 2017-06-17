unit uCadastroModeloRegra;

interface

uses
  System.SysUtils, uCadastroModeloDto,
  uCadastroModeloForm, uCadastroModeloModel,
  uCadastroCorModel, FireDac.Comp.Client,
  uCor_ModeloModel;

type
  TCadastroModeloRegra = class
  private
    oCor_ModeloModel : TCor_ModeloModel;
  public
    function SelectCoresVinculadas(const oCor_ModeloModel : TCor_ModeloModel; var MemTable : TFDMemTable; const IdModelo : integer): boolean;
    function SelectDescricao(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function SelectModelo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function Novo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function Salvar(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;

  end;

var
  oCadastroModeloRegra: TCadastroModeloRegra;

implementation

{ TCadastroModeloRegra }



function TCadastroModeloRegra.Novo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
begin
  Result := oCadastroModeloModel.NovoId(oCadastroModeloDto);
end;

function TCadastroModeloRegra.Salvar(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroModeloModel.SelectModelo(oCadastroModeloDto))then
    begin
      oCadastroModeloModel.Atualizar(oCadastroModeloDto);
      Result:=True
    end
    else
    begin
      oCadastroModeloModel.Inserir(oCadastroModeloDto);
      Result := False;
    end;


end;

function TCadastroModeloRegra.SelectModelo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
    Result := oCadastroModeloModel.SelectPorId(oCadastroModeloDto);
end;

function TCadastroModeloRegra.SelectCoresVinculadas(const oCor_ModeloModel: TCor_ModeloModel;
  var MemTable: TFDMemTable; const IdModelo : integer): boolean;
begin
  oCor_ModeloModel.SelectRegistros(MemTable, IdModelo);

end;

function TCadastroModeloRegra.SelectDescricao(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
  if(oCadastroModeloModel.SelectDescricao(oCadastroModeloDto))then
    Result := True
  else
    Result := oCadastroModeloModel.NovoId(oCadastroModeloDto);
end;

end.
