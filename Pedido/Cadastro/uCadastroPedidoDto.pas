unit uCadastroPedidoDto ;

interface
uses
  System.SysUtils;
type
  TCadastroPedidoDto = class
  private
    FDescricao: string;
    FIdPedido: Integer;

    procedure SetDescricao(const Value: string);
    procedure SetIdPedido(const Value: Integer);
  public
    constructor Create;
    property IdPedido : Integer read FIdPedido write SetIdPedido;
    property Descricao : string read FDescricao write SetDescricao;
  end;

var
  oCadastroPedidoDto : TCadastroPedidoDto;
implementation

{ TDtoPedido }

constructor TCadastroPedidoDto.Create;
begin
  FIdPedido := 0;
  FDescricao := EmptyStr;
end;

procedure TCadastroPedidoDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroPedidoDto.SetIdPedido(const Value: Integer);
begin
  FIdPedido := Value;
end;

end.
