object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Camisas Felizes'
  ClientHeight = 464
  ClientWidth = 662
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 23
  object MainMenu1: TMainMenu
    Left = 176
    Top = 40
    object CadastroModelo: TMenuItem
      Caption = 'Cadastros'
      object Cadastrodemodelos: TMenuItem
        Caption = 'Cadastro de modelos'
        OnClick = CadastrodemodelosClick
      end
      object C1: TMenuItem
        Caption = 'Cadastro de UF'
        OnClick = C1Click
      end
    end
  end
end
