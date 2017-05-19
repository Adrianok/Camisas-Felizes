unit uDtoModelo;

interface
type
  TDtoModelo = class
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
  end;

implementation

{ TDtoModelo }




procedure TDtoModelo.SetIdModelo(const Value: Integer);
begin
  FIdModelo := Value;
end;

procedure TDtoModelo.SetModelo(const Value: string);
begin
  FModelo := Value;
end;

procedure TDtoModelo.SetPreco(const Value: currency);
begin
  FPreco := Value;
end;


end.
