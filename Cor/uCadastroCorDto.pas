unit uCadastroCorDto ;

interface
uses
  System.SysUtils;
type
  TCadastroCorDto = class
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
  oCadastroCorDto : TCadastroCorDto;
implementation

{ TDtoCor }

constructor TCadastroCorDto.Create;
begin
  FIdCor := 0;
  FDescricao := EmptyStr;
end;

procedure TCadastroCorDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroCorDto.SetIdCor(const Value: Integer);
begin
  FIdCor := Value;
end;

end.
