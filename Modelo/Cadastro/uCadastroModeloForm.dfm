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
  object GroupBox1: TGroupBox
    Left = 208
    Top = 201
    Width = 461
    Height = 279
    Caption = 'Selecione as cores referentes ao modelo'
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object edtCor: TLabeledEdit
      Tag = 888
      Left = 48
      Top = 28
      Width = 401
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
    object ListView1: TListView
      Left = 24
      Top = 80
      Width = 425
      Height = 177
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
    Top = 201
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
    Top = 129
    Width = 105
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 3
  end
  object edtModelo: TLabeledEdit
    Left = 278
    Top = 129
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 4
  end
end
