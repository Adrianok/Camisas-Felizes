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
  uCadastroTamanhoModel, uCadastroItensPedidoModel,
  System.Generics.Collections, uCadastroItensDto,
  uListaDetalheItem, uCadastroDetalheItemDto,
  uConsultaTamanhoController, uCadastroCorDto,
  uCadastroCorModel, uConsultaCorController,
  uConsultaModeloController, uCadastroModeloModel,
  uCadastroModeloDto, uCadastroDetalhesItensModel,
  uListaItens, uConsultaBairroController,
  uConsultaMunicipioController;

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


    oCadastroDetalhesItensModel : TCadastroDetalheItensModel;
    oCadastroTamanhoModel     : TCadastroTamanhoModel;
    oCadastroTamanhoDto       : TCadastroTamanhoDto;
    oCadastroDetalheItensDto  : TCadastroDetalheItemDto;
    oCadastroItensPedidoModel : TCadastroItensPedidoModel;
    oCadastroItensDto         : TCadastroItensDto;
    oCadastroPedidoRegra      : TCadastroPedidoRegra;
    oCadastroPedidoModel      : TCadastroPedidoModel;
    oCadastroPedidoDto        : TCadastroPedidoDto;
    oForm                     : TCadastroPedidoForm;
    bPermite                  : Boolean;
    oListaDetalheItem         : TListaDetalheItem;
    oCadastroDetalheItem      : TCadastroDetalheItemDto;
    oCadastroCorDto           : TCadastroCorDto;
    oCadastroCorModel         : TCadastroCorModel;
    oCadastroModeloDto        : TCadastroModeloDto;
    oCadastroModeloModel      : TCadastroModeloModel;
    idDetalheItens            : integer;
    idItens                   : integer;
    CampoAtivo                : TWinControl;

    procedure RetornoBairro(aIdBairro : Integer);
    procedure RetornoMunicipio(aIdMunicipio : Integer);
    procedure RetornoModelo(aIdModelo : Integer);
    procedure RetornoCor(aIdCor : Integer);
    procedure RetornoTamanho(aIdTamanho : Integer);
    procedure RetornoPedido(aIdPedido : Integer);
    procedure RetornoCliente(aIdCliente : Integer);
  public
    procedure Excluir; override;
    procedure TAllowChange(Sender: TObject;var AllowChange : boolean);
    procedure Aguardando; override;
    procedure Inicial; override;
    procedure ChlAdd(bEscolha : boolean);
    procedure ExibirChlCampos(Sender: TObject);
    procedure ExibirChl(Sender: TObject);
    procedure Verificar (ActiveControl : TWinControl); override;
    procedure AlterarEndereco(Sender : Tobject);
    procedure Pesquisar(Aowner : TComponent; ActiveControl : TWinControl); override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure AdicionarItem(Sender : TObject);
    procedure AdicionarDetalhe;
    procedure Salvar; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCadastroPedidoController: IInterfaceViewBase;

implementation


procedure TCadastroPedidoController.AdicionarDetalhe;
var
  oLoopControlDetalhe : TCadastroDetalheItemDto;
  MaiorId : integer;
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    if(not(assigned(oListaDetalheItem)))then
      oListaDetalheItem := TListaDetalheItem.Create([doOwnsValues]);
    oCadastroDetalheItensDto := TCadastroDetalheItemDto.Create;

    oCadastroTamanhoDto.Descricao := edtTamanho.Text;
    if(oCadastroPedidoRegra.SelectTamanhoPorDescricao(oCadastroTamanhoModel, oCadastroTamanhoDto))then
      oCadastroDetalheItensDto.idtamanho := oCadastroTamanhoDto.IdTamanho;

    oCadastroCorDto.Descricao := edtCor.Text;
    if(oCadastroPedidoRegra.SelectCorPorDescricao(oCadastroCorModel, oCadastroCorDto))then
      oCadastroDetalheItensDto.idcor := oCadastroCorDto.IdCor;

    oCadastroDetalheItensDto.quantidade := StrToInt(edtQntTam.Text);
    edtQntItm.Text  := IntToStr(StrToIntDef(edtQntItm.Text, 0) + oCadastroDetalheItensDto.quantidade);
    oListaDetalheItem.Add(oCadastroDetalheItensDto.idtamanho, oCadastroDetalheItensDto);
    ChlAdd(False);
    edtTamanho.Clear;
    edtCor.Clear;
    edtQntTam.Clear;
    edtTamanho.SetFocus;
    abort;
  end;
