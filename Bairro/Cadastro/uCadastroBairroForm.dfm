inherited CadastroBairroForm: TCadastroBairroForm
  Left = 360
  Top = 208
  Caption = 'Cadastro de Bairros'
  ClientHeight = 331
  ClientWidth = 501
  Position = poDesigned
  ExplicitWidth = 507
  ExplicitHeight = 360
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 501
    TabOrder = 3
    ExplicitWidth = 501
    inherited Panel3: TPanel
      Left = 415
      ExplicitLeft = 415
    end
  end
  object edtCodigo: TLabeledEdit
    Tag = 999
    Left = 83
    Top = 118
    Width = 153
    Height = 26
    Hint = 'C'#243'digo da Bairro'
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
  object edtBairro: TLabeledEdit
    Left = 83
    Top = 162
    Width = 355
    Height = 26
    Hint = 'Bairro'
    EditLabel.Width = 46
    EditLabel.Height = 23
    EditLabel.Caption = 'Bairro:'
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
  object edtMunicipio: TLabeledEdit
    Left = 83
    Top = 249
    Width = 355
    Height = 26
    Hint = 'Municipio'
    EditLabel.Width = 73
    EditLabel.Height = 23
    EditLabel.Caption = 'Municipio:'
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
    TabOrder = 2
  end
  object edtCep: TLabeledEdit
    Left = 83
    Top = 207
    Width = 355
    Height = 26
    Hint = 'CEP'
    EditLabel.Width = 33
    EditLabel.Height = 23
    EditLabel.Caption = 'CEP:'
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
