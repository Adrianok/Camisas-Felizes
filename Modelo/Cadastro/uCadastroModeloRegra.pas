unit uCadastroModeloRegra;

interface

uses
  System.SysUtils, uCadastroModeloDto,
  uCadastroModeloForm, uCadastroModeloModel,
  uCadastroCorModel, FireDac.Comp.Client, System.classes,
  uCor_ModeloModel, uCadastroCorDto, uListaCores, Vcl.ComCtrls;

type
  TCadastroModeloRegra = class
  private
    oCor_ModeloModel : TCor_ModeloModel;
  public
    function SelectVinculo(var oListaIdCores : TList; const idModelo : integer): boolean;
    function SelectCores(var oListaCores : TListaCores; const  oCadastroCorModel : TCadastroCorModel): boolean;
    function SelectDescricao(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
    function SelectModelo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function Novo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function Salvar(var oListaIdCores : Tlist; const oCor_ModeloModel : TCor_ModeloModel; const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
    procedure Deletar(const oCadastroModeloModel : TCadastroModeloModel; const oCor_ModeloModel : TCor_ModeloModel; const IdModelo: integer);
  end;

var
  oCadastroModeloRegra: TCadastroModeloRegra;

implementation

{ TCadastroModeloRegra }



procedure TCadastroModeloRegra.Deletar(const oCadastroModeloModel : TCadastroModeloModel;
const oCor_ModeloModel : TCor_ModeloModel; const IdModelo: integer);
begin
  if(oCor_ModeloModel.SelectPorIdModelo(IdModelo))then
    oCor_ModeloModel.DeletarModelo(IdModelo);
  oCadastroModeloModel.Deletar(IdModelo);
end;

function TCadastroModeloRegra.Novo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto : TCadastroModeloDto) : boolean;
begin
  Result := oCadastroModeloModel.NovoId(oCadastroModeloDto);
end;

function TCadastroModeloRegra.Salvar(var oListaIdCores : Tlist; const oCor_ModeloModel : TCor_ModeloModel; const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroModeloDto.IdModelo < 0)then
      oCadastroCorModel.NovoId(oCadastroCorDto);

    if(oCadastroModeloModel.SelectPorModelo(oCadastroModeloDto))then
    begin
      oCadastroModeloModel.Atualizar(oCadastroModeloDto);
      Result:=True
    end
    else
    begin
      oCadastroModeloModel.Inserir(oCadastroModeloDto);
      Result := False;
    end;

    oCor_ModeloModel.Salvar(oListaIdCores, oCadastroModeloDto.IdModelo);


end;

function TCadastroModeloRegra.SelectModelo(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
    Result := oCadastroModeloModel.SelectPorId(oCadastroModeloDto);
end;

function TCadastroModeloRegra.SelectVinculo(var oListaIdCores: TList;
  const idModelo: integer): boolean;
begin
  Result := oCor_ModeloModel.SelectRegistros(oListaIdCores, idModelo);
end;

function TCadastroModeloRegra.SelectCores(var oListaCores : TListaCores;
const  oCadastroCorModel : TCadastroCorModel): boolean;
begin
    Result := oCadastroCorModel.SelectAllLista(oListaCores);
end;

function TCadastroModeloRegra.SelectDescricao(const oCadastroModeloModel : TCadastroModeloModel; var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
  if(oCadastroModeloModel.SelectPorDescricao(oCadastroModeloDto))then
    Result := True
  else
    Result := oCadastroModeloModel.NovoId(oCadastroModeloDto);
end;

end.
