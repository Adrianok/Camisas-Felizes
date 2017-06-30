inherited CadastroModeloForm: TCadastroModeloForm
  Left = 340
  Top = 55
  Caption = 'CadastroModeloForm'
  ClientHeight = 407
  ClientWidth = 663
  Position = poDesigned
  ExplicitWidth = 669
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 663
    TabOrder = 4
    ExplicitWidth = 707
    inherited Panel3: TPanel
      Left = 462
      ExplicitLeft = 506
    end
  end
  object GroupBox1: TGroupBox
    Left = 223
    Top = 146
    Width = 441
    Height = 255
    Caption = 'Selecione as cores referentes ao modelo'
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label1: TLabel
      Left = 39
      Top = 58
      Width = 80
      Height = 13
      Caption = 'Seletor de Cores'
    end
    object edtCor: TLabeledEdit
      Tag = 888
      Left = 39
      Top = 23
      Width = 383
      Height = 26
      Hint = 'Cor'
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
    object ListView1: TListView
      Left = 39
      Top = 74
      Width = 383
      Height = 169
      Hint = 'Cores'
      Checkboxes = True
      Columns = <>
      GridLines = True
      MultiSelect = True
      TabOrder = 1
      ViewStyle = vsList
    end
  end
  object edtPreco: TLabeledEdit
    Left = 70
    Top = 150
    Width = 105
    Height = 26
    Hint = 'Preco'
    EditLabel.Width = 46
    EditLabel.Height = 23
    EditLabel.Caption = 'Pre'#231'o:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -17
    EditLabel.Font.Name = 'Segoe UI Light'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
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
  object edtCodigo: TLabeledEdit
    Tag = 999
    Left = 70
    Top = 110
    Width = 105
    Height = 26
    Hint = 'Codigo'
    EditLabel.Width = 58
    EditLabel.Height = 23
    EditLabel.Caption = 'C'#243'digo:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -17
    EditLabel.Font.Name = 'Segoe UI Light'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
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
    Left = 262
    Top = 110
    Width = 383
    Height = 26
    Hint = 'Modelo'
    EditLabel.Width = 60
    EditLabel.Height = 23
    EditLabel.Caption = 'Modelo:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -17
    EditLabel.Font.Name = 'Segoe UI Light'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 1
  end
end
