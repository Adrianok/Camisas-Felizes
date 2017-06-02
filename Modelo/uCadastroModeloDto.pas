unit uCadastroModeloDto;

interface
uses
  System.SysUtils, uCadastroCorDto;
type
  TCadastroModeloDto = class
  private
    FPreco: currency;
    FModelo: string;
    FIdModelo: Integer;
    FCor: TCadastroCorDto;
    procedure SetIdModelo(const Value: Integer);
    procedure SetModelo(const Value: string);
    procedure SetPreco(const Value: currency);
    procedure SetCor(const Value: TCadastroCorDto);
  public
    property IdModelo: Integer read FIdModelo write SetIdModelo;
    property Modelo: string read FModelo write SetModelo;
    property Preco: currency read FPreco write SetPreco;
    property Cor : TCadastroCorDto read FCor write SetCor;
    constructor Create;
    destructor Destroy;override;
  end;

var
  oCadastroModeloDto : TCadastroModeloDto;

implementation

{ TDtoModelo }


constructor TCadastroModeloDto.Create;
begin
  IdModelo := 0;
  Preco := 0;
  Modelo := EmptyStr;

  FCor := TCadastroCorDto.Create;
end;

destructor TCadastroModeloDto.Destroy;
begin
  inherited;
  if(assigned(FCor))then
    FreeAndNil(FCor);
end;

procedure TCadastroModeloDto.SetCor(const Value: TCadastroCorDto);
begin
  FCor := Value;
end;

procedure TCadastroModeloDto.SetIdModelo(const Value: Integer);
begin
  FIdModelo := Value;
end;

procedure TCadastroModeloDto.SetModelo(const Value: string);
begin
  FModelo := Value;
end;

procedure TCadastroModeloDto.SetPreco(const Value: currency);
begin
  FPreco := Value;
end;


end.
