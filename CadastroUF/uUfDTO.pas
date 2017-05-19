unit uUfDTO;

interface

type

  TUfDTO = class
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

procedure TUfDTO.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TUfDTO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TUfDTO.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
