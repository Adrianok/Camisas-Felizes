inherited CadastroModeloForm: TCadastroModeloForm
  Left = 340
  Top = 55
  Caption = 'CadastroModeloForm'
  ClientHeight = 480
  ClientWidth = 707
  Position = poDesigned
  ExplicitTop = -53
  ExplicitWidth = 713
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 707
    ExplicitWidth = 707
    inherited Panel3: TPanel
      Left = 506
      ExplicitLeft = 506
    end
  end
  inherited pgControll: TPageControl
    Width = 707
    Height = 391
    ExplicitWidth = 707
    ExplicitHeight = 391
    inherited Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 699
      ExplicitHeight = 363
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
      object edtModelo: TLabeledEdit
        Left = 318
        Top = 16
        Width = 355
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
      object edtPreco: TLabeledEdit
        Left = 78
        Top = 80
        Width = 105
        Height = 26
        EditLabel.Width = 46
        EditLabel.Height = 23
        EditLabel.Caption = 'Preco:'
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
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 216
    Top = 193
    Width = 461
    Height = 279
    Caption = 'Selecione as cores referentes ao modelo'
    Color = clWhite
    Enabled = False
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object LabeledEdit1: TLabeledEdit
      Left = 48
      Top = 28
      Width = 335
      Height = 26
      EditLabel.Width = 32
      EditLabel.Height = 23
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Cor:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -17
      EditLabel.Font.Name = 'Segoe UI Light'
      EditLabel.Font.Style = []
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
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
    object DBGrid1: TDBGrid
      Left = 3
      Top = 72
      Width = 455
      Height = 204
      DataSource = DataSource
      Enabled = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cor_idcor'
          Title.Caption = 'C'#243'digo'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 321
          Visible = True
        end>
    end
    object btnAdicionar: TBitBtn
      Left = 389
      Top = 11
      Width = 58
      Height = 28
      Caption = '+'
      TabOrder = 2
    end
    object btnRemover: TBitBtn
      Left = 389
      Top = 42
      Width = 58
      Height = 28
      Caption = '-'
      TabOrder = 3
    end
  end
  object MemTableCor: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 336
  end
  object DataSource: TDataSource
    DataSet = MemTableCor
    Left = 64
    Top = 416
  end
end
