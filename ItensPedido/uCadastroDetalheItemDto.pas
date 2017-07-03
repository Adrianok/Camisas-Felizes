unit uCadastroDetalheItemDto;

interface
uses
  System.SysUtils;
type
  TCadastroDetalheItemDto = class
  private
    Fidtamanho: Integer;
    Fidcor: integer;
    Fquantidade: integer;
    FIdDetalhe: Integer;
    procedure Setidcor(const Value: integer);
    procedure Setidtamanho(const Value: Integer);
    procedure Setquantidade(const Value: integer);
    procedure SetIdDetalhe(const Value: Integer);


  public
    constructor Create;
    property IdDetalhe : Integer read FIdDetalhe write SetIdDetalhe;
    property idtamanho : Integer read Fidtamanho write Setidtamanho;
    property idcor : integer read Fidcor write Setidcor;
    property quantidade : integer read Fquantidade write Setquantidade;
  end;

implementation



constructor TCadastroDetalheItemDto.Create;
begin
end;

procedure TCadastroDetalheItemDto.Setidcor(const Value: integer);
begin
  Fidcor := Value;
end;

procedure TCadastroDetalheItemDto.SetIdDetalhe(const Value: Integer);
begin
  FIdDetalhe := Value;
end;

procedure TCadastroDetalheItemDto.Setidtamanho(const Value: Integer);
begin
  Fidtamanho := Value;
end;

procedure TCadastroDetalheItemDto.Setquantidade(const Value: integer);
begin
  Fquantidade := Value;
end;

end.
