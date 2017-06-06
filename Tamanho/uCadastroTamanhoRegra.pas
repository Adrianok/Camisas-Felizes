unit uCadastroTamanhoRegra;


interface

uses
  System.SysUtils, uCadastroTamanhoDto,
  uCadastroTamanhoForm, uCadastroTamanhoModel;

type
  TCadastroTamanhoRegra = class
  private
  public
    function SelectDescricao(var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function SelectTamanho(var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function Novo(var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
    function Salvar(var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;

  end;

implementation

{ TCadastroTamanhoRegra }



function TCadastroTamanhoRegra.Novo(var oCadastroTamanhoDto : TCadastroTamanhoDto) : boolean;
begin
  Result := oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);
end;

function TCadastroTamanhoRegra.Salvar(var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroTamanhoModel.SelectTamanho(oCadastroTamanhoDto))then
    begin
      //oCadastroTamanhoModel.Atualizar;
      Result:=True
    end
    else
    begin
      oCadastroTamanhoModel.Inserir(oCadastroTamanhoDto);
      Result := False;
    end;


end;

function TCadastroTamanhoRegra.SelectTamanho(
  var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
   // Result := oCadastroTamanhoModel.SelectPorTamanho(oCadastroTamanhoDto);
   Result:= True;
end;

function TCadastroTamanhoRegra.SelectDescricao(
  var oCadastroTamanhoDto: TCadastroTamanhoDto): boolean;
begin
  if(oCadastroTamanhoModel.SelectTamanho(oCadastroTamanhoDto))then
    Result := True
  else
    Result := oCadastroTamanhoModel.NovoId(oCadastroTamanhoDto);
end;

end.
