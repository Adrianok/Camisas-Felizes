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
    procedure SetIdModelo(const Value: Integer);
    procedure SetModelo(const Value: string);
    procedure SetPreco(const Value: currency);
  public
    property IdModelo: Integer read FIdModelo write SetIdModelo;
    property Modelo: string read FModelo write SetModelo;
    property Preco: currency read FPreco write SetPreco;
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
  if(not(assigned(oCadastroCorDto)))then
    oCadastroCorDto := TCadastroCorDto.Create;
end;

destructor TCadastroModeloDto.Destroy;
begin
  inherited;
  if(assigned(oCadastroCorDto))then
    FreeAndNil(oCadastroCorDto);
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
