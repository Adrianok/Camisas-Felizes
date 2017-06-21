unit uCadastroPedidoController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.classes, System.SysUtils,
  uCadastroPedidoDto, uClasseInterfaceViewBase,
  uCadastroPedidoRegra, uCadastroPedidoModel,
  uCadastroPedidoForm, uInterfaceViewBase,
  uConsultaPedidoForm, uConsultaPedidoController;

type
  TCadastroPedidoController = class(TClassInterfaceViewBase)
  private
  public
    procedure Excluir; override;
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
  oCadastroPedidoController: IInterfaceViewBase;

implementation


{ TControllerCadastroPedido }

procedure TCadastroPedidoController.Consulta;
begin
inherited;
  if(oCadastroPedidoDto.IdPedido <> 0)then
  begin
    if(oCadastroPedidoRegra.SelectPedido(oCadastroPedidoModel, oCadastroPedidoDto))then
    with (oFormulario as TCadastroPedidoForm) do
    begin
      edtCodigo.Text :=   IntToStr(oCadastroPedidoDto.IdPedido);
      edtPedido.Text    :=  oCadastroPedidoDto.Descricao;
    end;
  end
end;

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
  inherited;
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroPedidoForm.Create(Aowner);
  oFormulario.oController := oCadastroPedidoController;
  oFormulario.Show;
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
  oCadastroPedidoDto.Descricao    :=(oFormulario as TCadastroPedidoForm).edtPedido.Text;

  if (not(assigned(oConsultaPedidoController))) then
    oConsultaPedidoController := TConsultaPedidoController.Create;
  oConsultaPedidoController.CriarForm(Aowner);
end;

procedure TCadastroPedidoController.Salvar;
begin
    inherited;
    with (oFormulario as TCadastroPedidoForm) do
    begin
      oCadastroPedidoDto.IdPedido        :=  StrToInt(edtCodigo.Text);
      oCadastroPedidoDto.Descricao        :=  edtPedido.Text;
    end;
    if(oCadastroPedidoRegra.Salvar(oCadastroPedidoModel, oCadastroPedidoDto))then
      ShowMessage('Registro: '+ oCadastroPedidoDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroPedidoDto.Descricao +' Inserido com sucesso');
    end;
end;




end.
