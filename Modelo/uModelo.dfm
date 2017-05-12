inherited frmCadastroModelo: TfrmCadastroModelo
  Caption = 'frmCadastroModelo'
  ClientHeight = 242
  ClientWidth = 597
  ExplicitWidth = 613
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 597
    inherited Panel3: TPanel
      Left = 388
      inherited btnFechar: TBitBtn
        Cancel = True
      end
    end
  end
  inherited pgControll: TPageControl
    Width = 597
    Height = 153
    inherited Cadastro: TTabSheet
      ExplicitTop = 24
      object edtModelo: TLabeledEdit
        Left = 70
        Top = 72
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
        TabOrder = 0
      end
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
        TabOrder = 1
      end
      object edtPreCo: TLabeledEdit
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
        TabOrder = 2
      end
    end
    inherited Consuta: TTabSheet
      inherited DBGrid1: TDBGrid
        Width = 589
        Height = 125
      end
    end
  end
end
