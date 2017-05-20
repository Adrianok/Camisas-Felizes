program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uControllerCadastroModelo in 'Modelo\uControllerCadastroModelo.pas',
  uModelo in 'Modelo\uModelo.pas' {frmCadastroModelo},
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uCadastroUfController in 'CadastroUF\uCadastroUfController.pas',
  uCadastroUfDto in 'CadastroUF\uCadastroUfDto.pas',
  uCadastroUfForm in 'CadastroUF\uCadastroUfForm.pas' {Cadastro de UF},
  uCadastroUfModel in 'CadastroUF\uCadastroUfModel.pas',
  uCadastroUfRegra in 'CadastroUF\uCadastroUfRegra.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
