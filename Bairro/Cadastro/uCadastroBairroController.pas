unit uCadastroBairroController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroBairroDto, uClasseInterfaceViewBase,
  uCadastroBairroRegra, uCadastroBairroModel,
  uCadastroBairroForm, uInterfaceViewBase,
  uConsultaBairroForm, uConsultaBairroController;

type
  TCadastroBairroController = class(TClassInterfaceViewBase)
  private
    oCadastroBairroModel : TCadastroBairroModel;
    oCadastroBairroDto   : TCadastroBairroDto;

    procedure RetornoBairro(aIdBairro : integer);
  public
    procedure Excluir; override;
    procedure Inicial; override;
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl); override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroBairroController: IInterfaceViewBase;

implementation


{ TControllerCadastroBairro }

constructor TCadastroBairroController.Create;
begin
  if (not(assigned(oCadastroBairroModel))) then
    oCadastroBairroModel := TCadastroBairroModel.Create;

  if (not(assigned(oCadastroBairroDto))) then
    oCadastroBairroDto := TCadastroBairroDto.Create;

  if (not(assigned(oCadastroBairroRegra))) then
    oCadastroBairroRegra := TCadastroBairroRegra.Create;
end;

procedure TCadastroBairroController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroBairroForm.Create(Aowner);
  oFormulario.oController := oCadastroBairroController;
  oFormulario.Show;
  inherited;
end;

destructor TCadastroBairroController.Destroy;
begin
  if (assigned(oCadastroBairroModel)) then
    FreeAndNil(oCadastroBairroModel);

  if (assigned(oCadastroBairroDto)) then
    FreeAndNil(oCadastroBairroDto);

  if (assigned(oCadastroBairroRegra)) then
    FreeAndNil(oCadastroBairroRegra);

    inherited;
end;



procedure TCadastroBairroController.Excluir;
begin
  inherited;
  oCadastroBairroRegra.Deletar(oCadastroBairroModel, oCadastroBairroDto.IdBairro);
end;

procedure TCadastroBairroController.Inicial;
begin
  inherited;

end;

procedure TCadastroBairroController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroBairroController.NovoID;
begin
 if(oCadastroBairroRegra.Novo(oCadastroBairroModel, oCadastroBairroDto))then
  (oFormulario as TCadastroBairroForm).edtCodigo.Text := IntToStr(oCadastroBairroDto.IdBairro);
end;

procedure TCadastroBairroController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
 sIdBairro : string;
begin
  inherited;
  sIdBairro :=    (oFormulario as TCadastroBairroForm).edtCodigo.Text;

  if(sIdBairro <> '')then
    oCadastroBairroDto.IdBairro        :=  StrToInt(sIdBairro);
  oCadastroBairroDto.Descricao    :=(oFormulario as TCadastroBairroForm).edtBairro.Text;

  if (not(assigned(oConsultaBairroController))) then
    oConsultaBairroController := TConsultaBairroController.Create;
  oConsultaBairroController.CriarForm(Aowner, RetornoBairro, oCadastroBairroDto.Descricao);
end;

procedure TCadastroBairroController.RetornoBairro(aIdBairro: integer);
begin
  if(aIdBairro <> 0)then
  begin
    oCadastroBairroDto.IdBairro :=  aIdBairro;
    if(oCadastroBairroRegra.SelectBairro(oCadastroBairroModel, oCadastroBairroDto))then
    with (oFormulario as TCadastroBairroForm) do
    begin
      edtCodigo.Text :=   IntToStr(oCadastroBairroDto.IdBairro);
      edtBairro.Text    :=  oCadastroBairroDto.Descricao;
    end;
  end;
end;

procedure TCadastroBairroController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroBairroForm) do
    begin
      oCadastroBairroDto.IdBairro        :=  StrToInt(edtCodigo.Text);
      oCadastroBairroDto.Descricao          :=  edtBairro.Text;
    end;
    if(oCadastroBairroRegra.Salvar(oCadastroBairroModel, oCadastroBairroDto))then
      ShowMessage('Registro: '+ oCadastroBairroDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroBairroDto.Descricao +' Inserido com sucesso');
    end;
end;




end.
