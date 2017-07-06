object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 208
    Top = 104
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object CadastrodeModelos1: TMenuItem
        Caption = 'Cadastro de Modelos'
        OnClick = CadastrodeModelos1Click
      end
      object CadastroUf: TMenuItem
        Caption = 'Cadastro de UF'
        OnClick = CadastroUfClick
      end
      object CadastrodeCor: TMenuItem
        Caption = 'Cadastro de Cor'
        OnClick = CadastrodeCorClick
      end
      object CadastrodeTamanho: TMenuItem
        Caption = 'Cadastro de Tamanho'
        OnClick = CadastrodeTamanhoClick
      end
      object CadastrodePedidos: TMenuItem
        Caption = 'Cadastro de Pedidos'
        OnClick = CadastrodePedidosClick
      end
      object CadastrodeMunicipio1: TMenuItem
        Caption = 'Cadastro de Municipio'
        OnClick = CadastrodeMunicipio1Click
      end
      object CadastrodeCliente1: TMenuItem
        Caption = 'Cadastro de Cliente'
        OnClick = CadastrodeCliente1Click
      end
      object CadastrodeBairro: TMenuItem
        Caption = 'Cadastro de Bairro'
        OnClick = CadastrodeBairroClick
      end
    end
    object Relatorios1: TMenuItem
      Caption = 'Relatorios'
      object Pedidos1: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos1Click
      end
    end
  end
end
