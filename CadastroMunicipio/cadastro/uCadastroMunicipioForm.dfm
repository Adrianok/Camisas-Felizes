inherited CadastroMunicipioForm: TCadastroMunicipioForm
  Caption = 'Cadastro de Municipio'
  ClientHeight = 315
  ClientWidth = 590
  ExplicitWidth = 596
  ExplicitHeight = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 590
    ExplicitWidth = 630
    inherited Panel3: TPanel
      Left = 389
      ExplicitLeft = 429
    end
  end
  inherited pgControll: TPageControl
    Width = 590
    Height = 226
    ExplicitWidth = 630
    ExplicitHeight = 343
    inherited Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 622
      ExplicitHeight = 315
      object LedtCodigo: TLabeledEdit
        Left = 70
        Top = 19
        Width = 121
        Height = 26
        EditLabel.Width = 37
        EditLabel.Height = 13
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
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'Municipio:'
        LabelPosition = lpLeft
        MaxLength = 2
        TabOrder = 1
        TextHint = 'Nome do municipio'
      end
      object LedtEstado: TLabeledEdit
        Left = 70
        Top = 139
        Width = 489
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 17
        EditLabel.Height = 13
        EditLabel.Caption = 'UF:'
        LabelPosition = lpLeft
        TabOrder = 2
        TextHint = 'Pesquise em F2'
      end
    end
  end
end