end;

procedure TCadastroPedidoController.AdicionarItem(Sender : TObject);
var
  oLoopControlItens : TCadastroItensDto;
  oLoopControlDetalhe : TCadastroDetalheItemDto;
  MaiorId : integer;
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    if(edtCdItensPedido.Text = '') or (edtModelo.Text = '')then
      Verificar(edtModelo);

    if((edtQntTam.Text <> '') and (edtTamanho.Text <> '') and (edtCor.Text <> ''))then
      AdicionarDetalhe;

    if((edtPrecoItem.Text = '') and (edtModelo.Text = '') and (edtQntItm.Text = ''))then
      exit;


    oCadastroItensDto := TCadastroItensDto.Create;

    oCadastroItensDto.valorItem := StrToCurr(edtPrecoItem.Text);
    oCadastroItensDto.quantidade := StrToIntDef(edtQntItm.Text, 0);
    edtQntTot.Text  := IntToStr(StrToIntDef(edtQntTot.Text, 0) + StrToIntDef(edtQntItm.Text, 0));

    oCadastroModeloDto.Descricao := edtModelo.Text;
    if(oCadastroPedidoRegra.SelectModeloPorDescricao(oCadastroModeloModel, oCadastroModeloDto))then
      oCadastroItensDto.idmodelo := oCadastroModeloDto.IdModelo;

    if(not(oListaDetalheItem.Count > 0))then
    begin
      oCadastroItensDto.IdItensPedido := oCadastroItensDto.IdItensPedido -1;
      raise Exception.Create('Você não selecionou nenhum tamanho e cor para o Modelo');
    end;

    for oLoopControlDetalhe in oListaDetalheItem.Values do
    begin
      oCadastroDetalheItem := TCadastroDetalheItemDto.Create;
      oCadastroDetalheItem.idtamanho := oLoopControlDetalhe.idtamanho;
      oCadastroDetalheItem.idcor := oLoopControlDetalhe.idcor;
      oCadastroDetalheItem.quantidade := oLoopControlDetalhe.quantidade;

      oCadastroItensDto.DetalheItem.Add(oLoopControlDetalhe.idtamanho, oCadastroDetalheItem);
    end;

    oCadastroPedidoDto.ItensPedido.Add(oCadastroItensDto.idmodelo, oCadastroItensDto);

    ChlAdd(True);
    edtCdItensPedido.Clear;
    edtValorTotal.Text := CurrToStr(StrToCurrDef(edtValorTotal.Text, 0) + (oCadastroItensDto.valorItem) * (oCadastroItensDto.quantidade));
    edtQntItm.Clear;
    edtModelo.Clear;
    edtModelo.SetFocus;
    edtPrecoItem.Clear;
    edtModelo.SetFocus;
    oForm.btnSalvar.Enabled := True;
  end;
  if(assigned(oListaDetalheItem))then
    Freeandnil(oListaDetalheItem);

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
      gpEndereco.Enabled := True
    end
    else
    begin
      edtNmr.Tag := 888;
      edtRua.Tag := 888;
      edtCidade.Tag := 888;
      edtBairro.Tag := 888;
      gpEndereco.Enabled := False;
    end;
  end;

end;

procedure TCadastroPedidoController.ChlAdd(bEscolha: boolean);
var
  iIndice : integer;
  bAux    : boolean;
