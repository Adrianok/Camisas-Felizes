unit uCadastroMunicipioDto;

interface

uses
  System.SysUtils;

type

  TCadastroMunicipioDto = class
  private
    FMunicipio: string;
    Fid: Integer;
    Festado: Integer;
    procedure Setid(const Value: Integer);
    procedure Setestado(const Value: Integer);
    procedure SetMunicipio(const Value: string);

  public
    property id: Integer read Fid write Setid;
    property Municipio: string read FMunicipio write SetMunicipio;
    property estado: Integer read Festado write Setestado;
    constructor Create;
  end;

var
  oCadastroMunicipioDto: TCadastroMunicipioDto;

implementation

{ TMunicipio }

constructor TCadastroMunicipioDto.Create;
begin
  Fid := 0;
  Festado := 0;
  FMunicipio := EmptyStr;
end;

procedure TCadastroMunicipioDto.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCadastroMunicipioDto.Setestado(const Value: Integer);
begin
  Festado := Value;
end;

procedure TCadastroMunicipioDto.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

end.
