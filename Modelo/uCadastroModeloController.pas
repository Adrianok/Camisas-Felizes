unit uCadastroModeloController;

interface
uses
  System.classes, System.SysUtils,
  uCadastroModeloForm, uCadastroModeloDto,
  uCadastroModeloRegra, uCadastroModeloModel;
type
  TCadastroModeloController = class
  private
    procedure FecharForm(Sender : TObject);
  public
    procedure AtribuirDto;
    procedure InstanciarForm(Aowner : TComponent);
    constructor Create(Aowner : TComponent);
    destructor Destroy;
  end;

var
  oCadastroModeloController : TCadastroModeloController;

implementation

{ TControllerCadastroModelo }


procedure TCadastroModeloController.AtribuirDto;
begin

 oCadastroModeloForm.edtCodigo.Text := IntToStr(oCadastroModeloDto.IdModelo);
 oCadastroModeloForm.edtModelo.Text := oCadastroModeloDto.Modelo;
 oCadastroModeloForm.edtPreco.Text := CurrToStr(oCadastroModeloDto.Preco);
 oCadastroModeloForm.edtCor.Text := oCadastroModeloDto.Cor.Descricao;

end;

constructor TCadastroModeloController.Create(Aowner : TComponent);
begin
  if(not(assigned(oCadastroModeloModel)))then
    oCadastroModeloModel := TCadastroModeloModel.Create;

  if(not(assigned(oCadastroModeloDto)))then
    oCadastroModeloDto := TCadastroModeloDto.Create;

  if(not(assigned(oCadastroModeloRegra)))then
    oCadastroModeloRegra := TCadastroModeloRegra.Create;
end;

destructor TCadastroModeloController.Destroy;
begin
  if(assigned(oCadastroModeloModel))then
    FreeAndNil(oCadastroModeloModel);

  if(assigned(oCadastroModeloDto))then
    FreeAndNil(oCadastroModeloDto);

  if(assigned(oCadastroModeloRegra))then
    FreeAndNil(oCadastroModeloRegra);
end;

procedure TCadastroModeloController.FecharForm(Sender: TObject);
begin
  if(assigned(oCadastroModeloForm))then
  begin
    oCadastroModeloForm.Close;
    FreeAndNil(oCadastroModeloForm);
  end;
end;

procedure TCadastroModeloController.InstanciarForm(Aowner: TComponent);
begin
  if not(assigned(oCadastroModeloForm)) then
    oCadastroModeloForm := TCadastroModeloForm.Create(Aowner);

  oCadastroModeloForm.btnFechar.OnClick := FecharForm;
  oCadastroModeloForm.Show;
end;

initialization

finalization
  if (not(assigned(oCadastroModeloController))) then
    FreeAndNil(oCadastroModeloController);
end.
