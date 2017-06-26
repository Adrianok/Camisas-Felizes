unit uCadastroMunicipioDto ;

interface
uses
  System.SysUtils;
type
  TCadastroMunicipioDto = class
  private
    Fidmunicipio: integer;
    FDescricao: string;
    Fiduf: integer;
    procedure SetDescricao(const Value: string);
    procedure SetIdMunicipio(const Value: Integer);
    procedure Setiduf(const Value: integer);
  public
    constructor Create;
    property IdMunicipio   : Integer read FIdMunicipio write SetIdMunicipio;
    property Descricao  : string read FDescricao write SetDescricao;
    property iduf : integer read Fiduf write Setiduf;

  end;

implementation

{ TDtoMunicipio }

constructor TCadastroMunicipioDto.Create;
begin
  FIdMunicipio := 0;
  FDescricao := EmptyStr;
  Fiduf := 0;
end;

procedure TCadastroMunicipioDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroMunicipioDto.SetIdMunicipio(const Value: Integer);
begin
  FIdMunicipio := Value;
end;
procedure TCadastroMunicipioDto.Setiduf(const Value: integer);
begin
  Fiduf := Value;
end;

end.
