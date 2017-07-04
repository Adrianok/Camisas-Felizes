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
    function ValidaCPF(aCpf : string):boolean;
    function ValidarCNPJ(Acnpj: string): Boolean;
    procedure VerificaCPF_CNPJ(Sender: TObject);

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

  (oFormulario as TCadastroClienteForm).EdtCpfCnpj.OnExit := VerificaCPF_CNPJ;

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
    (oFormulario as TCadastroClienteForm).EdtCodigo.Text := IntToStr(oCadastroClienteDto.IdCliente);
end;

procedure TCadastroClienteController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
begin
  inherited;

  oCadastroClienteDto.Nome   :=(oFormulario as TCadastroClienteForm).EdtNome.Text;
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
        EdtCodigo.Text := IntToStr(oCadastroClienteDto.IdCliente);
        EdtNome.Text := oCadastroClienteDto.Nome;
        EdtTelefone.Text := oCadastroClienteDto.telefone;
        EdtCpfCnpj.Text := oCadastroClienteDto.cpf_cnpj;
        EdtCelular.Text := oCadastroClienteDto.celular;
        edtObservacoes.Text := oCadastroClienteDto.observacao;
        EdtEndereco.Text := IntToStr(oCadastroClienteDto.idendereco);
      end;
  end
  else;
end;

procedure TCadastroClienteController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroClienteForm) do
  begin
    oCadastroClienteDto.IdCliente := StrToInt(EdtCodigo.Text);
    oCadastroClienteDto.Nome := EdtNome.Text;
    oCadastroClienteDto.telefone := EdtTelefone.Text;
    oCadastroClienteDto.cpf_cnpj := EdtCpfCnpj.Text;
    oCadastroClienteDto.celular := EdtCelular.Text;
    oCadastroClienteDto.observacao := edtObservacoes.Text;
    oCadastroClienteDto.idendereco := StrToInt(EdtEndereco.Text);
  end;
  if (oCadastroClienteRegra.Salvar(oCadastroClienteModel, oCadastroClienteDto)) then
    ShowMessage('Registro: ' + oCadastroClienteDto.Nome + ' Atualizado com sucesso')
  else
  begin
    ShowMessage('Registro: ' + oCadastroClienteDto.Nome + ' Inserido com sucesso');
  end;
end;



function TCadastroClienteController.ValidaCPF(aCpf: string): boolean;
begin
   oCadastroClienteRegra.ValidaCPF(oCadastroClienteDto.cpf_cnpj);
end;

function TCadastroClienteController.ValidarCNPJ(Acnpj: string): Boolean;
begin
  oCadastroClienteRegra.ValidarCNPJ(oCadastroClienteDto.cpf_cnpj);
end;

procedure TCadastroClienteController.VerificaCPF_CNPJ(Sender: TObject);
begin
  with (oFormulario as TCadastroClienteForm) do
   if (Length(EdtCpfCnpj.Text) <= 10) then
   begin
     ValidaCPF(EdtCpfCnpj.Text);
     ShowMessage('verificando CPF')
   end
   else
    begin
     ValidarCNPJ(EdtCpfCnpj.Text);
     ShowMessage('verificando CNPJ');
    end;

end;

end.

