unit uCadastroClienteRegra;

interface

uses
  System.SysUtils, uCadastroClienteDto,
  uCadastroClienteForm, uCadastroClienteModel;

type
  TCadastroClienteRegra = class
  private
  public
    function SelectDescricao(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function SelectCliente(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Novo(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Salvar(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function Deletar(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
    function ValidaCPF(aCpf : string):boolean;
    function ValidarCNPJ(Acnpj: string): Boolean;

  end;

var
  oCadastroClienteRegra: TCadastroClienteRegra;

implementation

{ TCadastroClienteRegra }

function TCadastroClienteRegra.Deletar(const oCadastroClienteModel: TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  if (oCadastroClienteModel.SelectCliente(oCadastroClienteDto)) then
  begin
    oCadastroClienteModel.Deletar(oCadastroClienteDto.IdCliente);
    Result := True
  end
end;

function TCadastroClienteRegra.Novo(const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.NovoId(oCadastroClienteDto);
end;

function TCadastroClienteRegra.Salvar(const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  // funçao do model checa se ja existem registros com essas informações, caso tenha então retorna true
  if (oCadastroClienteModel.SelectCliente(oCadastroClienteDto)) then
  begin
    oCadastroClienteModel.Atualizar(oCadastroClienteDto);
    Result := True
  end
  else
  begin
    oCadastroClienteModel.Inserir(oCadastroClienteDto);
    Result := False;
  end;

end;

function TCadastroClienteRegra.SelectCliente(const oCadastroClienteModel: TCadastroClienteModel;
  var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  Result := oCadastroClienteModel.SelectPorId(oCadastroClienteDto);
end;

function TCadastroClienteRegra.SelectDescricao(const oCadastroClienteModel
  : TCadastroClienteModel; var oCadastroClienteDto: TCadastroClienteDto): boolean;
begin
  if (oCadastroClienteModel.SelectDescricao(oCadastroClienteDto)) then
    Result := True
  else
    Result := oCadastroClienteModel.NovoId(oCadastroClienteDto);
end;

function TCadastroClienteRegra.ValidaCPF(aCpf: string): boolean;
var
  iContador1, iContador2, iSoma, iMultiplicacao: integer;
  iDigito: integer;
  sCPF, sCPFValidado: String;
begin
  sCPF := '00000000000' + trim(Acpf);
  sCPF := copy(sCPF, length(sCPF) - 10, 11);
  sCPFValidado := copy(sCPF, 1, 9);

  for iContador1 := 0 to 1 do
  begin
    iSoma := 0;
    iMultiplicacao := 10 + iContador1;
    for iContador2 := 1 to (9 + iContador1) do
    begin
      iSoma := iSoma + (StrToInt(copy(sCPF, iContador2, 1)) * iMultiplicacao);
      iMultiplicacao := iMultiplicacao - 1;
    end;
    iDigito := iSoma mod 11;
    if iDigito < 2 then
      iDigito := 0
    else
      iDigito := 11 - iDigito;
    sCPFValidado := sCPFValidado + IntToStr(iDigito);
  end;
  Result := sCPF = sCPFValidado;
end;

function TCadastroClienteRegra.ValidarCNPJ(Acnpj: string): Boolean;
var
  iContador1, iContador2, iSoma, iDigito: integer;
  iControlador, iMultiplicacao, iPosicao: integer;
  sCNPJ, sCNPJValidado: string;

begin
  sCNPJ := '00000000000000' + trim(Acnpj);
  sCNPJ := copy(sCNPJ, length(sCNPJ) - 13, 14);
  sCNPJValidado := copy(sCNPJ, 1, 12);

  for iContador1 := 0 to 1 do
  begin
    iSoma := 0;
    iMultiplicacao := 6 - iContador1;
    iControlador := 0;
    iPosicao := 1;
    for iContador2 := 1 to (12 + iContador1) do
    begin
      iSoma := iSoma + (StrToInt(copy(sCNPJ, iPosicao, 1)) * iMultiplicacao);
      begin
        if (iContador2 = 4 + iContador1) then
          iMultiplicacao := 2
        else
          iMultiplicacao := iMultiplicacao + 1;
      end;
      Inc(iPosicao);

    end;
    iDigito := iSoma mod 11;
    begin
      if iDigito < 2 then
        iDigito := 0
    end;
    sCNPJValidado := sCNPJValidado + IntToStr(iDigito);
  end;
  Result := True;
end;

end.
