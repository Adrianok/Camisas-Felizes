program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uControllerCadastroModelo in 'Modelo\uControllerCadastroModelo.pas',
  uModelo in 'Modelo\uModelo.pas' {frmCadastroModelo},
  uControllerPrincipal in 'Principal\uControllerPrincipal.pas',
  uFuncoesPrincipal in 'Principal\uFuncoesPrincipal.pas',
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uPrincipalBorda in 'Principal\uPrincipalBorda.pas' {frmPrincipalBorda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalBorda, frmPrincipalBorda);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
