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
    FDataFinal: TDate;
    FDataInicial: TDate;
    FProdutoInicial: integer;
    FMunicipioFinal: integer;
    FMunicipioInicial: integer;
    FProdutoFinal: integer;
    procedure SetClienteFinal(const Value: Integer);
    procedure SetClienteInicial(const Value: Integer);
    procedure SetDataFinal(const Value: TDate);
    procedure SetDataInicial(const Value: TDate);
    procedure SetPedidoFinal(const Value: Integer);
    procedure SetPedidoInicial(const Value: Integer);
    procedure SetMunicipioFinal(const Value: integer);
    procedure SetMunicipioInicial(const Value: integer);
    procedure SetProdutoFinal(const Value: integer);
    procedure SetProdutoInicial(const Value: integer);

  public
    property ClienteInicial : Integer read FClienteInicial write SetClienteInicial;
    property ClienteFinal : Integer read FClienteFinal write SetClienteFinal;
    property DataInicial : TDate read FDataInicial write SetDataInicial;
    property DataFinal : TDate read FDataFinal write SetDataFinal;
    property PedidoInicial : Integer read FPedidoInicial write SetPedidoInicial;
    property PedidoFinal : Integer read FPedidoFinal write SetPedidoFinal;
    property ProdutoInicial : integer read FProdutoInicial write SetProdutoInicial;
    property ProdutoFinal : integer read FProdutoFinal write SetProdutoFinal;
    property MunicipioInicial : integer read FMunicipioInicial write SetMunicipioInicial;
    property MunicipioFinal : integer read FMunicipioFinal write SetMunicipioFinal;
  end;


implementation

{ TRelatorioDto }

procedure TRelatorioDto.SetClienteFinal(const Value: Integer);
begin
  FClienteFinal := Value;
end;

procedure TRelatorioDto.SetClienteInicial(const Value: Integer);
begin
  FClienteInicial := Value;
end;

procedure TRelatorioDto.SetDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TRelatorioDto.SetDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TRelatorioDto.SetMunicipioFinal(const Value: integer);
begin
  FMunicipioFinal := Value;
end;

procedure TRelatorioDto.SetMunicipioInicial(const Value: integer);
begin
  FMunicipioInicial := Value;
end;

procedure TRelatorioDto.SetPedidoFinal(const Value: Integer);
begin
  FPedidoFinal := Value;
end;

procedure TRelatorioDto.SetPedidoInicial(const Value: Integer);
begin
  FPedidoInicial := Value;
end;

procedure TRelatorioDto.SetProdutoFinal(const Value: integer);
begin
  FProdutoFinal := Value;
end;

procedure TRelatorioDto.SetProdutoInicial(const Value: integer);
begin
  FProdutoInicial := Value;
end;

end.

