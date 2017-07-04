unit uCadastroBairroDto ;

interface
uses
  System.SysUtils;
type
  TCadastroBairroDto = class
  private
    Fidmunicipio: integer;
    FDescricao: string;
    Fcep: currency;
    FIdBairro: Integer;
    procedure Setcep(const Value: currency);
    procedure SetDescricao(const Value: string);
    procedure SetIdBairro(const Value: Integer);
    procedure Setidmunicipio(const Value: integer);

  public
    constructor Create;
    property IdBairro   : Integer read FIdBairro write SetIdBairro;
    property Descricao  : string read FDescricao write SetDescricao;
    property cep : currency read Fcep write Setcep;
    property idmunicipio : integer read Fidmunicipio write Setidmunicipio;

  end;

implementation

{ TDtoBairro }

constructor TCadastroBairroDto.Create;
begin
  FIdBairro := 0;
  FDescricao := EmptyStr;
  Fcep := 0;
  Fidmunicipio := 0;
end;


procedure TCadastroBairroDto.Setcep(const Value: currency);
begin
  Fcep := Value;
end;

procedure TCadastroBairroDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroBairroDto.SetIdBairro(const Value: Integer);
begin
  FIdBairro := Value;
end;

procedure TCadastroBairroDto.Setidmunicipio(const Value: integer);
begin
  Fidmunicipio := Value;
end;

end.
