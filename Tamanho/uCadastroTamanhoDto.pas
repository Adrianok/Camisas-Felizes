unit uCadastroTamanhoDto;

interface
uses
  System.SysUtils;
type
  TCadastroTamanhoDto = class
  private
    FDescricao: string;
    FIdTamanho: Integer;

    procedure SetDescricao(const Value: string);
    procedure SetIdTamanho(const Value: Integer);
  public
    constructor Create;
    property IdTamanho : Integer read FIdTamanho write SetIdTamanho;
    property Descricao : string read FDescricao write SetDescricao;
  end;

var
  oCadastroTamanhoDto : TCadastroTamanhoDto;
implementation

{ TDtoTamanho }

constructor TCadastroTamanhoDto.Create;
begin
  FIdTamanho := 0;
  FDescricao := EmptyStr;
end;

procedure TCadastroTamanhoDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroTamanhoDto.SetIdTamanho(const Value: Integer);
begin
  FIdTamanho := Value;
end;

end.
