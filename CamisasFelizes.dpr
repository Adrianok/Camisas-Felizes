program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uModelo_M in 'Modelo\uModelo_M.pas',
  uModelo_D in 'Modelo\uModelo_D.pas',
  uCor_D in 'Cor\uCor_D.pas',
  uModelo_C in 'Modelo\uModelo_C.pas',
  uModelo_F in 'Modelo\uModelo_F.pas' {frmCadastroModelo},
  uPrincipal_F in 'Principal\uPrincipal_F.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastroModelo, frmCadastroModelo);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
