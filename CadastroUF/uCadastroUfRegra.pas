unit uCadastroUfRegra;

interface

uses
  System.SysUtils,
  uCadastroUfDto, uCadastroUfModel;

type
  TCadastroUfRegra = class
  public
    procedure LimparForm(var aDto: TCadastroUfDto);
    function Salvar(var aModel: TCadastroUfModel;
      var aUf: TCadastroUfDto): boolean;
    function BuscarId: integer;

  end;

implementation

{ TCadastroUfRegra }

function TCadastroUfRegra.BuscarId: integer;
begin
  result := oCadastroUfModel.NovoId;
end;

procedure TCadastroUfRegra.LimparForm(var aDto: TCadastroUfDto);
begin
  aDto.id := 0;
  aDto.uf := EmptyStr;
  aDto.nome := EmptyStr;
end;

function TCadastroUfRegra.Salvar(var aModel: TCadastroUfModel;
  var aUf: TCadastroUfDto): boolean;
begin
  result := False;
  if ((trim(aUf.uf) <> EmptyStr)) then
    if ((aUf.nome) <> EmptyStr) then
      result := aModel.Salvar(aUf);
end;

end.
