inherited CadastroBairroForm: TCadastroBairroForm
  Left = 360
  Top = 208
  Caption = 'CadastroBairroForm'
  ClientHeight = 247
  ClientWidth = 501
  Position = poDesigned
  ExplicitWidth = 507
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 501
    ExplicitWidth = 501
    inherited Panel3: TPanel
      Left = 415
      ExplicitLeft = 415
    end
  end
  object edtCodigo: TLabeledEdit
    Tag = 999
    Left = 78
    Top = 120
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
  object edtBairro: TLabeledEdit
    Left = 78
    Top = 176
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
    TabOrder = 2
  end
end
