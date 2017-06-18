program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uClasseInterfaceViewBase in 'Base\uClasseInterfaceViewBase.pas',
  uInterfaceViewBase in 'Base\uInterfaceViewBase.pas',
  uInterfaceConsultaBase in 'Base\uInterfaceConsultaBase.pas',
  uClasseInterfaceConsultaBase in 'Base\uClasseInterfaceConsultaBase.pas',
  Vcl.Themes,
  Vcl.Styles,
  uConsultaUfController in 'CadastroUF\consulta\uConsultaUfController.pas',
  uConsultaUfForm in 'CadastroUF\consulta\uConsultaUfForm.pas' {ConsultaUfForm},
  uConsultaUfModel in 'CadastroUF\consulta\uConsultaUfModel.pas',
  uConsultaUfRegra in 'CadastroUF\consulta\uConsultaUfRegra.pas',
  uInterfaceConsultaUfModel in 'CadastroUF\consulta\uInterfaceConsultaUfModel.pas',
  uInterfaceUfModel in 'CadastroUF\consulta\uInterfaceUfModel.pas',
  uCadastroUfController in 'CadastroUF\cadastro\uCadastroUfController.pas',
  uCadastroUfDto in 'CadastroUF\cadastro\uCadastroUfDto.pas',
  uCadastroUfForm in 'CadastroUF\cadastro\uCadastroUfForm.pas' {CadastroUfForm},
  uCadastroUfModel in 'CadastroUF\cadastro\uCadastroUfModel.pas',
  uCadastroUfRegra in 'CadastroUF\cadastro\uCadastroUfRegra.pas',
  uInterfaceCadastroUfModel in 'CadastroUF\cadastro\uInterfaceCadastroUfModel.pas',
  uCadastroModeloController in 'Modelo\uCadastroModeloController.pas',
  uCadastroModeloDto in 'Modelo\uCadastroModeloDto.pas',
  uCadastroModeloForm in 'Modelo\uCadastroModeloForm.pas' {CadastroModeloForm},
  uCadastroModeloModel in 'Modelo\uCadastroModeloModel.pas',
  uCadastroModeloRegra in 'Modelo\uCadastroModeloRegra.pas',
  uInterfaceCadastroModeloModel in 'Modelo\uInterfaceCadastroModeloModel.pas',
  uCadastroCorController in 'Cor\Cadastro\uCadastroCorController.pas',
  uCadastroCorDto in 'Cor\Cadastro\uCadastroCorDto.pas',
  uCadastroCorForm in 'Cor\Cadastro\uCadastroCorForm.pas' {CadastroCorForm},
  uCadastroCorModel in 'Cor\Cadastro\uCadastroCorModel.pas',
  uCadastroCorRegra in 'Cor\Cadastro\uCadastroCorRegra.pas',
  uInterfaceCadastroCorModel in 'Cor\Cadastro\uInterfaceCadastroCorModel.pas',
  uConsultaCorController in 'Cor\Consulta\uConsultaCorController.pas',
  uConsultaCorForm in 'Cor\Consulta\uConsultaCorForm.pas' {ConsultaCorForm},
  uConsultaCorModel in 'Cor\Consulta\uConsultaCorModel.pas',
  uConsultaCorRegra in 'Cor\Consulta\uConsultaCorRegra.pas',
  uInterfaceConsultaCorModel in 'Cor\Consulta\uInterfaceConsultaCorModel.pas',
  uInterfaceCorModel in 'Cor\Consulta\uInterfaceCorModel.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
