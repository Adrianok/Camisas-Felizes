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
  uConsultaClienteController, uCadastroTamanhoDto,
  uCadastroTamanhoModel,
  System.Generics.Collections, uCadastroItensDto,
  uListaDetalheItem, uCadastroDetalheItemDto,
  uConsultaTamanhoController, uCadastroCorDto,
  uCadastroCorModel, uConsultaCorController,
  uConsultaModeloController, uCadastroModeloModel,
  uCadastroModeloDto;

type
  TCadastroPedidoController = class(TClassInterfaceViewBase)
  private
    oCadastroEnderecoDto      : TCadastroEnderecoDto;
    oCadastroEnderecoModel    : TCadastroEnderecoModel;
    oCadastroClienteModel     : TCadastroClienteModel;
    oCadastroClienteDto       : TCadastroClienteDto;
    oCadastroBairroModel      : TCadastroBairroModel;
    oCadastroBairroDto        : TCadastroBairroDto;
    oCadastroMunicipioModel   : TCadastroMunicipioModel;
    oCadastroMunicipioDto     : TCadastroMunicipioDto;

    oCadastroTamanhoModel     : TCadastroTamanhoModel;
    oCadastroTamanhoDto       : TCadastroTamanhoDto;
    oCadastroDetalheItensDto  : TCadastroDetalheItemDto;
    oCadastroItensDto         : TCadastroItensDto;
    oCadastroPedidoRegra      : TCadastroPedidoRegra;
    oCadastroPedidoModel      : TCadastroPedidoModel;
    oCadastroPedidoDto        : TCadastroPedidoDto;
    oForm                     : TCadastroPedidoForm;
    oListaDetalheItem         : TListaDetalheItem;
    oCadastroCorDto           : TCadastroCorDto;
    oCadastroCorModel         : TCadastroCorModel;
    oCadastroModeloDto        : TCadastroModeloDto;
    oCadastroModeloModel      : TCadastroModeloModel;

    procedure RetornoModelo(aIdModelo : Integer);
    procedure RetornoCor(aIdCor : Integer);
    procedure RetornoTamanho(aIdTamanho : Integer);
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
    procedure AdicionarItem(Sender : TObject);
    procedure AdicionarDetalhe(Sender : TObject);
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroPedidoController: IInterfaceViewBase;

implementation


procedure TCadastroPedidoController.AdicionarDetalhe(Sender : Tobject);
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    try
      if(not(Assigned(oCadastroDetalheItensDto)))then
        oListaDetalheItem := TListaDetalheItem.Create([doOwnsValues]);
      oCadastroDetalheItensDto := TCadastroDetalheItemDto.Create;
      oCadastroTamanhoDto.Descricao := edtTamanho.Text;
      if(oCadastroPedidoRegra.SelectTamanhoPorDescricao(oCadastroTamanhoModel, oCadastroTamanhoDto))then
        oCadastroDetalheItensDto.idtamanho := oCadastroTamanhoDto.IdTamanho;
      oCadastroCorDto.Descricao := edtCor.Text;
      if(oCadastroPedidoRegra.SelectCorPorDescricao(oCadastroCorModel, oCadastroCorDto))then
        oCadastroDetalheItensDto.idcor := oCadastroCorDto.IdCor;
      oCadastroDetalheItensDto.quantidade := StrToInt(edtQntTam.Text);
      oListaDetalheItem.Add(oCadastroDetalheItensDto.idtamanho, oCadastroDetalheItensDto);
    finally
      if(assigned(oCadastroDetalheItensDto))then
        FreeAndNil(oCadastroDetalheItensDto);

    end;
  end;
end;

procedure TCadastroPedidoController.AdicionarItem(Sender : TObject);
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    oCadastroItensDto.Create;
    oCadastroItensDto.IdItensPedido := StrToInt(edtCdItensPedido.Text);
    oCadastroItensDto.valorItem := StrToCurr(edtPrecoItem.Text);
    oCadastroItensDto.quantidade := StrToInt(edtQntItem.Text);
    oCadastroPedidoDto.ItensPedido.Items[StrToInt(edtCdItensPedido.Text)].DetalheItem:= oListaDetalheItem;
//    for oCadastroDetalheItensDto in oListaDetalheItem.Values do
//    begin
//    end;

    oCadastroPedidoDto.ItensPedido.Add(oCadastroItensDto.IdItensPedido, oCadastroItensDto);
  end;