begin
  if(bEscolha)then
  begin
    bAux := False;
    for iIndice := 0 to oForm.chlItens.Count -1 do
    begin
      if(integer(oForm.chlItens.Items.Objects[iIndice]) =  oCadastroItensDto.idmodelo)then
        bAux := True;
      if(oForm.chlItens.Checked[iIndice])then
        oForm.chlItens.Checked[iIndice] := False;
      oForm.chlDetalheItem.Clear;
    end;
    if(not(bAux))then
    begin
      oForm.chlItens.AddItem(oCadastroModeloDto.Descricao, TObject(oCadastroItensDto.idmodelo));
    end;
     end
  else
  begin
    oForm.chlDetalheItem.AddItem(oCadastroTamanhoDto.Descricao + ' - ' + oCadastroCorDto.Descricao, TObject(oCadastroDetalheItensDto.idtamanho));
  end;
end;


constructor TCadastroPedidoController.Create;
begin
  if (not(assigned(oCadastroDetalhesItensModel))) then
    oCadastroDetalhesItensModel := TCadastroDetalheItensModel.Create;

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

  if (not(assigned(oCadastroItensPedidoModel))) then
    oCadastroItensPedidoModel := TCadastroItensPedidoModel.Create;

  if (not(assigned(oCadastroItensDto))) then
    oCadastroItensDto := TCadastroItensDto.Create;

  if (not(assigned(oCadastroDetalheItensDto))) then
    oCadastroDetalheItensDto := TCadastroDetalheItemDto.Create;
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
    oForm.pgpedido.ActivePage := pgCabecalho;
    oForm.edtCodigo.SetFocus;
    oForm.pgpedido.OnChanging := TAllowChange;
    bPermite := False;
    chlItens.OnClickCheck := ExibirChl;
    chlDetalheItem.OnClickCheck := ExibirChlCampos
  end;
  inherited;
end;

destructor TCadastroPedidoController.Destroy;
 begin
   if (assigned(oCadastroDetalhesItensModel)) then
    FreeAndNil(oCadastroDetalhesItensModel);

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

  if (assigned(oCadastroPedidoRegra)) then
    FreeAndNil(oCadastroPedidoRegra);

  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroCorDto)) then
    FreeAndNil(oCadastroCorDto);

   if (assigned(oCadastroItensPedidoModel)) then
    FreeAndNil(oCadastroItensPedidoModel);

   if (assigned(oCadastroItensDto)) then
    FreeAndNil(oCadastroItensDto);

   if(assigned(oCadastroDetalheItensDto))then
    FreeAndNil(oCadastroDetalheItensDto);

   if(assigned(oCadastroPedidoDto)) then
    FreeAndNil(oCadastroPedidoDto);
    inherited;
end;


procedure TCadastroPedidoController.Excluir;
begin
  inherited;
  if(oCadastroPedidoRegra.Deletar(oCadastroPedidoModel, oCadastroPedidoDto, oCadastroItensPedidoModel, oCadastroDetalhesItensModel))then
        raise Exception.Create('Falha ao excluir registro')
  else
  begin
    oForm.chlDetalheItem.Clear;
    oForm.chlItens.Clear;
    oCadastroPedidoDto.CleanupInstance;
  end;
end;

procedure TCadastroPedidoController.ExibirChl(Sender: TObject);
var
  iIndice, iIdItem : integer;
  oLoopControlDetalhe : TCadastroDetalheItemDto;
  oLoopControlItens   : TCadastroItensDto;
begin
  iIdItem := 0;
  for iIndice := 0 to oForm.chlItens.Items.Count  - 1 do
    if(oForm.chlItens.Checked[iIndice])then
      if(oForm.chlItens.Selected[iIndice])then
        iIdItem := integer(oForm.chlItens.Items.Objects[iIndice]);

  oForm.chlDetalheItem.Clear;
  if(iIdItem = 0)then
    Exit;

  for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values do
  begin
    if(oLoopControlItens.IdItensPedido = iIdItem)then
    begin
      if(assigned(oLoopControlItens.DetalheItem))then
      begin
        if(oLoopControlItens.DetalheItem.Count > 0)then
        begin
          for oLoopControlDetalhe in oLoopControlItens.DetalheItem.Values do
          begin
            oCadastroTamanhoDto.IdTamanho := oLoopControlDetalhe.idtamanho;
            oCadastroPedidoRegra.SelectTamanhoPorId(oCadastroTamanhoModel, oCadastroTamanhoDto);
            oCadastroCorDto.IdCor := oLoopControlDetalhe.idcor;
            oCadastroPedidoRegra.SelectCorPorId(oCadastroCorModel, oCadastroCorDto);
            oForm.chlDetalheItem.AddItem(oCadastroTamanhoDto.Descricao + ' - ' + oCadastroCorDto.Descricao, TObject(oLoopControlDetalhe.IdDetalhe));
          end;
        end;
      end;
    end;
  end;
