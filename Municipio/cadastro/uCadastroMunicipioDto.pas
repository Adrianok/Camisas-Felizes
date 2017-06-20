unit uCadastroMunicipioDto;

interface

uses
  System.SysUtils;

type

  TCadastroMunicipioDto = class
  private
    FMunicipio: string;
    Fid: Integer;
    Festado: string;
    procedure Setid(const Value: Integer);
    procedure Setestado(const Value: string);
    procedure SetMunicipio(const Value: string);

  public
    property id: Integer read Fid write Setid;
    property Municipio: string read FMunicipio write SetMunicipio;
    property estado: string read Festado write Setestado;
    constructor Create;
  end;

var
  oCadastroMunicipioDto: TCadastroMunicipioDto;

implementation

{ TMunicipio }

constructor TCadastroMunicipioDto.Create;
begin
  Fid := 0;
  Festado := EmptyStr;
  FMunicipio := EmptyStr;
end;

procedure TCadastroMunicipioDto.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCadastroMunicipioDto.Setestado(const Value: string);
begin
  Festado := Value;
end;

procedure TCadastroMunicipioDto.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

end.
