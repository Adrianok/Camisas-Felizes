unit uCadastroEnderecoDto ;

interface
uses
  System.SysUtils;
type
  TCadastroEnderecoDto = class
  private
    FIdEndereco: Integer;
    FNumero: string;
    Fstatus: integer;
    Fidbairro: integer;
    FEndereco: string;
    procedure SetEndereco(const Value: string);
    procedure Setidbairro(const Value: integer);
    procedure SetIdEndereco(const Value: Integer);
    procedure SetNumero(const Value: string);
    procedure Setstatus(const Value: integer);


  public
    constructor Create;
    property IdEndereco : Integer read FIdEndereco write SetIdEndereco;
    property Endereco : string read FEndereco write SetEndereco;
    property Numero : string read FNumero write SetNumero;
    property idbairro : integer read Fidbairro write Setidbairro;
    property status : integer read Fstatus write Setstatus;
  end;

implementation

{ TDtoEndereco }

constructor TCadastroEnderecoDto.Create;
begin
  FIdEndereco := 0;
  FEndereco := EmptyStr;
end;


procedure TCadastroEnderecoDto.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TCadastroEnderecoDto.Setidbairro(const Value: integer);
begin
  Fidbairro := Value;
end;

procedure TCadastroEnderecoDto.SetIdEndereco(const Value: Integer);
begin
  FIdEndereco := Value;
end;

procedure TCadastroEnderecoDto.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TCadastroEnderecoDto.Setstatus(const Value: integer);
begin
  Fstatus := Value;
end;

end.