end;

procedure TCadastroPedidoController.ExibirChlCampos(Sender: TObject);
var
  oLoopControlItens   : TCadastroItensDto;
  oLoopControlDetalhe : TCadastroDetalheItemDto;
  iIndice, iIdItem    : integer;
begin
  for iIndice := 0 to oForm.chlDetalheItem.Count -1 do
    if(oForm.chlDetalheItem.Selected[iIndice])then
      iIdItem := integer(oForm.chlItens.Items.Objects[iIndice]);

  for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values  do
    if(oLoopControlItens.IdItensPedido = iIdItem)then
    begin
      oLoopControlItens.idmodelo := oLoopControlItens.idmodelo;
      if(oCadastroPedidoRegra.SelectModeloPorId(oCadastroModeloModel, oCadastroModeloDto))then
        oForm.edtModelo.Text := oCadastroModeloDto.Descricao;
      oForm.edtPrecoItem.Text := CurrToStr(oCadastroModeloDto.Preco);
      oForm.edtQntItm.Text := IntToStr(oLoopControlItens.quantidade);
    end;

  for oLoopControlDetalhe in oCadastroPedidoDto.ItensPedido.Items[iIdItem].DetalheItem.Values do
  begin
    oCadastroTamanhoDto.IdTamanho := oLoopControlDetalhe.idtamanho;
    if(oCadastroPedidoRegra.SelectTamanhoPorId(oCadastroTamanhoModel, oCadastroTamanhoDto))then
      oForm.edtTamanho.Text := oCadastroTamanhoDto.Descricao;

    oCadastroCorDto.IdCor := oLoopControlDetalhe.idcor;
    if(oCadastroPedidoRegra.SelectCorPorId(oCadastroCorModel, oCadastroCorDto))then
      oForm.edtCor.Text := oCadastroCorDto.Descricao;

    oForm.edtQntTam.Text := IntToStr(oLoopControlDetalhe.quantidade);
  end;
end;

procedure TCadastroPedidoController.Inicial;
begin
  inherited;
  oForm.chkAltEnd.Checked := False;
  oForm.dteData.Date := Now;
  oForm.dtePrev.Date := Now;
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
    if(oCadastroPedidoRegra.SelectMunicipioPorDescricao(oCadastroMunicipioModel, oCadastroMunicipioDto))then
      sWhere := IntToStr(oCadastroMunicipioDto.id);
    if (not(assigned(oConsultaBairroController))) then
      oConsultaBairroController := TConsultaBairroController.Create;
    oConsultaBairroController.CriarForm(Aowner, RetornoBairro, oForm.edtCor.Text, sWhere);
  end
  else
  if(ActiveControl =  oForm.edtCor)then
  begin
    if((oForm.edtCdItensPedido.Text = '') or (oForm.edtModelo.Text = ''))then
      Verificar(oForm.edtModelo);

    oCadastroModeloDto.Descricao := oForm.edtModelo.Text;
    if(oCadastroPedidoRegra.SelectModeloPorDescricao(oCadastroModeloModel, oCadastroModeloDto))then
      sWhere := IntToStr(oCadastroModeloDto.IdModelo);
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

    // implementar swhere mostrar apenas modelos q n estejam na lista
    if (not(assigned(oConsultaModeloController))) then
      oConsultaModeloController := TConsultaModeloController.Create;
    oConsultaModeloController.CriarForm(Aowner, RetornoModelo, oForm.edtModelo.Text);
  end
  else
  begin
    if(ActiveControl is TCustomEdit) and (ActiveControl.CanFocus)then
      CampoAtivo := ActiveControl;
   if (not(assigned(oConsultaPedidoController))) then
      oConsultaPedidoController := TConsultaPedidoController.Create;
    oConsultaPedidoController.CriarForm(Aowner, RetornoPedido, oForm.edtCodigo.Text, sWhere);
  end;
