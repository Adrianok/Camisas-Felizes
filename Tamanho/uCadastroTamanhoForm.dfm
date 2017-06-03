inherited CadastroTamanhoForm: TCadastroTamanhoForm
  Caption = 'CadastroTamanhoForm'
  ClientHeight = 239
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgControll: TPageControl
    Height = 150
    inherited Cadastro: TTabSheet
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
      object edtTamanho: TLabeledEdit
        Left = 78
        Top = 72
        Width = 487
        Height = 26
        EditLabel.Width = 68
        EditLabel.Height = 23
        EditLabel.Caption = 'Tamanho:'
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
    end
  end
end