end;

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
  if (not(assigned(oCadastroModeloDto))) then
    oCadastroModeloDto := TCadastroModeloDto.Create;

  if (not(assigned(oCadastroModeloModel))) then
    oCadastroModeloModel := TCadastroModeloModel.Create;

  if (not(assigned(oCadastroCorDto))) then
    oCadastroCorDto := TCadastroCorDto.Create;

  if (not(assigned(oCadastroCorModel))) then
    oCadastroCorModel := TCadastroCorModel.Create;

  if (not(assigned(oCadastroTamanhoDto))) then
    oCadastroTamanhoDto := TCadastroTamanhoDto.Create;

  if (not(assigned(oCadastroTamanhoModel))) then
    oCadastroTamanhoModel := TCadastroTamanhoModel.Create;

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
  oForm := (oFormulario as TCadastroPedidoForm);
  oFormulario.Show;
  with (oFormulario as TCadastroPedidoForm) do
  begin
    dteData.Date := Now;
    dtePrev.Date := Now;
    chkAltEnd.OnClick := AlterarEndereco;
    btnAddItem.OnClick  := AdicionarItem;
    BitBtn1.OnClick  := AdicionarDetalhe;
  end;
  inherited;
end;

destructor TCadastroPedidoController.Destroy;
 begin
   if (assigned(oCadastroModeloModel)) then
    FreeAndNil(oCadastroModeloModel);

  if (assigned(oCadastroModeloDto)) then
    FreeAndNil(oCadastroModeloDto);

  if (assigned(oCadastroTamanhoModel)) then
    FreeAndNil(oCadastroTamanhoModel);

  if (assigned(oCadastroTamanhoDto)) then
    FreeAndNil(oCadastroTamanhoDto);

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

  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

  if (assigned(oCadastroDetalheItensDto)) then
    FreeAndNil(oCadastroDetalheItensDto);

  if (assigned(oCadastroItensDto)) then
    FreeAndNil(oCadastroItensDto);
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
var
  sWhere: string;
begin
  inherited;
  if(ActiveControl =  oForm.edtCor)then
  begin
    sWhere := oForm.edtCdItensPedido.Text;
    if (not(assigned(oConsultaCorController))) then
      oConsultaCorController := TConsultaCorController.Create;
    oConsultaCorController.CriarForm(Aowner, RetornoCor, oForm.edtCor.Text, sWhere);
  end
  else
  if(ActiveControl =  oForm.edtCpfCnpj)then
  begin
    if (not(assigned(oConsultaClienteController))) then
      oConsultaClienteController := TConsultaClienteController.Create;
    oConsultaClienteController.CriarForm(Aowner, RetornoCliente, oForm.edtNomeClienteEx.Text);
  end
  else
  if(ActiveControl =  oForm.edtTamanho)then
  begin
    if (not(assigned(oConsultaTamanhoController))) then
      oConsultaTamanhoController := TConsultaTamanhoController.Create;
    oConsultaTamanhoController.CriarForm(Aowner, RetornoTamanho, oForm.edtTamanho.Text);
  end
  else
  if(ActiveControl =  oForm.edtCdItensPedido) or (ActiveControl =  oForm.edtModelo)then
  begin
    if (not(assigned(oConsultaModeloController))) then
      oConsultaModeloController := TConsultaModeloController.Create;
    oConsultaModeloController.CriarForm(Aowner, RetornoModelo, oForm.edtModelo.Text);
  end
  else
  begin
   if (not(assigned(oConsultaPedidoController))) then
      oConsultaPedidoController := TConsultaPedidoController.Create;
    oConsultaPedidoController.CriarForm(Aowner, RetornoPedido, oForm.edtCodigo.Text, sWhere);
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
    end;
  end;
end;

procedure TCadastroPedidoController.RetornoCor(aIdCor: Integer);
begin
  if(aIdCor <> 0)then
  begin
    oCadastroCorDto.IdCor := aIdCor;
    if(oCadastroPedidoRegra.SelectCorPorId(oCadastroCorModel, oCadastroCorDto))then
      oForm.edtCor.Text := oCadastroCorDto.Descricao;
  end;
end;

procedure TCadastroPedidoController.RetornoModelo(aIdModelo: Integer);
begin
  if(aIdModelo <> 0)then
  begin
    oCadastroModeloDto.IdModelo := aIdModelo;
    if(oCadastroPedidoRegra.SelectModeloPorId(oCadastroModeloModel, oCadastroModeloDto))then
    begin
      oForm.edtModelo.Text := oCadastroModeloDto.Descricao;
      oForm.edtCdItensPedido.Text := IntToStr(oCadastroModeloDto.IdModelo);
    end;
  end;
end;

procedure TCadastroPedidoController.RetornoTamanho(aIdTamanho: Integer);
begin
  if(aIdTamanho <> 0)then
  begin
    oCadastroTamanhoDto.IdTamanho := aIdTamanho;
    if(oCadastroPedidoRegra.SelectCorPorId(oCadastroCorModel, oCadastroCorDto))then
      oForm.edtTamanho.Text := oCadastroTamanhoDto.Descricao;
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
