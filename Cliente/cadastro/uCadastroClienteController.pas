unit uCadastroClienteController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroClienteDto, uClasseInterfaceViewBase,
  uCadastroClienteRegra, uCadastroClienteModel,
  uCadastroClienteForm, uInterfaceViewBase,
  uConsultaClienteForm, uConsultaClienteController,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto,
  uCadastroMunicipioModel, uCadastroMunicipioDto,
  uCadastroUfModel, uCadastroUfDto,
  uConsultaMunicipioController, uConsultaBairroController,
  uConsultaUfController;

type
  TCadastroClienteController = class(TClassInterfaceViewBase)
  private
    oCadastroClienteModel: TCadastroClienteModel;
    oCadastroClienteDto : TCadastroClienteDto;
    oCadastroClienteRegra: TCadastroClienteRegra;
    oCadastroUfDto : TCadastroUfDto;
    oCadastroUfModel : TCadastroUfModel;
    oCadastroMunicipioDto : TCadastroMunicipioDto;
    oCadastroBairroDto : TCadastroBairroDto;
    oCadastroEnderecoDto : TCadastroEnderecoDto;
    oCadastroBairroModel : TCadastroBairroModel;
    oCadastroMunicipioModel : TCadastroMunicipioModel;
    oCadastroEnderecoModel : TCadastroEnderecoModel;
    oForm : TCadastroClienteForm;


    procedure RetornoUf(aIdUf : Integer);
    procedure RetornoBairro(aIdBairro : Integer);
    procedure RetornoMunicipio(aIdMunicipio : Integer);
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
  if (not(assigned(oCadastroBairroModel))) then
    oCadastroBairroModel := TCadastroBairroModel.Create;

  if (not(assigned(oCadastroMunicipioDto))) then
    oCadastroMunicipioDto := TCadastroMunicipioDto.Create;

  if (not(assigned(oCadastroMunicipioModel))) then
    oCadastroMunicipioModel := TCadastroMunicipioModel.Create;

  if (not(assigned(oCadastroEnderecoDto))) then
    oCadastroEnderecoDto := TCadastroEnderecoDto.Create;

  if (not(assigned(oCadastroEnderecoModel))) then
    oCadastroEnderecoModel := TCadastroEnderecoModel.Create;

  if (not(assigned(oCadastroBairroDto))) then
    oCadastroBairroDto := TCadastroBairroDto.Create;

  if (not(assigned(oCadastroClienteModel))) then
    oCadastroClienteModel := TCadastroClienteModel.Create;

  if (not(assigned(oCadastroClienteDto))) then
    oCadastroClienteDto := TCadastroClienteDto.Create;

  if (not(assigned(oCadastroClienteRegra))) then
    oCadastroClienteRegra := TCadastroClienteRegra.Create;

  if (not(assigned(oCadastroUfDto))) then
    oCadastroUfDto := TCadastroUfDto.Create;

  if (not(assigned(oCadastroUfModel))) then
    oCadastroUfModel := TCadastroUfModel.Create;
end;

procedure TCadastroClienteController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroClienteForm.Create(Aowner);
  oFormulario.oController := oCadastroClienteController;
  oFormulario.Show;
  oForm :=(oFormulario as TCadastroClienteForm);
  oForm.EdtCpfCnpj.OnExit := VerificaCPF_CNPJ;
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
  if (assigned(oCadastroMunicipioDto)) then
    FreeAndNil(oCadastroMunicipioDto);

  if (assigned(oCadastroMunicipioModel)) then
    FreeAndNil(oCadastroMunicipioModel);

  if (assigned(oCadastroEnderecoDto)) then
    FreeAndNil(oCadastroEnderecoDto);

  if (assigned(oCadastroEnderecoModel)) then
    FreeAndNil(oCadastroEnderecoModel);

  if (assigned(oCadastroUfDto)) then
    FreeAndNil(oCadastroUfDto);

  if (assigned(oCadastroUfModel)) then
    FreeAndNil(oCadastroUfModel);

  if (assigned(oCadastroBairroModel)) then
    FreeAndNil(oCadastroBairroModel);

  if (assigned(oCadastroBairroDto)) then
    FreeAndNil(oCadastroBairroDto);

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
var
  sWhere : string;
begin
  inherited;

  if(ActiveControl =  oForm.edtEstado)then
  begin
    if (not(assigned(oConsultaUfController))) then
      oConsultaUfController := TConsultaUfController.Create;
    oConsultaUfController.CriarForm(Aowner, RetornoUf, oForm.edtCidade.Text);  end
  else
  if(ActiveControl =  oForm.edtCidade)then
  begin
    if (not(assigned(oConsultaMunicipioController))) then
      oConsultaMunicipioController := TConsultaMunicipioController.Create;
    oConsultaMunicipioController.CriarForm(Aowner, RetornoMunicipio, oForm.edtCidade.Text);  end
  else
  if(ActiveControl =  oForm.edtBairro)then
  begin
    if(oForm.edtCidade.Text <> '')then
    oCadastroMunicipioDto.Municipio := oForm.edtCidade.Text;
    if(oCadastroClienteRegra.SelectMunicipioPorDescricao(oCadastroMunicipioModel, oCadastroMunicipioDto))then
      sWhere := IntToStr(oCadastroMunicipioDto.id);
    if (not(assigned(oConsultaBairroController))) then
      oConsultaBairroController := TConsultaBairroController.Create;
    oConsultaBairroController.CriarForm(Aowner, RetornoBairro, oForm.edtBairro.Text, sWhere);
  end
  else
  begin
    oCadastroClienteDto.Nome   :=(oFormulario as TCadastroClienteForm).EdtNome.Text;
    if (not(assigned(oConsultaClienteController))) then
      oConsultaClienteController := TConsultaClienteController.Create;
    oConsultaClienteController.CriarForm(Aowner, RetornoCliente, oCadastroClienteDto.nome);
  end;
