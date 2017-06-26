unit uCadastroPedidoDto ;

interface
uses
  System.SysUtils;
type
  TCadastroPedidoDto = class
  private
    Fobservacao: string;
    Fnomereceptor: string;
    Fnomevendedor: string;
    Fvalortotal: currency;
    FIdPedido: Integer;
    Fidcliente: Integer;
    Fusuario: string;
    Fdata: TDate;
    Fdataentrega: TDate;
    Fidendereco: integer;
    procedure Setidcliente(const Value: Integer);
    procedure SetIdPedido(const Value: Integer);
    procedure Setnomereceptor(const Value: string);
    procedure Setnomevendedor(const Value: string);
    procedure Setobservacao(const Value: string);
    procedure Setusuario(const Value: string);
    procedure Setvalortotal(const Value: currency);
    procedure Setdata(const Value: TDate);
    procedure Setdataentrega(const Value: TDate);
    procedure Setidendereco(const Value: integer);



  public
    constructor Create;

    property IdPedido : Integer read FIdPedido write SetIdPedido;
    property data : TDate read Fdata write Setdata;
    property dataentrega : TDate  read Fdataentrega write Setdataentrega;
    property idendereco : integer read Fidendereco write Setidendereco;
    property nomereceptor : string read Fnomereceptor write Setnomereceptor;
    property nomevendedor : string read Fnomevendedor write Setnomevendedor;
    property valortotal : currency read Fvalortotal write Setvalortotal;
    property observacao : string read Fobservacao write Setobservacao;
    property idcliente : Integer read Fidcliente write Setidcliente;
    property usuario : string read Fusuario write Setusuario;
  end;

implementation

{ TDtoPedido }

constructor TCadastroPedidoDto.Create;
begin
    Fobservacao      := EmptyStr;
    Fidendereco      := 0;
    Fnomereceptor    := EmptyStr;
    Fdataentrega     := 0;
    Fnomevendedor    := EmptyStr;
    Fvalortotal      := 0;
    FIdPedido        := 0;
    Fidcliente       := 0;
    Fusuario         := EmptyStr;
    Fdata            := 0;
end;



procedure TCadastroPedidoDto.Setdata(const Value: TDate);
begin
  Fdata := Value;
end;

procedure TCadastroPedidoDto.Setdataentrega(const Value: TDate);
begin
  Fdataentrega := Value;
end;



procedure TCadastroPedidoDto.Setidcliente(const Value: Integer);
begin
  Fidcliente := Value;
end;

procedure TCadastroPedidoDto.Setidendereco(const Value: integer);
begin
  Fidendereco := Value;
end;

procedure TCadastroPedidoDto.SetIdPedido(const Value: Integer);
begin
  FIdPedido := Value;
end;

procedure TCadastroPedidoDto.Setnomereceptor(const Value: string);
begin
  Fnomereceptor := Value;
end;

procedure TCadastroPedidoDto.Setnomevendedor(const Value: string);
begin
  Fnomevendedor := Value;
end;

procedure TCadastroPedidoDto.Setobservacao(const Value: string);
begin
  Fobservacao := Value;
end;

procedure TCadastroPedidoDto.Setusuario(const Value: string);
begin
  Fusuario := Value;
end;

procedure TCadastroPedidoDto.Setvalortotal(const Value: currency);
begin
  Fvalortotal := Value;
end;

end.
