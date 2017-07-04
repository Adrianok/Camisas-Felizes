inherited CadastroUfForm: TCadastroUfForm
  Caption = 'Cadastro de UF'
  ClientHeight = 315
  ClientWidth = 590
  ExplicitWidth = 596
  ExplicitHeight = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 590
    ExplicitWidth = 586
    inherited Panel3: TPanel
      Left = 389
      ExplicitLeft = 385
    end
  end
  inherited pgControll: TPageControl
    Width = 590
    Height = 226
    ExplicitWidth = 586
    ExplicitHeight = 225
    inherited Cadastro: TTabSheet
      Font.Height = -15
      ParentFont = False
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 578
      ExplicitHeight = 197
      object LedtCodigo: TLabeledEdit
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
        TextHint = 'C'#211'DIGO'
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
        TextHint = 'Sigla'
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
        TextHint = 'nome UF'
      end
    end
  end
end
