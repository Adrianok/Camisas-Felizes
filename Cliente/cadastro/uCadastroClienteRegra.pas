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

end.
