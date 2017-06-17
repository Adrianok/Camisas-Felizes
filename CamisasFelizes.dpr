program CamisasFelizes;

uses
  Vcl.Forms,
  uConexao in 'ConexãoBD\uConexao.pas',
  uConexaoSingleTon in 'ConexãoBD\uConexaoSingleTon.pas',
  uBase in 'Base\uBase.pas' {frmBase},
  uConsultaBase in 'Base\uConsultaBase.pas' {frmPesquisaBase},
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uCadastroUfController in 'CadastroUF\uCadastroUfController.pas',
  uCadastroUfDto in 'CadastroUF\uCadastroUfDto.pas',
  uCadastroUfForm in 'CadastroUF\uCadastroUfForm.pas' {Cadastro de UF},
  uCadastroUfModel in 'CadastroUF\uCadastroUfModel.pas',
  uCadastroUfRegra in 'CadastroUF\uCadastroUfRegra.pas',
  uClasseInterfaceViewBase in 'Base\uClasseInterfaceViewBase.pas',
  uInterfaceViewBase in 'Base\uInterfaceViewBase.pas',
  uCadastroCorController in 'Cor\Cadastro\uCadastroCorController.pas',
  uCadastroCorDto in 'Cor\Cadastro\uCadastroCorDto.pas',
  uCadastroCorForm in 'Cor\Cadastro\uCadastroCorForm.pas' {CadastroCorForm},
  uCadastroCorModel in 'Cor\Cadastro\uCadastroCorModel.pas',
  uCadastroCorRegra in 'Cor\Cadastro\uCadastroCorRegra.pas',
  uInterfaceCadastroCorModel in 'Cor\Cadastro\uInterfaceCadastroCorModel.pas',
  uIterfaceCadastroUfModel in 'CadastroUF\uIterfaceCadastroUfModel.pas',
  uInterfaceConsultaBase in 'Base\uInterfaceConsultaBase.pas',
  uClasseInterfaceConsultaBase in 'Base\uClasseInterfaceConsultaBase.pas',
  uConsultaCorController in 'Cor\Consulta\uConsultaCorController.pas',
  uConsultaCorForm in 'Cor\Consulta\uConsultaCorForm.pas' {ConsultaCorForma},
  uConsultaCorModel in 'Cor\Consulta\uConsultaCorModel.pas',
  uConsultaCorRegra in 'Cor\Consulta\uConsultaCorRegra.pas',
  uInterfaceConsultaCorModel in 'Cor\Consulta\uInterfaceConsultaCorModel.pas',
  Vcl.Themes,
  Vcl.Styles,
  uCadastroTamanhoController in 'Tamanho\Cadastro\uCadastroTamanhoController.pas',
  uCadastroTamanhoDto in 'Tamanho\Cadastro\uCadastroTamanhoDto.pas',
  uCadastroTamanhoForm in 'Tamanho\Cadastro\uCadastroTamanhoForm.pas' {CadastroTamanhoForm},
  uCadastroTamanhoModel in 'Tamanho\Cadastro\uCadastroTamanhoModel.pas',
  uCadastroTamanhoRegra in 'Tamanho\Cadastro\uCadastroTamanhoRegra.pas',
  uInterfaceCadastroTamanhoModel in 'Tamanho\Cadastro\uInterfaceCadastroTamanhoModel.pas',
  uConsultaTamanhoController in 'Tamanho\Consulta\uConsultaTamanhoController.pas',
  uConsultaTamanhoModel in 'Tamanho\Consulta\uConsultaTamanhoModel.pas',
  uConsultaTamanhoRegra in 'Tamanho\Consulta\uConsultaTamanhoRegra.pas',
  uInterfaceConsultaTamanhoModel in 'Tamanho\Consulta\uInterfaceConsultaTamanhoModel.pas',
  uInterfaceTamanhoModel in 'Tamanho\Consulta\uInterfaceTamanhoModel.pas',
  uConsultaTamanhoForm in 'Tamanho\Consulta\uConsultaTamanhoForm.pas' {ConsultaTamanhoForm},
  uCadastroModeloController in 'Modelo\Cadastro\uCadastroModeloController.pas',
  uCadastroModeloDto in 'Modelo\Cadastro\uCadastroModeloDto.pas',
  uCadastroModeloForm in 'Modelo\Cadastro\uCadastroModeloForm.pas' {CadastroModeloForm},
  uCadastroModeloModel in 'Modelo\Cadastro\uCadastroModeloModel.pas',
  uCadastroModeloRegra in 'Modelo\Cadastro\uCadastroModeloRegra.pas',
  uInterfaceCadastroModeloModel in 'Modelo\Cadastro\uInterfaceCadastroModeloModel.pas',
  uConsultaModeloController in 'Modelo\Consulta\uConsultaModeloController.pas',
  uConsultaModeloForm in 'Modelo\Consulta\uConsultaModeloForm.pas' {ConsultaModeloForm},
  uConsultaModeloModel in 'Modelo\Consulta\uConsultaModeloModel.pas',
  uConsultaModeloRegra in 'Modelo\Consulta\uConsultaModeloRegra.pas',
  uInterfaceConsultaModeloModel in 'Modelo\Consulta\uInterfaceConsultaModeloModel.pas',
  uInterfaceModeloModel in 'Modelo\Consulta\uInterfaceModeloModel.pas',
  uInterfaceCor_ModeloModel in 'Cor_Modelo\uInterfaceCor_ModeloModel.pas',
  uCor_ModeloModel in 'Cor_Modelo\uCor_ModeloModel.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
