unit uCadastroClienteDto ;

interface
uses
  System.SysUtils;
type
  TCadastroClienteDto = class
  private
    Fobservacao: string;
    Fcpf_cnpj: string;
    Fidendereco: integer;
    FIdCliente: Integer;
    FNome: string;
    Ftelefone: string;
    Fcelular: string;
    procedure Setcelular(const Value: string);
    procedure Setcpf_cnpj(const Value: string);
    procedure SetIdCliente(const Value: Integer);
    procedure Setidendereco(const Value: integer);
    procedure SetNome(const Value: string);
    procedure Setobservacao(const Value: string);
    procedure Settelefone(const Value: string);

  public
    constructor Create;
    property IdCliente : Integer read FIdCliente write SetIdCliente;
    property Nome : string read FNome write SetNome;
    property cpf_cnpj : string read Fcpf_cnpj write Setcpf_cnpj;
    property telefone : string read Ftelefone write Settelefone;
    property celular : string read Fcelular write Setcelular;
    property observacao : string read Fobservacao write Setobservacao;
    property idendereco : integer read Fidendereco write Setidendereco;
  end;

var
  oCadastroClienteDto : TCadastroClienteDto;

implementation

{ TDtoCliente }

constructor TCadastroClienteDto.Create;
begin
  FIdCliente := 0;
  FNome := EmptyStr;
  Fcpf_cnpj  := EmptyStr;
end;

procedure TCadastroClienteDto.Setcelular(const Value: string);
begin
  Fcelular := Value;
end;

procedure TCadastroClienteDto.Setcpf_cnpj(const Value: String);
begin
  Fcpf_cnpj := Value;
end;

procedure TCadastroClienteDto.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TCadastroClienteDto.Setidendereco(const Value: integer);
begin
  Fidendereco := Value;
end;

procedure TCadastroClienteDto.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCadastroClienteDto.Setobservacao(const Value: string);
begin
  Fobservacao := Value;
end;

procedure TCadastroClienteDto.Settelefone(const Value: string);
begin
  Ftelefone := Value;
end;

end.
