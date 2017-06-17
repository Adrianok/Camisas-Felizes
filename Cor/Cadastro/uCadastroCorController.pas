unit uCadastroCorController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroCorDto, uClasseInterfaceViewBase,
  uCadastroCorRegra, uCadastroCorModel,
  uCadastroCorForm, uInterfaceViewBase,
  uConsultaCorForm, uConsultaCorController;

type
  TCadastroCorController = class(TClassInterfaceViewBase)
  private
  public
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

var
  oCadastroCorController: IInterfaceViewBase;

implementation


{ TControllerCadastroCor }

procedure TCadastroCorController.Consulta;
begin
inherited;
  if(oCadastroCorDto.IdCor <> 0)then
  begin
    if(oCadastroCorRegra.SelectCor(oCadastroCorModel, oCadastroCorDto))then
    with (oFormulario as TCadastroCorForm) do
    begin
      edtCodigo.Text :=   IntToStr(oCadastroCorDto.IdCor);
      edtCor.Text    :=  oCadastroCorDto.Descricao;
    end;
  end
  else
  begin
    ShowMessage('Nenhum Registro Selecionado');
    Inicial;
  end;
end;

constructor TCadastroCorController.Create;
begin
  if (not(assigned(oCadastroCorModel))) then
    oCadastroCorModel := TCadastroCorModel.Create;

  if (not(assigned(oCadastroCorDto))) then
    oCadastroCorDto := TCadastroCorDto.Create;

  if (not(assigned(oCadastroCorRegra))) then
    oCadastroCorRegra := TCadastroCorRegra.Create;
end;

procedure TCadastroCorController.CriarForm(Aowner: TComponent);
begin
  inherited;
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroCorForm.Create(Aowner);
  oFormulario.oController := oCadastroCorController;
  oFormulario.Show;
end;

destructor TCadastroCorController.Destroy;
begin
  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

  if (assigned(oCadastroCorRegra)) then
    FreeAndNil(oCadastroCorRegra);

    inherited;
end;



procedure TCadastroCorController.Inicial;
begin
  inherited;

end;

procedure TCadastroCorController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroCorController.NovoID;
begin
 if(oCadastroCorRegra.Novo(oCadastroCorModel, oCadastroCorDto))then
  (oFormulario as TCadastroCorForm).edtCodigo.Text := IntToStr(oCadastroCorDto.IdCor);
end;

procedure TCadastroCorController.Pesquisar(Aowner : TComponent);
var
 sIdCor : string;
begin
  inherited;
  sIdCor :=    (oFormulario as TCadastroCorForm).edtCodigo.Text;

  if(sIdCor <> '')then
    oCadastroCorDto.IdCor        :=  StrToInt(sIdCor);
  oCadastroCorDto.Descricao    :=(oFormulario as TCadastroCorForm).edtCor.Text;

  if (not(assigned(oConsultaCorController))) then
    oConsultaCorController := TConsultaCorController.Create;
  oConsultaCorController.CriarForm(Aowner);
end;

procedure TCadastroCorController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroCorForm) do
    begin
      oCadastroCorDto.IdCor        :=  StrToInt(edtCodigo.Text);
      oCadastroCorDto.Descricao          :=  edtCor.Text;
    end;
    if(oCadastroCorRegra.Salvar(oCadastroCorModel, oCadastroCorDto))then
      ShowMessage('Registro: '+ oCadastroCorDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroCorDto.Descricao +' Inserido com sucesso');
    end;
end;




end.
