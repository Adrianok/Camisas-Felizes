unit uCadastroUfDto;

interface

uses
  System.SysUtils;

type

  TCadastroUfDto = class
  private
    Fuf: string;
    Fid: Integer;
    Fnome: string;
    procedure Setid(const Value: Integer);
    procedure Setnome(const Value: string);
    procedure Setuf(const Value: string);

  public
    property id: Integer read Fid write Setid;
    property uf: string read Fuf write Setuf;
    property nome: string read Fnome write Setnome;
    constructor Create;
  end;

implementation

{ TUf }

constructor TCadastroUfDto.Create;
begin
  Fid := 0;
  Fnome := EmptyStr;
  Fuf := EmptyStr;
end;

procedure TCadastroUfDto.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCadastroUfDto.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TCadastroUfDto.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
