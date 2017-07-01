unit uCadastroItensDto ;

interface
uses
  System.SysUtils, System.Generics.Collections,
  uListaDetalheItem, uCadastroDetalheItemDto;
type
  TCadastroItensDto = class
  private
    FvalorItem: Currency;
    Fquantidade: integer;
    FIdItensPedido: Integer;
    FdetalheItem: TListaDetalheItem;
    oCadastroDetalheItemDto : TCadastroDetalheItemDto;

    procedure SetIdItensPedido(const Value: Integer);
    procedure Setquantidade(const Value: integer);
    procedure SetvalorItem(const Value: Currency);
    procedure SetDetalheItem(const Value: TListaDetalheItem);

  public
    constructor Create;
    destructor Destroy; override;

    property IdItensPedido : Integer  read FIdItensPedido write SetIdItensPedido;
    property valorItem : Currency  read FvalorItem write SetvalorItem;
    property quantidade : integer read Fquantidade write Setquantidade;
    property DetalheItem : TListaDetalheItem read FdetalheItem write SetDetalheItem;
  end;

implementation


constructor TCadastroItensDto.Create;
begin

end;


destructor TCadastroItensDto.Destroy;
begin
  inherited;
  FdetalheItem.Free;
end;

procedure TCadastroItensDto.SetDetalheItem(const Value: TListaDetalheItem);
begin
  FdetalheItem := Value;
end;

procedure TCadastroItensDto.SetIdItensPedido(const Value: Integer);
begin
  FIdItensPedido := Value;
end;

procedure TCadastroItensDto.Setquantidade(const Value: integer);
begin
  Fquantidade := Value;
end;

procedure TCadastroItensDto.SetvalorItem(const Value: Currency);
begin
  FvalorItem := Value;
end;

end.
