inherited CadastroModeloForm: TCadastroModeloForm
  Caption = 'CadastroModeloForm'
  ClientHeight = 291
  ClientWidth = 597
  ExplicitWidth = 613
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 597
    ExplicitWidth = 597
    inherited Panel3: TPanel
      Left = 388
      ExplicitLeft = 388
      inherited btnFechar: TBitBtn
        Cancel = True
        OnClick = btnFecharClick
      end
    end
  end
  inherited pgControll: TPageControl
    Width = 597
    Height = 202
    ExplicitWidth = 597
    ExplicitHeight = 202
    inherited Cadastro: TTabSheet
      ExplicitWidth = 589
      ExplicitHeight = 174
      object edtCodigo: TLabeledEdit
        Left = 70
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
      object edtPreco: TLabeledEdit
        Left = 320
        Top = 16
        Width = 237
        Height = 26
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
        ParentFont = False
        TabOrder = 1
      end
      object edtModelo: TLabeledEdit
        Left = 70
        Top = 75
        Width = 487
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
        TabOrder = 2
      end
      object edtCor: TLabeledEdit
        Left = 70
        Top = 128
        Width = 487
        Height = 26
        EditLabel.Width = 32
        EditLabel.Height = 23
        EditLabel.Caption = 'Cor:'
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
    end
  end
end
