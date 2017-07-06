unit uCadastroTamanhoRegra;

interface

uses
  System.SysUtils, uCadastroTamanhoDto,
  uCadastroTamanhoForm, uCadastroTamanhoModel;

type
  TCadastroTamanhoRegra = class
  private
  public
    function SelectPorDescricao(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function SelectPorId(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function Deletar(const oCadastroTamanhoModel : TCadastroTamanhoModel; const IdTamanho : integer) : boolean;
    function Novo(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function Salvar(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
  end;

implementation

{ TCadastroTamanhoRegra }



function TCadastroTamanhoRegra.Deletar(const oCadastroTamanhoModel: TCadastroTamanhoModel;
  const IdTamanho: integer): boolean;
begin
  if(oCadastroTamanhoModel.Deletar(IdTamanho))then
    raise Exception.Create('Falha ao excluir registro');
end;

function TCadastroTamanhoRegra.Novo(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
begin
  Result := oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);
end;

function TCadastroTamanhoRegra.Salvar(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroTamanhoDto.IdTamanho < 0)then
      oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);

    if(oCadastroTamanhoModel.SelectTamanho(oCadastroTamanhoDto))then
    begin
      oCadastroTamanhoModel.Atualizar(oCadastroTamanhoDto);
      Result:=True
    end
    else
    begin
      oCadastroTamanhoModel.Inserir(oCadastroTamanhoDto);
      Result := False;
    end;


end;

function TCadastroTamanhoRegra.SelectPorId(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
    Result := oCadastroTamanhoModel.SelectPorId(oCadastroTamanhoDto);
end;

function TCadastroTamanhoRegra.SelectPorDescricao(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
  if(oCadastroTamanhoModel.SelectPorDescricao(oCadastroTamanhoDto))then
    Result := True
  else
    Result := oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);
end;

end.
