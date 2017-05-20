inherited CadastroUfForm: TCadastroUfForm
  Caption = 'Cadastro de UF'
  ClientHeight = 314
  ClientWidth = 600
  ExplicitWidth = 616
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 600
    ExplicitWidth = 600
    inherited Panel3: TPanel
      Left = 391
      ExplicitLeft = 391
    end
  end
  inherited pgControll: TPageControl
    Width = 600
    Height = 225
    ExplicitWidth = 600
    ExplicitHeight = 225
    inherited Cadastro: TTabSheet
      Font.Height = -15
      ParentFont = False
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 592
      ExplicitHeight = 197
      object LedtCódigo: TLabeledEdit
        Left = 70
        Top = 19
        Width = 121
        Height = 26
        EditLabel.Width = 48
        EditLabel.Height = 18
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'C'#243'digo:'
        EditLabel.ParentBiDiMode = False
        EditLabel.Layout = tlBottom
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 0
        TextHint = 'C'#243'd'
      end
      object LedtUf: TLabeledEdit
        Left = 70
        Top = 75
        Width = 489
        Height = 26
        CharCase = ecUpperCase
        EditLabel.Width = 23
        EditLabel.Height = 18
        EditLabel.Caption = 'UF:'
        LabelPosition = lpLeft
        MaxLength = 2
        TabOrder = 1
      end
      object LedtNome: TLabeledEdit
        Left = 70
        Top = 139
        Width = 489
        Height = 26
        CharCase = ecUpperCase
        EditLabel.Width = 44
        EditLabel.Height = 18
        EditLabel.Caption = 'Nome:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
    end
    inherited Consuta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 592
      ExplicitHeight = 197
      inherited DBGrid1: TDBGrid
        Width = 592
        Height = 197
      end
    end
  end
end
