inherited frmBase1: TfrmBase1
  Caption = 'Cadastro de UF'
  ClientHeight = 390
  ClientWidth = 600
  ExplicitWidth = 616
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 600
    inherited Panel3: TPanel
      Left = 391
    end
  end
  inherited pgControll: TPageControl
    Width = 600
    Height = 301
    ExplicitLeft = 1
    ExplicitTop = 91
    ExplicitWidth = 694
    ExplicitHeight = 301
    inherited Cadastro: TTabSheet
      ExplicitLeft = 8
      ExplicitTop = -40
      ExplicitWidth = 603
      ExplicitHeight = 196
      object LedtCódigo: TLabeledEdit
        Left = 60
        Top = 19
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'C'#243'digo'
        EditLabel.ParentBiDiMode = False
        EditLabel.Layout = tlBottom
        LabelPosition = lpLeft
        TabOrder = 0
        TextHint = 'C'#243'd'
      end
      object LedtUf: TLabeledEdit
        Left = 60
        Top = 75
        Width = 489
        Height = 21
        EditLabel.Width = 13
        EditLabel.Height = 13
        EditLabel.Caption = 'UF'
        LabelPosition = lpLeft
        MaxLength = 2
        TabOrder = 1
      end
      object LedtNome: TLabeledEdit
        Left = 60
        Top = 139
        Width = 489
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        LabelPosition = lpLeft
        TabOrder = 2
      end
    end
    inherited Consuta: TTabSheet
      ExplicitTop = 26
      ExplicitWidth = 603
      ExplicitHeight = 166
      inherited DBGrid1: TDBGrid
        Width = 592
        Height = 273
      end
    end
  end
end
