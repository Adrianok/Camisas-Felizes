unit uCadastroPedidoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroPedidoDto, uClasseInterfaceViewBase,
  uCadastroPedidoRegra, uCadastroPedidoModel,
  uCadastroPedidoForm, uInterfaceViewBase,
  uConsultaPedidoForm, uConsultaPedidoController,
  uCadastroClienteModel, uCadastroClienteDto,
  uCadastroEnderecoModel, uCadastroEnderecoDto,
  uCadastroBairroModel, uCadastroBairroDto;

type
  TCadastroPedidoController = class(TClassInterfaceViewBase)
  private
    oCadastroEnderecoDto   : TCadastroEnderecoDto;
    oCadastroEnderecoModel : TCadastroEnderecoModel;
    oCadastroClienteModel  : TCadastroClienteModel;
    oCadastroClienteDto    : TCadastroClienteDto;
    oCadastroBairroModel   : TCadastroBairroModel;
    oCadastroBairroDto     : TCadastroBairroDto;

    oCadastroPedidoRegra   : TCadastroPedidoRegra;
    oCadastroPedidoModel   : TCadastroPedidoModel;
    oCadastroPedidoDto     : TCadastroPedidoDto;
    procedure RetornoPedido(aIdPedido : Integer);
  public
    procedure Excluir; override;
    procedure Inicial; override;
    procedure Pesquisar(Aowner : TComponent); override;
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

constructor TCadastroPedidoController.Create;
begin


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
  (oFormulario as TCadastroPedidoForm).dteData.Date := Now;
  (oFormulario as TCadastroPedidoForm).dtePrev.Date := Now;
  inherited;
end;

destructor TCadastroPedidoController.Destroy;
begin
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
  oCadastroPedidoRegra.Deletar(oCadastroPedidoModel, oCadastroPedidoDto.IdPedido);
end;

procedure TCadastroPedidoController.Inicial;
begin
  inherited;

end;

procedure TCadastroPedidoController.Novo;
begin
  inherited;
  NovoID;
end;

procedure TCadastroPedidoController.NovoID;
begin
 if(oCadastroPedidoRegra.Novo(oCadastroPedidoModel, oCadastroPedidoDto))then
  (oFormulario as TCadastroPedidoForm).edtCodigo.Text := IntToStr(oCadastroPedidoDto.IdPedido);
end;

procedure TCadastroPedidoController.Pesquisar(Aowner : TComponent);
var
 sIdPedido : string;
begin
  inherited;
  sIdPedido   :=  (oFormulario as TCadastroPedidoForm).edtCodigo.Text;

  if(sIdPedido <> '')then
    oCadastroPedidoDto.IdPedido        :=  StrToInt(sIdPedido);
//  oCadastroPedidoDto.Descricao    :=(oFormulario as TCadastroPedidoForm).edtPedido.Text;

  if (not(assigned(oConsultaPedidoController))) then
    oConsultaPedidoController := TConsultaPedidoController.Create;
 oConsultaPedidoController.CriarForm(Aowner, RetornoPedido, '');
end;

procedure TCadastroPedidoController.RetornoPedido(aIdPedido: Integer);

begin
inherited;
  try
    if (not(assigned(oCadastroEnderecoDto))) then
      oCadastroEnderecoDto := TCadastroEnderecoDto.Create;

    if (not(assigned(oCadastroEnderecoModel))) then
      oCadastroEnderecoModel := TCadastroEnderecoModel.Create;

    if (not(assigned(oCadastroBairroDto))) then
      oCadastroBairroDto := TCadastroBairroDto.Create;

    if (not(assigned(oCadastroBairroModel))) then
      oCadastroBairroModel := TCadastroBairroModel.Create;

    if (not(assigned(oCadastroClienteDto))) then
      oCadastroClienteDto := TCadastroClienteDto.Create;

    if (not(assigned(oCadastroClienteModel))) then
      oCadastroClienteModel := TCadastroClienteModel.Create;

    if (not(assigned(oCadastroBairroModel))) then
      oCadastroBairroModel := TCadastroBairroModel.Create;

    if(aIdPedido <> 0)then
    begin
      oCadastroPedidoDto.IdPedido :=  aIdPedido;
      if(oCadastroPedidoRegra.SelectPedido(oCadastroPedidoModel, oCadastroPedidoDto,
      oCadastroClienteModel, oCadastroClienteDto, oCadastroEnderecoModel, oCadastroEnderecoDto,
      oCadastroBairroModel, oCadastroBairroDto))
      then
      with (oFormulario as TCadastroPedidoForm) do
      begin
        edtCodigo.Text        :=   IntToStr(oCadastroPedidoDto.IdPedido);
        edtNomeVendedor.Text  :=  oCadastroPedidoDto.nomevendedor;
        edtObservacoes.Text   := oCadastroPedidoDto.observacao;
        dtePrev.Date := oCadastroPedidoDto.dataentrega;
        dteData.Date := oCadastroPedidoDto.data;
        edtValorTotal.Text := CurrToStr(oCadastroPedidoDto.valortotal);
        edtNmr.Text :=  oCadastroEnderecoDto.Numero;
        edtRua.Text :=  oCadastroEnderecoDto.Endereco;
        edtNomeCliente.Text := oCadastroClienteDto.Nome;
        edtNomeClienteEx.Text :=  oCadastroClienteDto.Nome;
        edtNmClient.Text := IntToStr(oCadastroClienteDto.IdCliente);
        edtCpfCnpj.Text := CurrToStr(oCadastroClienteDto.cpf_cnpj);
        edtBairro.Text := oCadastroBairroDto.Descricao;
        edtReceptor.Text := oCadastroPedidoDto.nomereceptor;
      end;
    end
    else
    begin
      Inicial;
      raise Exception.Create('Não foi escolhido registro');
    end;
  finally
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
  end;
end;

procedure TCadastroPedidoController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroPedidoForm) do
    begin
      oCadastroPedidoDto.IdPedido        :=  StrToInt(edtCodigo.Text);
//      oCadastroPedidoDto.Descricao        :=  edtPedido.Text;
    end;
    if(oCadastroPedidoRegra.Salvar(oCadastroPedidoModel, oCadastroPedidoDto))then
      ShowMessage('Registro: '+ IntToStr(oCadastroPedidoDto.IdPedido) +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ IntToStr(oCadastroPedidoDto.IdPedido) +' Inserido com sucesso');
    end;
end;




end.
