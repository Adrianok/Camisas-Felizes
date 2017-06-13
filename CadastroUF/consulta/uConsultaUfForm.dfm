inherited ConsultaUfForm: TConsultaUfForm
  Left = 893
  Caption = 'Consulta cadastro de UF'
  ClientHeight = 522
  ClientWidth = 374
  Position = poDesigned
  ExplicitWidth = 390
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 374
    ExplicitWidth = 374
  end
  inherited Panel2: TPanel
    Top = 442
    Width = 374
    ExplicitTop = 442
    ExplicitWidth = 374
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 57
    Width = 374
    Height = 385
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'iduf'
        Title.Caption = 'C'#243'digo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 308
        Visible = True
      end>
  end
  object DataSource: TDataSource
    Left = 16
    Top = 474
  end
  object FDMemTableGrid: TFDMemTable
    MasterSource = DataSource
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 442
  end
end
