unit uCadastroPedidoController;

interface

uses
  Vcl.Dialogs, Vcl.Controls, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.UITypes,
  System.classes, System.SysUtils,
  uCadastroPedidoDto, uClasseInterfaceViewBase,
  uCadastroPedidoRegra, uCadastroPedidoModel,
  uCadastroPedidoForm, uInterfaceViewBase,
  uConsultaPedidoForm, uConsultaPedidoController,
  uCadastroClienteModel, uCadastroClienteDto,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto,
  uCadastroMunicipioModel, uCadastroMunicipioDto,
  uConsultaClienteController, uConsultaClienteForm;

type
  TCadastroPedidoController = class(TClassInterfaceViewBase)
  private
    oCadastroEnderecoDto    : TCadastroEnderecoDto;
    oCadastroEnderecoModel  : TCadastroEnderecoModel;
    oCadastroClienteModel   : TCadastroClienteModel;
    oCadastroClienteDto     : TCadastroClienteDto;
    oCadastroBairroModel    : TCadastroBairroModel;
    oCadastroBairroDto      : TCadastroBairroDto;
    oCadastroMunicipioModel : TCadastroMunicipioModel;
    oCadastroMunicipioDto   : TCadastroMunicipioDto;

    oCadastroPedidoRegra    : TCadastroPedidoRegra;
    oCadastroPedidoModel    : TCadastroPedidoModel;
    oCadastroPedidoDto      : TCadastroPedidoDto;
    procedure RetornoPedido(aIdPedido : Integer);
    procedure RetornoCliente(aIdCliente : Integer);
  public
    procedure Excluir; override;
    procedure Aguardando; override;
    procedure Inicial; override;
    procedure AlterarEndereco(Sender : Tobject);
    procedure Pesquisar(Aowner : TComponent; ActiveControl : TWinControl); override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroPedidoController: IInterfaceViewBase;

implementation


{ TControllerCadastroPedido }

procedure TCadastroPedidoController.Aguardando;
begin
  inherited;

end;

procedure TCadastroPedidoController.AlterarEndereco(Sender : Tobject);
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    if (chkAltEnd.Checked) then
    begin
      edtNmr.Tag := 0;
      edtRua.Tag := 0;
      edtCidade.Tag := 0;
      edtBairro.Tag := 0;
      gpEntrega.Enabled := True
    end
    else
    begin
      edtNmr.Tag := 888;
      edtRua.Tag := 888;
      edtCidade.Tag := 888;
      edtBairro.Tag := 888;
      gpEntrega.Enabled := False;
    end;
  end;
end;

constructor TCadastroPedidoController.Create;
begin
  if (not(assigned(oCadastroClienteDto))) then
    oCadastroClienteDto := TCadastroClienteDto.Create;

  if (not(assigned(oCadastroClienteModel))) then
    oCadastroClienteModel := TCadastroClienteModel.Create;

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

  if (not(assigned(oCadastroPedidoModel))) then
    oCadastroPedidoModel := TCadastroPedidoModel.Create;

  if (not(assigned(oCadastroPedidoDto))) then
    oCadastroPedidoDto := TCadastroPedidoDto.Create;

  if (not(assigned(oCadastroPedidoRegra))) then
    oCadastroPedidoRegra := TCadastroPedidoRegra.Create;
end;


procedure TCadastroPedidoController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroPedidoForm.Create(Aowner);
  oFormulario.oController := oCadastroPedidoController;
  oFormulario.Show;
  with (oFormulario as TCadastroPedidoForm) do
  begin
    dteData.Date := Now;
    dtePrev.Date := Now;
    chkAltEnd.OnClick := AlterarEndereco;
  end;
  inherited;
end;

