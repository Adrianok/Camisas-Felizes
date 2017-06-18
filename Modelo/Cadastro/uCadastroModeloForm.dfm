inherited CadastroModeloForm: TCadastroModeloForm
  Left = 340
  Top = 55
  Caption = 'CadastroModeloForm'
  ClientHeight = 480
  ClientWidth = 707
  Position = poDesigned
  ExplicitWidth = 713
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 707
    ExplicitWidth = 707
    inherited Panel3: TPanel
      Left = 506
      ExplicitLeft = 506
    end
  end
  inherited pgControll: TPageControl
    Width = 707
    Height = 391
    ExplicitWidth = 707
    ExplicitHeight = 391
    inherited Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 699
      ExplicitHeight = 363
      object edtCodigo: TLabeledEdit
        Tag = 999
        Left = 78
        Top = 16
        Width = 153
        Height = 26
        EditLabel.Width = 58
        EditLabel.Height = 23
        EditLabel.Caption = 'C'#243'digo:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -17
        EditLabel.Font.Name = 'Segoe UI Light'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 0
      end
      object edtModelo: TLabeledEdit
        Left = 318
        Top = 16
        Width = 355
        Height = 26
        EditLabel.Width = 60
        EditLabel.Height = 23
        EditLabel.Caption = 'Modelo:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -17
        EditLabel.Font.Name = 'Segoe UI Light'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 1
      end
      object edtPreco: TLabeledEdit
        Left = 78
        Top = 80
        Width = 105
        Height = 26
        EditLabel.Width = 46
        EditLabel.Height = 23
        EditLabel.Caption = 'Preco:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -17
        EditLabel.Font.Name = 'Segoe UI Light'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 216
    Top = 193
    Width = 461
    Height = 279
    Caption = 'Selecione as cores referentes ao modelo'
    Color = clWhite
    Enabled = False
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object edtCor: TLabeledEdit
      Tag = 888
      Left = 48
      Top = 28
      Width = 335
      Height = 26
      EditLabel.Width = 32
      EditLabel.Height = 23
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Cor:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -17
      EditLabel.Font.Name = 'Segoe UI Light'
      EditLabel.Font.Style = []
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 0
    end
    object btnAdicionar: TBitBtn
      Left = 389
      Top = 11
      Width = 58
      Height = 28
      Caption = '+'
      TabOrder = 1
    end
    object btnRemover: TBitBtn
      Left = 389
      Top = 42
      Width = 58
      Height = 28
      Caption = '-'
      TabOrder = 2
    end
    object ListView1: TListView
      Left = 24
      Top = 80
      Width = 393
      Height = 177
      Checkboxes = True
      Columns = <>
      GridLines = True
      MultiSelect = True
      TabOrder = 3
      ViewStyle = vsList
    end
  end
end
