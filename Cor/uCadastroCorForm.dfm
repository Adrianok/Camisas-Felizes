inherited CadastroCorForm: TCadastroCorForm
  Caption = 'CadastroCorForm'
  ClientHeight = 237
  ClientWidth = 590
  ExplicitWidth = 606
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 590
    inherited Panel3: TPanel
      Left = 381
    end
  end
  inherited pgControll: TPageControl
    Width = 590
    Height = 148
    ExplicitHeight = 148
    inherited Cadastro: TTabSheet
      ExplicitTop = -5
      ExplicitHeight = 262
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
      object edtCor: TLabeledEdit
        Left = 78
        Top = 72
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
