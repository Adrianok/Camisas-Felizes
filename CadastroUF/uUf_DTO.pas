unit uUf_DTO;

interface

type

  TUf_DTO = class
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

  end;

implementation

{ TUf }

procedure TUf_DTO.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TUf_DTO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TUf_DTO.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
