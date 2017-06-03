unit uCadastroCorRegra;

interface

uses
  System.SysUtils, uCadastroCorDto,
  uCadastroCorForm, uCadastroCorModel;

type
  TCadastroCorRegra = class
  private
  public
    function SelectDescricao(var oCadastroCorDto : TCadastroCorDto) : boolean;
    function SelectCor(var oCadastroCorDto : TCadastroCorDto) : boolean;
    function Novo(var oCadastroCorDto : TCadastroCorDto) : boolean;
    function Salvar(var oCadastroCorDto: TCadastroCorDto): boolean;

  end;

implementation

{ TCadastroCorRegra }



function TCadastroCorRegra.Novo(var oCadastroCorDto : TCadastroCorDto) : boolean;
begin
  Result := oCadastroCorModel.NovoId(oCadastroCorDto);
end;

function TCadastroCorRegra.Salvar(var oCadastroCorDto: TCadastroCorDto): boolean;
begin
    //funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
    if(oCadastroCorModel.SelectCor(oCadastroCorDto))then
    begin
      //oCadastroCorModel.Atualizar;
      Result:=True
    end
    else
    begin
      oCadastroCorModel.Inserir(oCadastroCorDto);
      Result := False;
    end;


end;

function TCadastroCorRegra.SelectCor(
  var oCadastroCorDto: TCadastroCorDto): boolean;
begin
   // Result := oCadastroCorModel.SelectPorCor(oCadastroCorDto);
   Result:= True;
end;

function TCadastroCorRegra.SelectDescricao(
  var oCadastroCorDto: TCadastroCorDto): boolean;
begin
  if(oCadastroCorModel.SelectCor(oCadastroCorDto))then
    Result := True
  else
    Result := oCadastroCorModel.NovoId(oCadastroCorDto);
end;

end.
