object frmBase: TfrmBase
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio Base'
  ClientHeight = 360
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 89
    Align = alTop
    TabOrder = 0
    object btnSalvar: TBitBtn
      Left = 8
      Top = 16
      Width = 75
      Height = 57
      Caption = 'Salvar'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object btnPesquisar: TBitBtn
      Left = 89
      Top = 16
      Width = 75
      Height = 57
      Caption = 'Pesquisar'
      TabOrder = 1
    end
    object btnAlterar: TBitBtn
      Left = 170
      Top = 16
      Width = 75
      Height = 57
      Caption = 'Alterar'
      TabOrder = 2
    end
    object btnExcluir: TBitBtn
      Left = 421
      Top = 16
      Width = 75
      Height = 57
      Caption = 'Excluir'
      TabOrder = 3
    end
    object btnFechar: TBitBtn
      Left = 502
      Top = 16
      Width = 75
      Height = 57
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = btnFecharClick
    end
  end
  object pgControll: TPageControl
    Left = 0
    Top = 89
    Width = 593
    Height = 271
    ActivePage = Consuta
    Align = alClient
    TabOrder = 1
    object Cadastro: TTabSheet
      Caption = 'Cadastro'
    end
    object Consuta: TTabSheet
      Caption = 'Consuta'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 585
        Height = 243
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end
