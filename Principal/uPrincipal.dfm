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
      object C1: TMenuItem
        Caption = 'Cadastro de UF'
        OnClick = C1Click
      end
    end
  end
end
