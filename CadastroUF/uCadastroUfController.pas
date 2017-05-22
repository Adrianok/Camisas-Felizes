unit uCadastroUfController;

interface

uses
  System.SysUtils, System.classes, FireDAC.Comp.Client, Data.DB, FireDAC.DApt,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uCadastroUfModel, uConexaoSingleTon, uCadastroUfDTO,
  uCadastroUfRegra,
  uCadastroUfForm;

type
  TCadastroUfController = class
  private
    oCadastroUfDTO: TCadastroUfDTO;
    oCadastroUfModel: TCadastroUfModel;
    oCadastroUfRegra: TCadastroUfRegra;
    oCadastroUfForm: TCadastroUfForm;

  public
    procedure CriarForm(aOwner: TComponent);
    procedure FecharForm(Sender: TObject);
    procedure LimparForm(Sender: TObject);
    procedure ValidarUF(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure AtribuirDto;

    constructor Create;
    destructor Destroy; override;

  end;

var
  oCadastroUfController: TCadastroUfController;

implementation

{ TUfController }

procedure TCadastroUfController.AtribuirDto;
begin
  oCadastroUfDTO.id := oCadastroUfRegra.BuscarId;
  oCadastroUfDTO.uf := oCadastroUfForm.LedtUf.Text;
  oCadastroUfDTO.nome := oCadastroUfForm.LedtNome.Text;
end;

constructor TCadastroUfController.Create;
begin
  oCadastroUfDTO := TCadastroUfDTO.Create;
  oCadastroUfModel := TCadastroUfModel.Create;
  oCadastroUfRegra := TCadastroUfRegra.Create;

end;

procedure TCadastroUfController.CriarForm(aOwner: TComponent);
begin
  if (not(Assigned(oCadastroUfForm))) then
    oCadastroUfForm := TCadastroUfForm.Create(aOwner);

  oCadastroUfForm.btnFechar.OnClick := FecharForm;
  oCadastroUfForm.btnSalvar.OnClick := Salvar;

end;

destructor TCadastroUfController.Destroy;
begin
  if (Assigned(oCadastroUfDTO)) then
    FreeAndNil(oCadastroUfDTO);

  if (Assigned(oCadastroUfModel)) then
    FreeAndNil(oCadastroUfModel);

  if (Assigned(oCadastroUfRegra)) then
    FreeAndNil(oCadastroUfRegra);

  inherited;

end;

procedure TCadastroUfController.FecharForm(Sender: TObject);
begin
  if (Assigned(oCadastroUfForm)) then
  begin
    oCadastroUfForm.Close;
    FreeAndNil(oCadastroUfForm);
  end;
end;

procedure TCadastroUfController.LimparForm(Sender: TObject);
begin
  { oCadastroUfRegra.LimparForm(oCadastroUfDTO); }
end;

procedure TCadastroUfController.Salvar(Sender: TObject);
begin
  AtribuirDto();
  oCadastroUfRegra.Salvar(oCadastroUfModel, oCadastroUfDTO);
end;

procedure TCadastroUfController.ValidarUF(Sender: TObject);
begin
  { }
end;

initialization

finalization

if Assigned(oCadastroUfController) then
  FreeAndNil(oCadastroUfController);

end.
