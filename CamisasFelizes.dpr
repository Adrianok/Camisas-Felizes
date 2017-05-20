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
  uUf_Controller in 'CadastroUF\uUf_Controller.pas',
  uUf_DTO in 'CadastroUF\uUf_DTO.pas',
  uUf_Form in 'CadastroUF\uUf_Form.pas',
  uUf_Model in 'CadastroUF\uUf_Model.pas',
  uUf_Regra in 'CadastroUF\uUf_Regra.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
