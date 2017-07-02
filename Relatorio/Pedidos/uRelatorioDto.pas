unit uRelatorioDto;

interface

uses
System.SysUtils;

type
  TRelatorioDto = class
      private
    FPedidoFinal: Integer;
    FPedidoInicial: Integer;
    FClienteFinal: Integer;
    FClienteInicial: Integer;
    FDataFinal: TDateTime;
    FDataInicial: TDateTime;
    procedure SetClienteFinal(const Value: Integer);
    procedure SetClienteInicial(const Value: Integer);
    procedure SetDataFinal(const Value: TDateTime);
    procedure SetDataInicial(const Value: TDateTime);
    procedure SetPedidoFinal(const Value: Integer);
    procedure SetPedidoInicial(const Value: Integer);

  public
    constructor Create;
    property ClienteInicial : Integer read FClienteInicial write SetClienteInicial;
    property ClienteFinal : Integer read FClienteFinal write SetClienteFinal;
    property DataInicial : TDateTime read FDataInicial write SetDataInicial;
    property DataFinal : TDateTime read FDataFinal write SetDataFinal;
    property PedidoInicial : Integer read FPedidoInicial write SetPedidoInicial;
    property PedidoFinal : Integer read FPedidoFinal write SetPedidoFinal;
  end;


implementation

{ TRelatorioDto }

constructor TRelatorioDto.Create;
begin

end;

procedure TRelatorioDto.SetClienteFinal(const Value: Integer);
begin
  FClienteFinal := Value;
end;

procedure TRelatorioDto.SetClienteInicial(const Value: Integer);
begin
  FClienteInicial := Value;
end;

procedure TRelatorioDto.SetDataFinal(const Value: TDateTime);
begin
  FDataFinal := Value;
end;

procedure TRelatorioDto.SetDataInicial(const Value: TDateTime);
begin
  FDataInicial := Value;
end;

procedure TRelatorioDto.SetPedidoFinal(const Value: Integer);
begin
  FPedidoFinal := Value;
end;

procedure TRelatorioDto.SetPedidoInicial(const Value: Integer);
begin
  FPedidoInicial := Value;
end;

end.

