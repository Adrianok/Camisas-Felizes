unit uCadastroModeloController;

interface

uses
  Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Controls,
  System.classes, System.SysUtils,
  uCadastroModeloDto, uClasseInterfaceViewBase,
  uCadastroModeloRegra, uCadastroModeloModel,
  uCadastroModeloForm, uInterfaceViewBase,
  uConsultaModeloForm, uConsultaModeloController,
  System.Generics.Collections, uCadastroCorDto,
  uCor_ModeloModel, uCadastroCorModel, uListaCores,
  Vcl.ComCtrls;

type
  TCadastroModeloController = class(TClassInterfaceViewBase)
  private
    oListaIdCores : TList;
    oListaCores : TListaCores;
    procedure RetornoModelo(aIdModelo : integer);
  public
    procedure VerificarChecados(oListaIdCores : TList);
    procedure GridCor(const idModelo : Integer);
    procedure Inicial; override;
    procedure ConsultaGridCor(Sender : Tobject);
    procedure Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);  override;
    procedure CriarForm(Aowner: TComponent); override;
    procedure Novo; override;
    procedure Salvar; override;
    procedure Excluir; override;
    procedure NovoID;

    constructor Create;
    destructor Destroy; override;
  end;
var
  oCadastroModeloController: IInterfaceViewBase;

implementation


{ TControllerCadastroModelo }

procedure TCadastroModeloController.ConsultaGridCor(Sender : Tobject);
var
   Search : TlistItem;
begin
  with (oFormulario as TCadastroModeloForm) do
  begin
    Search := ListView1.FindCaption(0,edtCor.text,true,true,true);

    if(Search <> nil)then
    begin
      ListView1.Items.Item[Search.Index].Selected := True;
    end
    else
      ListView1.Selected:= nil;
  end;

end;

constructor TCadastroModeloController.Create;
begin
  if (not(assigned(oCadastroModeloModel))) then
    oCadastroModeloModel := TCadastroModeloModel.Create;

  if (not(assigned(oCor_ModeloModel))) then
    oCor_ModeloModel := TCor_ModeloModel.Create;

  if (not(assigned(oCadastroCorModel))) then
    oCadastroCorModel := TCadastroCorModel.Create;

  if (not(assigned(oCadastroModeloDto))) then
    oCadastroModeloDto := TCadastroModeloDto.Create;

  if (not(assigned(oCadastroModeloRegra))) then
    oCadastroModeloRegra := TCadastroModeloRegra.Create;
end;

procedure TCadastroModeloController.CriarForm(Aowner: TComponent);
begin
  if not(assigned(oFormulario)) then
    oFormulario := TCadastroModeloForm.Create(Aowner);
  oFormulario.oController := oCadastroModeloController;
  oFormulario.Show;
  inherited;
    (oFormulario as TCadastroModeloForm).edtCor.OnChange := ConsultaGridCor;
end;

destructor TCadastroModeloController.Destroy;
begin
  if (assigned(oCadastroModeloModel)) then
    FreeAndNil(oCadastroModeloModel);

  if (assigned(oCor_ModeloModel)) then
    FreeAndNil(oCor_ModeloModel);

  if (assigned(oCadastroModeloDto)) then
    FreeAndNil(oCadastroModeloDto);

  if(assigned(oListaIdCores))then
    FreeAndNil(oListaIdCores);

  if(assigned(oListaCores))then
    FreeAndNil(oListaCores);

  if (assigned(oCadastroCorModel)) then
    FreeAndNil(oCadastroCorModel);

  if (assigned(oCadastroModeloRegra)) then
    FreeAndNil(oCadastroModeloRegra);
  inherited;
end;



procedure TCadastroModeloController.Excluir;
begin
  inherited;
  oCadastroModeloRegra.Deletar(oCadastroModeloModel, oCor_ModeloModel, oCadastroModeloDto.IdModelo);
end;

procedure TCadastroModeloController.GridCor(const idModelo : Integer);
var
  oCadastroCorDto : TCadastroCorDto;
  iIndice : Integer;
  iIndiceLista : Integer;
