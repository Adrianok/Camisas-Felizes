unit uCadastroCorRegra;

interface

uses
  System.SysUtils, uCadastroCorDto,
  uCadastroCorForm, uCadastroCorModel,
  uCor_ModeloModel;

type
  TCadastroCorRegra = class
  private
  public
    function SelectDescricao(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
    function SelectCor(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
    function Novo(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
    function Salvar(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
    procedure Deletar(const oCor_ModeloModel: TCor_ModeloModel; const oCadastroCorModel : TCadastroCorModel; const IdCor : integer);

  end;

var
  oCadastroCorRegra: TCadastroCorRegra;

implementation

{ TCadastroCorRegra }



procedure TCadastroCorRegra.Deletar(const oCor_ModeloModel: TCor_ModeloModel; const oCadastroCorModel: TCadastroCorModel;
  const IdCor: integer);
begin
  if(oCor_ModeloModel.SelectPorIdCor(IdCor))then
    oCor_ModeloModel.DeletarCor(IdCor);
  oCadastroCorModel.Deletar(IdCor);

end;

function TCadastroCorRegra.Novo(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto : TCadastroCorDto) : boolean;
begin
  Result := oCadastroCorModel.NovoId(oCadastroCorDto);
end;

function TCadastroCorRegra.Salvar(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
begin
    //fun�ao do model checa se ja existem registros com essas informa��es, caso tenha ent�o retorna true
    if(oCadastroCorDto.IdCor < 0)then
      oCadastroCorModel.NovoId(oCadastroCorDto);

    if(oCadastroCorModel.SelectDescricao(oCadastroCorDto))then
      if(oCadastroCorModel.SelectCor(oCadastroCorDto))then
      begin
        oCadastroCorModel.Atualizar(oCadastroCorDto);
        Result:=True
      end
      else
      begin
        oCadastroCorModel.Inserir(oCadastroCorDto);
        Result := False;
      end
    else
      raise Exception.Create('Essa cor j� foi cadastrada!');


end;

function TCadastroCorRegra.SelectCor(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
begin
    Result := oCadastroCorModel.SelectPorId(oCadastroCorDto);
end;

function TCadastroCorRegra.SelectDescricao(const oCadastroCorModel : TCadastroCorModel; var oCadastroCorDto: TCadastroCorDto): boolean;
begin
  if(oCadastroCorModel.SelectDescricao(oCadastroCorDto))then
    Result := True
  else
    Result := oCadastroCorModel.NovoId(oCadastroCorDto);
end;

end.
