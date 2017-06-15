unit uCadastroUfRegra;

interface

uses
  System.SysUtils,
  uCadastroUfDto, uCadastroUfModel;

type
  TCadastroUfRegra = class
  public
    procedure LimparForm(var aDto: TCadastroUfDto);
    function Salvar(const aModel: TCadastroUfModel; var aUf: TCadastroUfDto): boolean;
    function Novo(var oCadastroModeloDto: TCadastroUfDto): boolean;
    function Deletar(const aModel: TCadastroUfModel; const aIdUf: integer): boolean;
  end;

var
  oCadastroUfRegra: TCadastroUfRegra;

implementation

{ TCadastroUfRegra }

function TCadastroUfRegra.Novo(var oCadastroModeloDto : TCadastroUFDto) : boolean;
begin
  Result := oCadastroUfModel.NovoId(oCadastroUfDto);
end;

function TCadastroUfRegra.Deletar(const aModel: TCadastroUfModel;
  const aIdUf: integer): boolean;
begin
  if (aIdUf > 0) then
    result := aModel.Deletar(aIdUf);
end;

procedure TCadastroUfRegra.LimparForm(var aDto: TCadastroUfDto);
begin
  aDto.id := 0;
  aDto.uf := EmptyStr;
  aDto.nome := EmptyStr;
end;

function TCadastroUfRegra.Salvar(const aModel: TCadastroUfModel;
  var aUf: TCadastroUfDto): boolean;
begin
  result := aModel.Salvar(aUf);
end;

end.
