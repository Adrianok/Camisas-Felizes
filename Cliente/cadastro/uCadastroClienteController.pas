unit uCadastroClienteController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroClienteDto, uClasseInterfaceViewBase,
  uCadastroClienteRegra, uCadastroClienteModel,
  uCadastroClienteForm, uInterfaceViewBase,
  uConsultaClienteForm, uConsultaClienteController;

type
  TCadastroClienteController = class(TClassInterfaceViewBase)
  private
    procedure RetornoCliente(aIdCliente: integer);
  public
    procedure Inicial; override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure Pesquisar(Aowner: TComponent; ActiveControl: TWinControl); override;
    procedure NovoID;
    procedure Excluir; override;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroClienteController: IInterfaceViewBase;

implementation

{ TControllerCadastroCliente }


constructor TCadastroClienteController.Create;
begin
  if (not(assigned(oCadastroClienteModel))) then
    oCadastroClienteModel := TCadastroClienteModel.Create;

  if (not(assigned(oCadastroClienteDto))) then
    oCadastroClienteDto := TCadastroClienteDto.Create;

  if (not(assigned(oCadastroClienteRegra))) then
    oCadastroClienteRegra := TCadastroClienteRegra.Create;
end;

procedure TCadastroClienteController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroClienteForm.Create(Aowner);
  oFormulario.oController := oCadastroClienteController;
  oFormulario.Show;
  inherited;
end;

procedure TCadastroClienteController.Excluir;
begin
  inherited;
  if (oCadastroClienteRegra.Deletar(oCadastroClienteModel, oCadastroClienteDto)) then
    ShowMessage('Registro deletado com sucesso')
end;

destructor TCadastroClienteController.Destroy;
begin
  if (assigned(oCadastroClienteModel)) then
    FreeAndNil(oCadastroClienteModel);

  if (assigned(oCadastroClienteDto)) then
    FreeAndNil(oCadastroClienteDto);

  if (assigned(oCadastroClienteRegra)) then
    FreeAndNil(oCadastroClienteRegra);

  inherited;
end;

procedure TCadastroClienteController.Inicial;
begin
  inherited;

end;

procedure TCadastroClienteController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroClienteController.NovoID;
begin
  if (oCadastroClienteRegra.Novo(oCadastroClienteModel, oCadastroClienteDto)) then
    (oFormulario as TCadastroClienteForm).ledtCodigo.Text := IntToStr(oCadastroClienteDto.IdCliente);
end;

procedure TCadastroClienteController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
 sIdCliente : string;
begin
  inherited;
  if(sIdCliente <> '')then
    oCadastroClienteDto.IdCliente   :=  StrToInt(sIdCliente);
    oCadastroClienteDto.Nome   :=(oFormulario as TCadastroClienteForm).EdtNome.Text;
    oCadastroClienteDto.cpf_cnpj := (oFormulario as TCadastroClienteForm).EdtCpfCnpj.Text;
    oCadastroClienteDto.telefone := (oFormulario as TCadastroClienteForm).EdtTelefone.Text;
    oCadastroClienteDto.celular := (oFormulario as TCadastroClienteForm).EdtCelular.Text;
    oCadastroClienteDto.observacao := (oFormulario as TCadastroClienteForm).edtObservacoes.Text;
    oCadastroClienteDto.idendereco := (oFormulario as TCadastroClienteForm).EdtEndereco.Text;

  if (not(assigned(oConsultaClienteController))) then
    oConsultaClienteController := TConsultaClienteController.Create;
  oConsultaClienteController.CriarForm(Aowner, RetornoCliente, oCadastroClienteDto.nome);
end;

procedure TCadastroClienteController.RetornoCliente(aIdCliente: integer);
begin
  if (aIdCliente > 0) then
  begin
    oCadastroClienteDto.IdCliente := aIdCliente;
    if (oCadastroClienteRegra.SelectCliente(oCadastroClienteModel, oCadastroClienteDto)) then
      with (oFormulario as TCadastroClienteForm) do
      begin
        ledtCodigo.Text := IntToStr(oCadastroClienteDto.Id);
        ledtCliente.Text := oCadastroClienteDto.Cliente;
        ledtNome.Text := oCadastroClienteDto.nome;
      end;
  end
  else
  begin
    Inicial;
    raise Exception.Create('N�o foi escolhido registro');
  end;
end;

procedure TCadastroClienteController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroClienteForm) do
  begin
    oCadastroClienteDto.Id := StrToInt(ledtCodigo.Text);
    oCadastroClienteDto.Cliente := ledtCliente.Text;
    oCadastroClienteDto.nome := ledtNome.Text;
  end;
  if (oCadastroClienteRegra.Salvar(oCadastroClienteModel, oCadastroClienteDto)) then
    ShowMessage('Registro: ' + oCadastroClienteDto.Cliente + ' Atualizado com sucesso')
  else
  begin
    ShowMessage('Registro: ' + oCadastroClienteDto.Cliente + ' Inserido com sucesso');
  end;
end;

end.
