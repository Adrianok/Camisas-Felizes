unit uCadastroMunicipioDto;

interface

uses
  System.SysUtils;

type

  TCadastroMunicipioDto = class
  private
    Festado: string;
    Fid: Integer;
    Fmunicipio: string;
    Festadoid: integer;

    procedure Setid(const Value: Integer);
    procedure Setmunicipio(const Value: string);
    procedure Setestado(const Value: string);
    procedure Setestadoid(const Value: integer);

  public
    property id: Integer read Fid write Setid;
    property estado: string read Festado write Setestado;
    property municipio: string read Fmunicipio write Setmunicipio;
    property estadoid: integer read Festadoid write Setestadoid;
    constructor Create;
  end;

var
  oCadastroMunicipioDto: TCadastroMunicipioDto;

implementation

{ TMunicipio }

constructor TCadastroMunicipioDto.Create;
begin
  Fid := 0;
  Fmunicipio := EmptyStr;
  Festado := EmptyStr;
end;

procedure TCadastroMunicipioDto.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCadastroMunicipioDto.Setmunicipio(const Value: string);
begin
  Fmunicipio := Value;
end;

procedure TCadastroMunicipioDto.Setestadoid(const Value: integer);
begin
  Festadoid := Value;
end;

procedure TCadastroMunicipioDto.Setestado(const Value: string);
begin
  Festado := Value;
end;

end.
