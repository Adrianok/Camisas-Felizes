inherited CadastroMunicipioForm: TCadastroMunicipioForm
  Caption = 'Cadastro de Municipio'
  ClientHeight = 314
  ClientWidth = 600
  ExplicitWidth = 606
  ExplicitHeight = 343
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 600
    ExplicitWidth = 600
    inherited Panel3: TPanel
      Left = 399
      ExplicitLeft = 399
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
      object LedtCodigo: TLabeledEdit
        Tag = 999
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
      object LedtMunicipio: TLabeledEdit
        Left = 70
        Top = 75
        Width = 489
        Height = 26
        CharCase = ecUpperCase
        EditLabel.Width = 62
        EditLabel.Height = 18
        EditLabel.Caption = 'Municipio:'
        LabelPosition = lpLeft
        MaxLength = 2
        TabOrder = 1
        TextHint = 'descreva o municipio'
      end
      object LedtEstado: TLabeledEdit
        Left = 70
        Top = 139
        Width = 489
        Height = 26
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 18
        EditLabel.Caption = 'Estado:'
        LabelPosition = lpLeft
        TabOrder = 2
        TextHint = 'nome Municipio'
      end
    end
  end
end
