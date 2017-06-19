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
  uCadastroModeloForm in 'Modelo\uCadastroModeloForm.pas' {frmCadastroModelo},
  uPrincipal in 'Principal\uPrincipal.pas' {frmPrincipal},
  uCadastroUfController in 'CadastroUF\uCadastroUfController.pas',
  uCadastroUfDto in 'CadastroUF\uCadastroUfDto.pas',
  uCadastroUfForm in 'CadastroUF\uCadastroUfForm.pas' {Cadastro de UF},
  uCadastroUfModel in 'CadastroUF\uCadastroUfModel.pas',
  uCadastroUfRegra in 'CadastroUF\uCadastroUfRegra.pas',
  uCadastroModeloRegra in 'Modelo\uCadastroModeloRegra.pas',
  uClasseInterfaceViewBase in 'Base\uClasseInterfaceViewBase.pas',
  uInterfaceViewBase in 'Base\uInterfaceViewBase.pas',
  uInterfaceCadastroModeloModel in 'Modelo\uInterfaceCadastroModeloModel.pas',
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
  uConsultaCorForm in 'Cor\Consulta\uConsultaCorForm.pas' {ConsultaCorForm},
  uConsultaCorModel in 'Cor\Consulta\uConsultaCorModel.pas',
  uConsultaCorRegra in 'Cor\Consulta\uConsultaCorRegra.pas',
  uInterfaceConsultaCorModel in 'Cor\Consulta\uInterfaceConsultaCorModel.pas',
  Vcl.Themes,
  Vcl.Styles,
  uCadastroMunicipioController in 'CadastroMunicipio\cadastro\uCadastroMunicipioController.pas',
  uCadastroMunicipioDto in 'CadastroMunicipio\cadastro\uCadastroMunicipioDto.pas',
  uCadastroMunicipioModel in 'CadastroMunicipio\cadastro\uCadastroMunicipioModel.pas',
  uCadastroMunicipioRegra in 'CadastroMunicipio\cadastro\uCadastroMunicipioRegra.pas',
  uInterfaceCadastroMunicipioModel in 'CadastroMunicipio\cadastro\uInterfaceCadastroMunicipioModel.pas',
  uConsultaMunicipioController in 'CadastroMunicipio\consulta\uConsultaMunicipioController.pas',
  uConsultaMunicipioForm in 'CadastroMunicipio\consulta\uConsultaMunicipioForm.pas' {ConsultaUfForm},
  uConsultaMunicipioModel in 'CadastroMunicipio\consulta\uConsultaMunicipioModel.pas',
  uConsultaMunicipioRegra in 'CadastroMunicipio\consulta\uConsultaMunicipioRegra.pas',
  uInterfaceConsultaMunicipioModel in 'CadastroMunicipio\consulta\uInterfaceConsultaMunicipioModel.pas',
  uInterfaceMunicipioModel in 'CadastroMunicipio\consulta\uInterfaceMunicipioModel.pas',
  uCadastroTamanhoController in 'Tamanho\Cadastro\uCadastroTamanhoController.pas',
  uCadastroTamanhoDto in 'Tamanho\Cadastro\uCadastroTamanhoDto.pas',
  uCadastroTamanhoForm in 'Tamanho\Cadastro\uCadastroTamanhoForm.pas' {CadastroTamanhoForm},
  uCadastroTamanhoModel in 'Tamanho\Cadastro\uCadastroTamanhoModel.pas',
  uCadastroTamanhoRegra in 'Tamanho\Cadastro\uCadastroTamanhoRegra.pas',
  uInterfaceCadastroTamanhoModel in 'Tamanho\Cadastro\uInterfaceCadastroTamanhoModel.pas',
  uConsultaTamanhoController in 'Tamanho\Consulta\uConsultaTamanhoController.pas',
  uConsultaTamanhoForm in 'Tamanho\Consulta\uConsultaTamanhoForm.pas' {ConsultaTamanhoForm},
  uConsultaTamanhoModel in 'Tamanho\Consulta\uConsultaTamanhoModel.pas',
  uConsultaTamanhoRegra in 'Tamanho\Consulta\uConsultaTamanhoRegra.pas',
  uInterfaceConsultaTamanhoModel in 'Tamanho\Consulta\uInterfaceConsultaTamanhoModel.pas',
  uInterfaceTamanhoModel in 'Tamanho\Consulta\uInterfaceTamanhoModel.pas',
  uCadastroMunicipioForm in 'CadastroMunicipio\cadastro\uCadastroMunicipioForm.pas' {CadastroMunicipioForm};

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
