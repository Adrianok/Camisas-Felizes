unit uCadastroModeloDto;

interface
uses
  System.SysUtils;
type
  TCadastroModeloDto = class
  private
    FDescricao: string;
    FIdModelo: Integer;
    FPreco: currency;

    procedure SetDescricao(const Value: string);
    procedure SetIdModelo(const Value: Integer);
    procedure SetPreco(const Value: currency);
  public
    constructor Create;
    property IdModelo : Integer read FIdModelo write SetIdModelo;
    property Descricao : string read FDescricao write SetDescricao;
    property Preco : currency read FPreco write SetPreco;
  end;

var
  oCadastroModeloDto : TCadastroModeloDto;
implementation

{ TDtoModelo }

constructor TCadastroModeloDto.Create;
begin
  FIdModelo := 0;
  FDescricao := EmptyStr;
end;

procedure TCadastroModeloDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroModeloDto.SetIdModelo(const Value: Integer);
begin
  FIdModelo := Value;
end;

procedure TCadastroModeloDto.SetPreco(const Value: currency);
begin
  FPreco := Value;
end;

end.