destructor TCadastroPedidoController.Destroy;
begin
  if (assigned(oCadastroMunicipioDto)) then
    FreeAndNil(oCadastroMunicipioDto);

  if (assigned(oCadastroMunicipioModel)) then
    FreeAndNil(oCadastroMunicipioModel);

  if (assigned(oCadastroEnderecoDto)) then
    FreeAndNil(oCadastroEnderecoDto);

  if (assigned(oCadastroEnderecoModel)) then
    FreeAndNil(oCadastroEnderecoModel);

  if (assigned(oCadastroBairroModel)) then
    FreeAndNil(oCadastroBairroModel);

  if (assigned(oCadastroBairroDto)) then
    FreeAndNil(oCadastroBairroDto);

  if (assigned(oCadastroClienteDto)) then
    FreeAndNil(oCadastroClienteDto);

  if (assigned(oCadastroClienteModel)) then
    FreeAndNil(oCadastroClienteModel);

  if (assigned(oCadastroPedidoModel)) then
    FreeAndNil(oCadastroPedidoModel);

  if (assigned(oCadastroPedidoDto)) then
    FreeAndNil(oCadastroPedidoDto);

  if (assigned(oCadastroPedidoRegra)) then
    FreeAndNil(oCadastroPedidoRegra);
    inherited;
end;


procedure TCadastroPedidoController.Excluir;
begin
  inherited;
  if(oCadastroPedidoRegra.Deletar(oCadastroPedidoModel, oCadastroPedidoDto.IdPedido))then
        raise Exception.Create('Falha ao excluir registro');
end;

procedure TCadastroPedidoController.Inicial;
begin
  inherited;
  (oFormulario as TCadastroPedidoForm).chkAltEnd.Checked := False;
  (oFormulario as TCadastroPedidoForm).dteData.Date := Now;
  (oFormulario as TCadastroPedidoForm).dtePrev.Date := Now;
end;

procedure TCadastroPedidoController.Novo;
begin
  inherited;
  (oFormulario as TCadastroPedidoForm).chkAltEnd.Caption := 'Adicionar Endereço';
  NovoID;
end;

procedure TCadastroPedidoController.NovoID;
begin
 if(oCadastroPedidoRegra.Novo(oCadastroPedidoModel, oCadastroPedidoDto))then
  (oFormulario as TCadastroPedidoForm).edtCodigo.Text := IntToStr(oCadastroPedidoDto.IdPedido);
end;

procedure TCadastroPedidoController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
begin
  inherited;
  with  (oFormulario as TCadastroPedidoForm) do
  begin
    if((oFormulario as TCadastroPedidoForm).edtCodigo.Text <> '')then
      oCadastroPedidoDto.IdPedido := StrToInt((oFormulario as TCadastroPedidoForm).edtCodigo.Text);
  end;
  if(ActiveControl =  (oFormulario as TCadastroPedidoForm).edtCpfCnpj)then
  begin
    if (not(assigned(oConsultaClienteController))) then
      oConsultaClienteController := TConsultaClienteController.Create;
    oConsultaClienteController.CriarForm(Aowner, RetornoCliente, '');
  end
  else
  begin
    if (not(assigned(oConsultaPedidoController))) then
      oConsultaPedidoController := TConsultaPedidoController.Create;
    oConsultaPedidoController.CriarForm(Aowner, RetornoPedido, '');
  end;

end;


procedure TCadastroPedidoController.RetornoCliente(aIdCliente: Integer);
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    if(aIdCliente <> 0)then
    begin
      oCadastroClienteDto.IdCliente := aIdCliente;
      if(oCadastroPedidoRegra.SelectCliente(oCadastroClienteModel, oCadastroClienteDto))then
      begin
        edtNmClient.Text :=   IntToStr(oCadastroClienteDto.IdCliente);
        edtCpfCnpj.Text    :=  CurrToStr(oCadastroClienteDto.cpf_cnpj);
      end;
    end
    else
    begin
      Aguardando;
      raise Exception.Create('Não foi escolhido registro');
    end;
  end;
end;