end;

procedure TCadastroClienteController.RetornoBairro(aIdBairro: Integer);
begin
  if(aIdBairro <> 0)then
  begin
    oCadastroBairroDto.IdBairro := aIdBairro;
    if(oCadastroClienteRegra.SelectBairroPorId(oCadastroBairroModel, oCadastroBairroDto))then
      oForm.edtBairro.Text := oCadastroBairroDto.Descricao;
      oForm.edtRua.SetFocus;
  end;
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

        oCadastroEnderecoDto.IdEndereco := oCadastroClienteDto.idendereco;
        if(oCadastroClienteRegra.SelectEndereco(oCadastroEnderecoModel, oCadastroEnderecoDto,
          oCadastroBairroModel, oCadastroBairroDto, oCadastroMunicipioModel, oCadastroMunicipioDto))then
        begin
          edtRua.Text := oCadastroEnderecoDto.Endereco;
          edtNum.Text := oCadastroEnderecoDto.Numero;
          edtBairro.Text := oCadastroBairroDto.Descricao;
          edtCidade.Text := oCadastroMunicipioDto.Municipio;
        end;
      end;
  end
  else;
end;

procedure TCadastroClienteController.RetornoUf(aIdUf: Integer);
begin
  if(aIdUf <> 0)then
  begin
  oCadastroUfDto.id := aIdUf;
    if(oCadastroClienteRegra.SelectUfPorId(oCadastroUfModel, oCadastroUfDto))then
      oForm.edtEstado.Text := oCadastroUfDto.nome;
    oForm.edtCidade.SetFocus;
  end;
end;

procedure TCadastroClienteController.RetornoMunicipio(aIdMunicipio: Integer);
begin
  if(aIdMunicipio<> 0)then
  begin
    oCadastroMunicipioDto.id := aIdMunicipio;
    if(oCadastroClienteRegra.SelectMunicipioPorId(oCadastroMunicipioModel, oCadastroMunicipioDto))then
      oForm.edtCidade.Text := oCadastroMunicipioDto.Municipio;
      oForm.edtBairro.SetFocus;
  end;
end;

procedure TCadastroClienteController.Salvar;
begin
  inherited;
  with (oFormulario as TCadastroClienteForm) do
  begin
    if(EdtCodigo.Text <> '')then
      oCadastroClienteDto.IdCliente := StrToInt(EdtCodigo.Text)
    else
      oCadastroClienteRegra.Novo(oCadastroClienteModel, oCadastroClienteDto);

    oCadastroClienteDto.Nome := EdtNome.Text;
    oCadastroClienteDto.telefone := EdtTelefone.Text;
    oCadastroClienteDto.cpf_cnpj := EdtCpfCnpj.Text;
    oCadastroClienteDto.celular := EdtCelular.Text;
    oCadastroClienteDto.observacao := edtObservacoes.Lines.Text;
  end;
  if(oCadastroClienteRegra.SalvarEndereco(oCadastroEnderecoModel, oCadastroEnderecoDto,
    oCadastroBairroModel, oCadastroBairroDto, oCadastroMunicipioModel, oCadastroMunicipioDto))then
  begin
    if (oCadastroClienteRegra.Salvar(oCadastroClienteModel, oCadastroClienteDto)) then
      ShowMessage('Registro: ' + oCadastroClienteDto.Nome + ' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: ' + oCadastroClienteDto.Nome + ' Inserido com sucesso');
    end;
  end;
end;



function TCadastroClienteController.ValidaCPF(aCpf: string): boolean;
begin

end;

function TCadastroClienteController.ValidarCNPJ(Acnpj: string): Boolean;
begin
  oCadastroClienteRegra.ValidarCNPJ(oCadastroClienteDto.cpf_cnpj);
end;

procedure TCadastroClienteController.VerificaCPF_CNPJ(Sender: TObject);
begin

  with (oFormulario as TCadastroClienteForm) do
  begin
    oCadastroClienteDto.cpf_cnpj :=EdtCpfCnpj.Text ;
    if (Length(EdtCpfCnpj.Text) <= 11) then
    begin
      if(not(oCadastroClienteRegra.ValidaCPF(oCadastroClienteDto.cpf_cnpj)))then
        raise Exception.Create('Insira um CPF válido');
    end
    else
    begin
      if(not(oCadastroClienteRegra.ValidarCNPJ(oCadastroClienteDto.cpf_cnpj)))then
        raise Exception.Create('Insira um CNPJ válido');
    end;
  end;

end;

end.

