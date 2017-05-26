unit uCadastroModeloRegra;

interface

uses
  System.SysUtils, uCadastroModeloDto,
  uCadastroModeloForm, uCadastroModeloModel;

type
  TCadastroModeloRegra = class
  private
  public
    function Novo:Integer;
    function Salvar(var oCadastroModeloDto: TCadastroModeloDto): boolean;
  end;

var
  oCadastroModeloRegra: TCadastroModeloRegra;

implementation

{ TCadastroModeloRegra }

function TCadastroModeloRegra.Novo: Integer;
begin
  Result := oCadastroModeloModel.NovoId;
end;

function TCadastroModeloRegra.Salvar(var oCadastroModeloDto: TCadastroModeloDto): boolean;
begin
 // oCadastroModeloModel.Inserir;
end;

end.
