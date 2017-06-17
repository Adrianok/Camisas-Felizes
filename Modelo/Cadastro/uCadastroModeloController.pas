unit uCadastroModeloController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroModeloDto, uClasseInterfaceViewBase,
  uCadastroModeloRegra, uCadastroModeloModel,
  uCadastroModeloForm, uInterfaceViewBase,
  uConsultaModeloForm, uConsultaModeloController,
  System.Generics.Collections, uCadastroCorDto,
  uCor_ModeloModel, uCadastroCorModel;

type
  TCadastroModeloController = class(TClassInterfaceViewBase)
  private
  public
    ListaIdCor : TList;
    oCor_ModeloModel : TCor_ModeloModel;
    procedure GridCor(const idModelo : Integer);
    procedure Inicial; override;
    procedure Consulta; override;
    procedure Pesquisar(Aowner : TComponent); override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

    TListaCores = TObjectDictionary<String, TCadastroCorDto>;

var
  oCadastroModeloController: IInterfaceViewBase;

implementation


{ TControllerCadastroModelo }

procedure TCadastroModeloController.Consulta;
var
  iIdModelo : integer;
begin
inherited;
  if(oCadastroModeloDto.IdModelo <> 0)then
  begin
    if(oCadastroModeloRegra.SelectModelo(oCadastroModeloModel, oCadastroModeloDto))then
    with (oFormulario as TCadastroModeloForm) do
    begin
      edtCodigo.Text :=   IntToStr(oCadastroModeloDto.IdModelo);
      edtModelo.Text    :=  oCadastroModeloDto.Descricao;
      edtPreco.Text    :=  CurrToStr(oCadastroModeloDto.Preco);

      iIdModelo :=    StrToIntDef((oFormulario as TCadastroModeloForm).edtCodigo.Text, 0);

      if(iIdModelo <> 0)then
        GridCor(iIdModelo);
    end;
  end
  else
  begin
    ShowMessage('Nenhum Registro Selecionado');
    Inicial;
  end;
end;

constructor TCadastroModeloController.Create;
begin
  if (not(assigned(oCadastroModeloModel))) then
    oCadastroModeloModel := TCadastroModeloModel.Create;

  if (not(assigned(oCor_ModeloModel))) then
    oCor_ModeloModel := TCor_ModeloModel.Create;

  if (not(assigned(oCadastroCorDto))) then
    oCadastroCorDto := TCadastroCorDto.Create;

  if (not(assigned(oCadastroCorModel))) then
    oCadastroCorModel := TCadastroCorModel.Create;

  if (not(assigned(oCadastroModeloDto))) then
    oCadastroModeloDto := TCadastroModeloDto.Create;

  if (not(assigned(oCadastroModeloRegra))) then
    oCadastroModeloRegra := TCadastroModeloRegra.Create;
  if (not(assigned(ListaIdCor))) then
end;

procedure TCadastroModeloController.CriarForm(Aowner: TComponent);
begin
  inherited;
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroModeloForm.Create(Aowner);
  oFormulario.oController := oCadastroModeloController;
  oFormulario.Show;
end;

destructor TCadastroModeloController.Destroy;
begin
  if (assigned(oCadastroModeloModel)) then
    FreeAndNil(oCadastroModeloModel);

  if (assigned(oCor_ModeloModel)) then
    FreeAndNil(oCor_ModeloModel);

  if (assigned(oCadastroModeloDto)) then
    FreeAndNil(oCadastroModeloDto);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroModeloRegra)) then
    FreeAndNil(oCadastroModeloRegra);

    inherited;
end;



procedure TCadastroModeloController.GridCor(const idModelo : Integer);
begin
    oCadastroModeloRegra.SelectCoresVinculadas(oCadastroCorDto, oCadastroCorModel, oCor_ModeloModel, (oFormulario as TCadastroModeloForm).MemTableCor, idModelo);
end;

procedure TCadastroModeloController.Inicial;
begin
  inherited;

end;

procedure TCadastroModeloController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroModeloController.NovoID;
begin
 if(oCadastroModeloRegra.Novo(oCadastroModeloModel, oCadastroModeloDto))then
  (oFormulario as TCadastroModeloForm).edtCodigo.Text := IntToStr(oCadastroModeloDto.IdModelo);
end;

procedure TCadastroModeloController.Pesquisar(Aowner : TComponent);
var
 sIdModelo : string;
begin
  inherited;
  sIdModelo :=    (oFormulario as TCadastroModeloForm).edtCodigo.Text;

  if(sIdModelo <> '')then
    oCadastroModeloDto.IdModelo        :=  StrToInt(sIdModelo);
  oCadastroModeloDto.Descricao    := (oFormulario as TCadastroModeloForm).edtModelo.Text;

  if (not(assigned(oConsultaModeloController))) then
    oConsultaModeloController := TConsultaModeloController.Create;
  oConsultaModeloController.CriarForm(Aowner);
end;

procedure TCadastroModeloController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroModeloForm) do
    begin
      oCadastroModeloDto.IdModelo        :=  StrToInt(edtCodigo.Text);
      oCadastroModeloDto.Descricao       :=  edtModelo.Text;
      oCadastroModeloDto.Preco           := StrToCurr(edtPreco.Text);
    end;
    if(oCadastroModeloRegra.Salvar(oCadastroModeloModel, oCadastroModeloDto))then
      ShowMessage('Registro: '+ oCadastroModeloDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroModeloDto.Descricao +' Inserido com sucesso');
    end;
end;




end.
