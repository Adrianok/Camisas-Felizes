unit uCadastroPedidoDto ;

interface
uses
  System.SysUtils;
type
  TCadastroPedidoDto = class
  private
    Fobservacao: string;
    Fenderecoentrega: string;
    Fnomereceptor: string;
    Fdataentrega: string;
    FDescricao: string;
    Fnomevendedor: string;
    Fvalortotal: currency;
    FIdPedido: Integer;
    Fidcliente: Integer;
    Fusuario: string;
    Fdata: string;
    procedure Setdata(const Value: string);
    procedure Setdataentrega(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure Setenderecoentrega(const Value: string);
    procedure Setidcliente(const Value: Integer);
    procedure SetIdPedido(const Value: Integer);
    procedure Setnomereceptor(const Value: string);
    procedure Setnomevendedor(const Value: string);
    procedure Setobservacao(const Value: string);
    procedure Setusuario(const Value: string);
    procedure Setvalortotal(const Value: currency);



  public
    constructor Create;

    property IdPedido : Integer read FIdPedido write SetIdPedido;
    property data : string read Fdata write Setdata;
    property dataentrega : string read Fdataentrega write Setdataentrega;
    property enderecoentrega : string read Fenderecoentrega write Setenderecoentrega;
    property nomereceptor : string read Fnomereceptor write Setnomereceptor;
    property nomevendedor : string read Fnomevendedor write Setnomevendedor;
    property valortotal : currency read Fvalortotal write Setvalortotal;
    property Descricao : string read FDescricao write SetDescricao;
    property observacao : string read Fobservacao write Setobservacao;
    property idcliente : Integer read Fidcliente write Setidcliente;
    property usuario : string read Fusuario write Setusuario;
  end;

var
  oCadastroPedidoDto : TCadastroPedidoDto;
implementation

{ TDtoPedido }

constructor TCadastroPedidoDto.Create;
begin
    Fobservacao      := EmptyStr;
    Fenderecoentrega := EmptyStr;
    Fnomereceptor    := EmptyStr;
    Fdataentrega     := EmptyStr;
    FDescricao       := EmptyStr;
    Fnomevendedor    := EmptyStr;
    Fvalortotal      := 0;
    FIdPedido        := 0;
    Fidcliente       := 0;
    Fusuario         := EmptyStr;
    Fdata            := EmptyStr;
end;

procedure TCadastroPedidoDto.Setdata(const Value: string);
begin
  Fdata := Value;
end;

procedure TCadastroPedidoDto.Setdataentrega(const Value: string);
begin
  Fdataentrega := Value;
end;

procedure TCadastroPedidoDto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCadastroPedidoDto.Setenderecoentrega(const Value: string);
begin
  Fenderecoentrega := Value;
end;

procedure TCadastroPedidoDto.Setidcliente(const Value: Integer);
begin
  Fidcliente := Value;
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
