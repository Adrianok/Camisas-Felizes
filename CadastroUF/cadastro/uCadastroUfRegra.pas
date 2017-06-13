unit uCadastroUfRegra;

interface

uses
  System.SysUtils, uCadastroUfDto,
  uCadastroUfForm, uCadastroUfModel;

type
  TCadastroUfRegra = class
  private
  public
    function SelectDescricao(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto : TCadastroUfDto) : boolean;
    function SelectUf(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto : TCadastroUfDto) : boolean;
    function Novo(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto : TCadastroUfDto) : boolean;
    function Salvar(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto: TCadastroUfDto): boolean;

  end;

var
  oCadastroUfRegra: TCadastroUfRegra;

implementation

{ TCadastroUfRegra }



function TCadastroUfRegra.Novo(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto : TCadastroUfDto) : boolean;
begin
  Result := oCadastroUfModel.NovoId(oCadastroUfDto);
end;

function TCadastroUfRegra.Salvar(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto: TCadastroUfDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroUfModel.SelectUf(oCadastroUfDto))then
    begin
      oCadastroUfModel.Atualizar(oCadastroUfDto);
      Result:=True
    end
    else
    begin
      oCadastroUfModel.Inserir(oCadastroUfDto);
      Result := False;
    end;


end;

function TCadastroUfRegra.SelectUf(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto: TCadastroUfDto): boolean;
begin
    Result := oCadastroUfModel.SelectPorId(oCadastroUfDto);
end;

function TCadastroUfRegra.SelectDescricao(const oCadastroUfModel : TCadastroUfModel; var oCadastroUfDto: TCadastroUfDto): boolean;
begin
  if(oCadastroUfModel.SelectDescricao(oCadastroUfDto))then
    Result := True
  else
    Result := oCadastroUfModel.NovoId(oCadastroUfDto);
end;

end.
