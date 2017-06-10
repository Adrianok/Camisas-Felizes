inherited CadastroCorForm: TCadastroCorForm
  Left = 360
  Top = 208
  Caption = 'CadastroCorForm'
  ClientHeight = 237
  ClientWidth = 491
  Position = poDesigned
  ExplicitWidth = 507
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 491
    ExplicitWidth = 590
    inherited Panel3: TPanel
      Left = 290
      ExplicitLeft = 412
    end
  end
  inherited pgControll: TPageControl
    Width = 491
    Height = 148
    ExplicitWidth = 590
    ExplicitHeight = 148
    inherited Cadastro: TTabSheet
      ExplicitWidth = 582
      ExplicitHeight = 120
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
        Width = 355
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