end;


procedure TCadastroPedidoController.RetornoBairro(aIdBairro: Integer);
begin
  if(aIdBairro <> 0)then
  begin
    oCadastroBairroDto.IdBairro := aIdBairro;
    if(oCadastroPedidoRegra.SelectBairroPorId(oCadastroBairroModel, oCadastroBairroDto))then
      oForm.edtBairro.Text := oCadastroBairroDto.Descricao;
      oForm.edtRua.SetFocus;
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
        edtNomeClienteEx.Text := oCadastroClienteDto.Nome;
        edtNmClient.Text :=   IntToStr(oCadastroClienteDto.IdCliente);
        edtCpfCnpj.Text    :=  oCadastroClienteDto.cpf_cnpj;
        edtCpfCnpj.SetFocus;
      end;
    end;
  end;
end;

procedure TCadastroPedidoController.RetornoPedido(aIdPedido: Integer);
var
  oLoopControlItens : TCadastroItensDto;
  oLoopControlDetalhe : TCadastroDetalheItemDto;
  bendClient : boolean;
begin
  with (oFormulario as TCadastroPedidoForm) do
  begin
    if(aIdPedido <> 0)then
    begin
      if(pgpedido.ActivePage = pgItens)then
        if (MessageDlg('Deseja mesmo alterar para o pedido selecionado ? '
          , mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        begin
          Abort;
        end;
      oCadastroPedidoDto.IdPedido :=  aIdPedido;
      if(oCadastroPedidoRegra.SelectPedido(oCadastroPedidoModel, oCadastroPedidoDto,
        oCadastroClienteModel, oCadastroClienteDto,
        ocadastroItensPedidoModel, oCadastroDetalhesItensModel))then
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
        edtCpfCnpj.Text := oCadastroClienteDto.cpf_cnpj;
        edtUsuario.Text := oCadastroPedidoDto.usuario;
        bendClient := True;
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
            bendClient := False;
          end;
        end
        else
          oCadastroEnderecoDto.IdEndereco := oCadastroPedidoDto.idendereco;
        if(bendClient)then
        begin
          if(oCadastroPedidoRegra.SelectEndereco(oCadastroEnderecoModel,
          oCadastroEnderecoDto, oCadastroBairroModel, oCadastroBairroDto,
          oCadastroMunicipioModel, oCadastroMunicipioDto))then
          begin
            chkAltEnd.Caption := 'Alterar Endereço';
            edtNmr.Text :=  oCadastroEnderecoDto.Numero;
            edtRua.Text :=  oCadastroEnderecoDto.Endereco;
            edtCidade.Text := oCadastroMunicipioDto.Municipio;
            edtBairro.Text := oCadastroBairroDto.Descricao;
          end;
        end;
        if(oCadastroPedidoDto.ItensPedido.Count > 0)then
        begin
          for oLoopControlItens in oCadastroPedidoDto.ItensPedido.Values do
          begin
            oCadastroItensDto.IdItensPedido := oLoopControlItens.IdItensPedido;
            oCadastroModeloDto.IdModelo := oLoopControlItens.idmodelo;
            if(oCadastroPedidoRegra.SelectModeloPorId(oCadastroModeloModel, oCadastroModeloDto))then
            ChlAdd(True);
            if(assigned(oLoopControlItens.DetalheItem))then
            begin
              if(oLoopControlItens.DetalheItem.Count > 0) then
              begin
                for oLoopControlDetalhe in oLoopControlItens.DetalheItem.Values do
                begin
                  oCadastroDetalheItensDto.IdDetalhe := oLoopControlDetalhe.IdDetalhe;
                  oCadastroTamanhoDto.IdTamanho := oLoopControlDetalhe.idtamanho;
                  oCadastroPedidoRegra.SelectTamanhoPorId(oCadastroTamanhoModel, oCadastroTamanhoDto);
                  oCadastroCorDto.IdCor := oLoopControlDetalhe.idcor;
                  oCadastroPedidoRegra.SelectCorPorId(oCadastroCorModel, oCadastroCorDto);
                  ChlAdd(False);
                end;
              end;
            end;
          end;
        end;
      end;
      bPermite := True;
      oForm.pgpedido.ActivePage := oForm.pgCabecalho;
      oForm.edtCodigo.SetFocus;
    end
    else
      if(CampoAtivo <> nil)and(CampoAtivo.CanFocus)then
      begin
        CampoAtivo.SetFocus;
        CampoAtivo := nil;
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
      oForm.edtQntTam.SetFocus;
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
      oForm.edtPrecoItem.Text := CurrToStr(oCadastroModeloDto.Preco);
      oForm.edtCdItensPedido.Text := IntToStr(oCadastroModeloDto.IdModelo);
      oForm.edtTamanho.SetFocus;
    end;
  end;
end;

procedure TCadastroPedidoController.RetornoMunicipio(aIdMunicipio: Integer);
begin
  if(aIdMunicipio <> 0)then
  begin
    oCadastroMunicipioDto.id := aIdMunicipio;
    if(oCadastroPedidoRegra.SelectMunicipioPorId(oCadastroMunicipioModel, oCadastroMunicipioDto))then
      oForm.edtCidade.Text := oCadastroMunicipioDto.Municipio;
      oForm.edtBairro.SetFocus;
  end;
end;

procedure TCadastroPedidoController.RetornoTamanho(aIdTamanho: Integer);
begin
  if(aIdTamanho <> 0)then
  begin
    oCadastroTamanhoDto.IdTamanho := aIdTamanho;
    if(oCadastroPedidoRegra.SelectTamanhoPorId(oCadastroTamanhoModel, oCadastroTamanhoDto))then
      oForm.edtTamanho.Text := oCadastroTamanhoDto.Descricao;
      oForm.edtCor.SetFocus;
  end;
end;



procedure TCadastroPedidoController.Salvar;
var
  sInpBox : string;
begin
  inherited;
  with (oFormulario as TCadastroPedidoForm) do
  begin
    oCadastroPedidoDto.IdPedido     := StrToInt(edtCodigo.Text);
    oCadastroPedidoDto.nomevendedor := edtNomeVendedor.Text;
    oCadastroPedidoDto.observacao   := edtObservacoes.Lines.Text;
    oCadastroPedidoDto.dataentrega  := dtePrev.Date;
    oCadastroPedidoDto.data         := dteData.Date;
    oCadastroPedidoDto.usuario      := edtUsuario.Text;
    oCadastroPedidoDto.valortotal   := StrToCurrDef(edtValorTotal.Text ,0);
    if(edtNmClient.Text = '')then
    begin
      oForm.pgpedido.ActivePage := oForm.pgCabecalho;
      oForm.edtCpfCnpj.SetFocus;
      raise Exception.Create('Insira um cliente');
    end
    else
      oCadastroPedidoDto.idcliente    := StrToInt(edtNmClient.Text);
    oCadastroPedidoDto.nomereceptor := edtReceptor.Text;

    if(chkAltEnd.Checked)then
    begin
      oCadastroEnderecoDto.Endereco := edtRua.Text;
      oCadastroEnderecoDto.Numero := edtNmr.Text;
      oCadastroBairroDto.Descricao := edtBairro.Text;
      oCadastroEnderecoDto.status := 2;
      oCadastroMunicipioDto.Municipio
       := edtCidade.Text;
      oCadastroEnderecoDto.IdEndereco := oCadastroPedidoDto.idendereco;
      if (not(oCadastroPedidoRegra.SalvarEndereco(oCadastroEnderecoModel,
      oCadastroEnderecoDto, oCadastroBairroModel, oCadastroBairroDto,
      oCadastroMunicipioModel, oCadastroMunicipioDto)))then
        raise Exception.Create('Falha ao salvar o endereço');
    end;
  end;
  if(oCadastroPedidoRegra.Salvar(oCadastroPedidoModel, oCadastroPedidoDto,
                                 oCadastroClienteModel, oCadastroClienteDto,
                                 oCadastroItensPedidoModel,  oCadastroDetalhesItensModel))then
    ShowMessage('Pedido: '+ IntToStr(oCadastroPedidoDto.IdPedido) +' Atualizado com sucesso')
  else
  begin
    ShowMessage('Pedido: '+ IntToStr(oCadastroPedidoDto.IdPedido) +' Inserido com sucesso');
  end;
  oForm.pgpedido.ActivePage := oForm.pgCabecalho;
  bPermite := False;
  oForm.chlDetalheItem.Clear;
  oForm.chlItens.Clear;

  if(Assigned(oCadastroPedidoDto))then
   begin
    FreeAndNil(oCadastroPedidoDto);
    oCadastroPedidoDto := TCadastroPedidoDto.Create;
   end;

  if(assigned(oListaDetalheItem))then
    FreeAndNil(oListaDetalheItem);
end;




procedure TCadastroPedidoController.TAllowChange(Sender: TObject;var AllowChange : boolean);
begin
  AllowChange := bPermite;
end;

procedure TCadastroPedidoController.Verificar(ActiveControl: TWinControl);
begin

  if(ActiveControl = oForm.edtCdItensPedido)then
  begin
    if(oForm.edtCor.Text = '') and (oForm.edtTamanho.Text <> '')then
      raise Exception.Create('Insira uma cor válida');
  end
  else
  if(ActiveControl = oForm.edtCodigo)then
  begin
    if(oForm.edtCodigo.Text = '')then
      NovoID
    else
      RetornoPedido(StrToInt(oForm.edtCodigo.Text));
  end
  else
  if(ActiveControl = oForm.edtQntTam)then
  begin
    if(oForm.edtQntTam.Text = '')then
      raise Exception.Create('O campo Qnt. Camisas não pode ser vazio')
    else
        AdicionarDetalhe;
  end
  else
  if(ActiveControl = oForm.edtCdItensPedido)then
  begin
    oCadastroModeloDto.IdModelo := StrToInt(oForm.edtCodigo.Text);
    if(not(oCadastroPedidoRegra.SelectModeloPorId(oCadastroModeloModel, oCadastroModeloDto)))then
    begin
      raise Exception.Create('Informe um modelo válido');
      abort;
    end
    else
    RetornoModelo(StrToInt(oForm.edtCdItensPedido.Text));
  end
  else
  if(ActiveControl = oForm.edtModelo)then
  begin
    oCadastroModeloDto.Descricao := oForm.edtModelo.Text;
    if(not(oCadastroPedidoRegra.SelectModeloPorDescricao(oCadastroModeloModel, oCadastroModeloDto)))then
    begin
      raise Exception.Create('Informe um modelo válido');
      abort;
    end;
    if(oForm.edtCdItensPedido.Text = '')then
        oForm.edtCdItensPedido.Text := IntToStr(oCadastroModeloDto.IdModelo);
        oForm.edtPrecoItem.Text := CurrToStr(oCadastroModeloDto.Preco);
  end
  else
  if(ActiveControl = oForm.edtTamanho)then
  begin
    oCadastroTamanhoDto.Descricao := oForm.edtTamanho.Text;
    if(not(oCadastroPedidoRegra.SelectTamanhoPorDescricao(oCadastroTamanhoModel, oCadastroTamanhoDto)))then
    begin
      raise Exception.Create('Informe um tamanho válido');
      abort;
    end;
  end
  else
  if(ActiveControl = oForm.edtObservacoes)then
  begin
    bPermite := True;
    oForm.pgpedido.ActivePage := oForm.pgItens;
    oForm.edtModelo.SetFocus;
    abort;
  end;
  inherited;
end;
end.
