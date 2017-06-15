unit uCadastroTamanhoRegra;

interface

uses
  System.SysUtils, uCadastroTamanhoDto,
  uCadastroTamanhoForm, uCadastroTamanhoModel;

type
  TCadastroTamanhoRegra = class
  private
  public
    function SelectDescricao(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function SelectTamanho(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function Novo(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function Salvar(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;

  end;

var
  oCadastroTamanhoRegra: TCadastroTamanhoRegra;

implementation

{ TCadastroTamanhoRegra }



function TCadastroTamanhoRegra.Novo(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
begin
  Result := oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);
end;

function TCadastroTamanhoRegra.Salvar(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
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

function TCadastroTamanhoRegra.SelectTamanho(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
    Result := oCadastroTamanhoModel.SelectPorId(oCadastroTamanhoDto);
end;

function TCadastroTamanhoRegra.SelectDescricao(const oCadastroTamanhoModel : TCadastroTamanhoModel; var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
  if(oCadastroTamanhoModel.SelectDescricao(oCadastroTamanhoDto))then
    Result := True
  else
    Result := oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);
end;

end.