begin
  with (oFormulario as TCadastroModeloForm) do
  begin
    try
      oListaCores:= TListaCores.Create([doOwnsValues]);
      oListaIdCores:= TList.Create;

      if (oCadastroModeloRegra.SelectCores(oListaCores, oCadastroCorModel)) then
      begin
        (oFormulario as TCadastroModeloForm).ListView1.Clear;
        for oCadastroCorDto in oListaCores.Values do
        begin
          ListView1.AddItem(oCadastroCorDto.Descricao, TObject(oCadastroCorDto.IdCor));
        end;

        if(oCadastroModeloRegra.SelectVinculo(oListaIdCores, idModelo)) then
        begin
          for iIndice := 0 to ListView1.Items.Count -1 do
          begin
            for iIndiceLista := 0 to oListaIdCores.Count -1 do
              if(ListView1.Items.Item[iIndice].Data = oListaIdCores.Items[iIndiceLista])then
                ListView1.Items.Item[iIndice].Checked := True;
          end;
        end;
      end;
    finally
      if(assigned(oListaIdCores))then
        FreeAndNil(oListaIdCores);

      if(assigned(oListaCores))then
        FreeAndNil(oListaCores);
    end;
  end;
end;

procedure TCadastroModeloController.Inicial;
begin
  inherited;
  (oFormulario as TCadastroModeloForm).ListView1.Clear;
end;

procedure TCadastroModeloController.Novo;
begin
  inherited;
  NovoID;
  GridCor(StrToIntDef((oFormulario as TCadastroModeloForm).edtCodigo.Text, 0));
end;

procedure TCadastroModeloController.NovoID;
begin
 if(oCadastroModeloRegra.Novo(oCadastroModeloModel, oCadastroModeloDto))then
  (oFormulario as TCadastroModeloForm).edtCodigo.Text := IntToStr(oCadastroModeloDto.IdModelo);
end;

procedure TCadastroModeloController.Pesquisar(Aowner : TComponent; ActiveControl : TWinControl);
var
 sIdModelo : string;
begin
  inherited;
  sIdModelo :=    (oFormulario as TCadastroModeloForm).edtCodigo.Text;

  if(sIdModelo <> '')then
    oCadastroModeloDto.IdModelo        :=  StrToInt(sIdModelo);
  oCadastroModeloDto.Descricao    := (oFormulario as TCadastroModeloForm).edtModelo.Text;

  if (not(assigned(oConsultaModeloController))) then
    oConsultaModeloController := TConsultaModeloController.Create;
  oConsultaModeloController.CriarForm(Aowner, RetornoModelo, oCadastroModeloDto.Descricao);
end;

procedure TCadastroModeloController.RetornoModelo(aIdModelo: integer);
begin
  with (oFormulario as TCadastroModeloForm) do
  begin
    if(aIdModelo <> 0)then
    begin
      oCadastroModeloDto.IdModelo := aIdModelo;
      if(oCadastroModeloRegra.SelectModelo(oCadastroModeloModel, oCadastroModeloDto))then
        edtCodigo.Text :=   IntToStr(oCadastroModeloDto.IdModelo);
      edtModelo.Text    :=  oCadastroModeloDto.Descricao;
      edtPreco.Text    :=  CurrToStr(oCadastroModeloDto.Preco);

      GridCor(StrToIntDef(edtCodigo.Text, 0));
    end
    else
    begin
      Inicial;
      raise Exception.Create('Não foi escolhido registro');
    end;
  end;
end;

procedure TCadastroModeloController.Salvar;
var
  oListaIdCores : TList;
begin
    inherited;
  try
    oListaIdCores := TList.Create;
    with (oFormulario as TCadastroModeloForm) do
    begin
      oCadastroModeloDto.IdModelo        :=  StrToInt(edtCodigo.Text);
      oCadastroModeloDto.Descricao       :=  edtModelo.Text;
      oCadastroModeloDto.Preco           := StrToCurr(edtPreco.Text);
      VerificarChecados(oListaIdCores);
    end;
    if(oCadastroModeloRegra.Salvar(oListaIdCores, oCor_ModeloModel, oCadastroModeloModel, oCadastroModeloDto))then
      ShowMessage('Registro: '+ oCadastroModeloDto.Descricao +' Atualizado com sucesso')
    else
    begin
      ShowMessage('Registro: '+ oCadastroModeloDto.Descricao +' Inserido com sucesso');
    end;
  finally
    oListaIdCores.Free;
  end;
end;




procedure TCadastroModeloController.VerificarChecados(oListaIdCores: TList);
var
  iIndice     : integer;
  ItemChecado : TListItem;
begin
  with (oFormulario as TCadastroModeloForm) do
  begin
    oListaIdCores.Capacity :=  ListView1.Items.Count;
    for iIndice := 0  to ListView1.Items.Count -1 do
    begin
      ItemChecado := ListView1.Items.Item[iIndice];
      if(ItemChecado.Checked)then
        oListaIdCores.Add(ItemChecado.Data);
    end;
  end;
end;

end.
