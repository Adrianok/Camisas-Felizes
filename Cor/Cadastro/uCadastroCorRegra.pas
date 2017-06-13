unit uCadastroCorRegra;

interface

uses
  System.SysUtils, uCadastroCorDto,
  uCadastroCorForm, uCadastroCorModel;

type
  TCadastroCorRegra = class
  private
  public
    function SelectDescricao(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
    function SelectCor(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
    function Novo(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
    function Salvar(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;

  end;

var
  oCadastroCorRegra: TCadastroCorRegra;

implementation

{ TCadastroCorRegra }



function TCadastroCorRegra.Novo(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
begin
  Result := oCadastroCorModel.NovoId(oCadastroCorDto);
end;

function TCadastroCorRegra.Salvar(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
begin
    //fun�ao do model checa se ja existem registros com essas informa��es, caso tenha ent�o retorna true
    if(oCadastroCorModel.SelectCor(oCadastroCorDto))then
    begin
      oCadastroCorModel.Atualizar(oCadastroCorDto);
      Result:=True
    end
    else
    begin
      oCadastroCorModel.Inserir(oCadastroCorDto);
      Result := False;
    end;


end;

function TCadastroCorRegra.SelectCor(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
begin
    Result := oCadastroCorModel.SelectPorId(oCadastroCorDto);
end;

function TCadastroCorRegra.SelectDescricao(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
begin
  if(oCadastroCorModel.SelectDescricao(oCadastroCorDto))then
    Result := True
  else
    Result := oCadastroCorModel.NovoId(oCadastroCorDto);
end;

end.
