unit uDtoCor;

interface
type
  TDtoCor = class
  private
    FDescricao: string;
    FIdCor: Integer;

    procedure SetDescricao(const Value: string);
    procedure SetIdCor(const Value: Integer);
  public
    constructor Create;
    property IdCor : Integer read FIdCor write SetIdCor;
    property Descricao : string read FDescricao write SetDescricao;
  end;

var
  oDtoCor : TDtoCor;
implementation

{ TDtoCor }

constructor TDtoCor.Create;
begin
  FIdCor := 0;
  FDescricao := '';
end;

procedure TDtoCor.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TDtoCor.SetIdCor(const Value: Integer);
begin
  FIdCor := Value;
end;

end.