procedure TCadastroPedidoController.RetornoPedido(aIdPedido: Integer);
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    if(aIdPedido <> 0)then
    begin
      oCadastroPedidoDto.IdPedido :=  aIdPedido;
      if(oCadastroPedidoRegra.SelectPedido(oCadastroPedidoModel, oCadastroPedidoDto,
      oCadastroClienteModel, oCadastroClienteDto))then
      begin
        Show;
        edtCodigo.Text        :=   IntToStr(oCadastroPedidoDto.IdPedido);
        edtNomeVendedor.Text  :=  oCadastroPedidoDto.nomevendedor;
        edtObservacoes.Text   := oCadastroPedidoDto.observacao;
        dtePrev.Date := oCadastroPedidoDto.dataentrega;
        dteData.Date := oCadastroPedidoDto.data;
        edtValorTotal.Text := CurrToStr(oCadastroPedidoDto.valortotal);
        edtReceptor.Text := oCadastroPedidoDto.nomereceptor;
        edtNomeClienteEx.Text :=  oCadastroClienteDto.Nome;
        edtNmClient.Text := IntToStr(oCadastroClienteDto.IdCliente);
        edtCpfCnpj.Text := CurrToStr(oCadastroClienteDto.cpf_cnpj);

        if(oCadastroPedidoDto.idendereco <= 0)then
        begin
          if (MessageDlg('Não foi encontrado um endereço de entrega para esse pedido'+ #13
          + 'Deseja preencher com o endereço do cliente ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          begin
            oCadastroEnderecoDto.IdEndereco := oCadastroClienteDto.idendereco;
            chkAltEnd.Checked := True;
          end
          else
          begin
            edtNmr.Text  := '';
            edtRua.Text    := '';
            edtCidade.Text := '';
            edtBairro.Text := '';
            chkAltEnd.Caption := 'Adicionar Endereço';
            exit
          end;
        end
        else
          oCadastroEnderecoDto.IdEndereco := oCadastroPedidoDto.idendereco;

        if(oCadastroPedidoRegra.SelectEndereco(oCadastroEnderecoModel,
        oCadastroEnderecoDto, oCadastroBairroModel, oCadastroBairroDto,
        oCadastroMunicipioModel, oCadastroMunicipioDto))then
        begin
          chkAltEnd.Caption := 'Alterar Endereço';
          edtNmr.Text :=  oCadastroEnderecoDto.Numero;
          edtRua.Text :=  oCadastroEnderecoDto.Endereco;
          edtCidade.Text := oCadastroMunicipioDto.Descricao;
          edtBairro.Text := oCadastroBairroDto.Descricao;
        end;
      end;
    end
    else
    begin
      if(edtCodigo.Text = '')then
      begin
        Inicial;
        raise Exception.Create('Não foi escolhido registro');
      end;
    end;
  end;
end;

procedure TCadastroPedidoController.Salvar;
var
  sInpBox : string;
begin
  inherited;
  sInpBox := InputBox('Usuário', 'Insira seu usuário', '');
  if(not(sInpBox <> ''))then
    exit
  else
    oCadastroPedidoDto.usuario := sInpBox;
  with (oFormulario as TCadastroPedidoForm) do
  begin
    oCadastroPedidoDto.IdPedido     := StrToInt(edtCodigo.Text);
    oCadastroPedidoDto.nomevendedor := edtNomeVendedor.Text;
    oCadastroPedidoDto.observacao   := edtObservacoes.Text;
    oCadastroPedidoDto.dataentrega  := dtePrev.Date;
    oCadastroPedidoDto.data         := dteData.Date;

    oCadastroPedidoDto.valortotal   := StrToCurr(edtValorTotal.Text);
    oCadastroPedidoDto.idcliente    := StrToInt(edtNmClient.Text);
    oCadastroPedidoDto.nomereceptor := edtReceptor.Text;

    if(chkAltEnd.Checked)then
    begin
        oCadastroEnderecoDto.Endereco := edtRua.Text;
        oCadastroEnderecoDto.Numero := edtNmr.Text;
        oCadastroBairroDto.Descricao := edtBairro.Text;
        oCadastroEnderecoDto.status := 2;
        oCadastroMunicipioDto.Descricao := edtCidade.Text;
        oCadastroEnderecoDto.IdEndereco := oCadastroPedidoDto.idendereco;
        if (not(oCadastroPedidoRegra.SalvarEndereco(oCadastroEnderecoModel,
        oCadastroEnderecoDto, oCadastroBairroModel, oCadastroBairroDto,
        oCadastroMunicipioModel, oCadastroMunicipioDto)))then
          raise Exception.Create('Falha ao salvar o endereço');
    end;
  end;
  if(oCadastroPedidoRegra.Salvar(oCadastroPedidoModel, oCadastroPedidoDto,
                                 oCadastroClienteModel, oCadastroClienteDto))then
    ShowMessage('Registro: '+ IntToStr(oCadastroPedidoDto.IdPedido) +' Atualizado com sucesso')
  else
  begin
    ShowMessage('Registro: '+ IntToStr(oCadastroPedidoDto.IdPedido) +' Inserido com sucesso');
  end;
end;




end.
