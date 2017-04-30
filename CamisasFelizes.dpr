program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
