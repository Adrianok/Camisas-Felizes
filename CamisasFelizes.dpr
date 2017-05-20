program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uCadastroModeloController in 'Modelo\uCadastroModeloController.pas',
  uCadastroModeloDto in 'Modelo\uCadastroModeloDto.pas',
  uCadastroModeloModel in 'Modelo\uCadastroModeloModel.pas',
  uCadastroCorDto in 'Cor\uCadastroCorDto.pas',
  uCadastroModeloForm in 'Modelo\uCadastroModeloForm.pas' {frmCadastroModelo},
  uPrincipalForm in 'Principal\uPrincipalForm.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
