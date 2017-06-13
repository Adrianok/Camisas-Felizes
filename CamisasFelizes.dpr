program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uCadastroUfController in 'CadastroUF\cadastro\uCadastroUfController.pas',
  uCadastroUfDto in 'CadastroUF\cadastro\uCadastroUfDto.pas',
  uCadastroUfForm in 'CadastroUF\cadastro\uCadastroUfForm.pas' {CadastroCorForm},
  uCadastroUfModel in 'CadastroUF\cadastro\uCadastroUfModel.pas',
  uCadastroUfRegra in 'CadastroUF\cadastro\uCadastroUfRegra.pas',
  uInterfaceCadastroUfModel in 'CadastroUF\cadastro\uInterfaceCadastroUfModel.pas',
  uConsultaUfController in 'CadastroUF\consulta\uConsultaUfController.pas',
  uConsultaUfForm in 'CadastroUF\consulta\uConsultaUfForm.pas' {ConsultaCorForm},
  uConsultaUfModel in 'CadastroUF\consulta\uConsultaUfModel.pas',
  uConsultaUfRegra in 'CadastroUF\consulta\uConsultaUfRegra.pas',
  uInterfaceConsultaUfModel in 'CadastroUF\consulta\uInterfaceConsultaUfModel.pas',
  uInterfaceUfModel in 'CadastroUF\consulta\uInterfaceUfModel.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uClasseInterfaceConsultaBase in 'Base\uClasseInterfaceConsultaBase.pas',
  uClasseInterfaceViewBase in 'Base\uClasseInterfaceViewBase.pas',
  uClassInterface in 'Base\uClassInterface.pas',
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uInterfaceBase in 'Base\uInterfaceBase.pas',
  uInterfaceConsultaBase in 'Base\uInterfaceConsultaBase.pas',
  uInterfaceViewBase in 'Base\uInterfaceViewBase.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
