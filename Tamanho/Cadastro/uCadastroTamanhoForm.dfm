inherited CadastroTamanhoForm: TCadastroTamanhoForm
  Caption = 'Cadastro de Tamanhos'
  ClientHeight = 239
  ExplicitHeight = 268
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    TabOrder = 2
  end
  object edtTamanho: TLabeledEdit
    Left = 94
    Top = 160
    Width = 487
    Height = 26
    Hint = 'Tamanho'
    CharCase = ecUpperCase
    EditLabel.Width = 68
    EditLabel.Height = 23
    EditLabel.Caption = 'Tamanho:'
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
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    TextHint = 'Informe os tamanhos dispon'#237'veis'
  end
  object edtCodigo: TLabeledEdit
    Tag = 999
    Left = 94
    Top = 104
    Width = 153
    Height = 26
    Hint = 'C'#243'digo do tamanho'
    CharCase = ecUpperCase
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
end
