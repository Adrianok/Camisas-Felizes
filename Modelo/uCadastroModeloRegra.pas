unit uCadastroModeloRegra;

interface

uses
  System.SysUtils, uCadastroModeloDto,
  uCadastroModeloForm, uCadastroModeloModel;

type
  TCadastroModeloRegra = class
  private
  public
    function SelectDescricao(var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function SelectCor(var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function Novo(var oCadastroModeloDto : TCadastroModeloDto) : boolean;
    function Salvar(var oCadastroModeloDto: TCadastroModeloDto): boolean;
  end;

var
  oCadastroModeloRegra: TCadastroModeloRegra;

implementation

{ TCadastroModeloRegra }

function TCadastroModeloRegra.Novo(var oCadastroModeloDto : TCadastroModeloDto) : boolean;
begin
  Result := oCadastroModeloModel.NovoId(oCadastroModeloDto);
end;

function TCadastroModeloRegra.Salvar(var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroModeloModel.SelectID(oCadastroModeloDto))then
    begin
      //oCadastroModeloModel.Atualizar;
      Result:=True
    end
    else
    begin
      oCadastroModeloModel.Inserir(oCadastroModeloDto);
      Result := False;
    end;


end;

function TCadastroModeloRegra.SelectCor(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
    Result := oCadastroModeloModel.SelectPorCor(oCadastroModeloDto);
end;

function TCadastroModeloRegra.SelectDescricao(
  var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
  if(oCadastroModeloModel.SelectPorModelo(oCadastroModeloDto))then
    Result := oCadastroModeloModel.SelectModelo(oCadastroModeloDto)
  else
    Result := oCadastroModeloModel.NovoId(oCadastroModeloDto);
end;

end.
