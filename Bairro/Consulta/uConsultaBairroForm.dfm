inherited ConsultaBairroForm: TConsultaBairroForm
  Left = 893
  Caption = 'Consulta cadastro de Bairro'
  ClientHeight = 522
  ClientWidth = 374
  Position = poDesigned
  ExplicitTop = -95
  ExplicitWidth = 380
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 374
    ExplicitWidth = 374
  end
  object DBGrid: TDBGrid [1]
    Left = 0
    Top = 57
    Width = 374
    Height = 385
    Align = alClient
    DataSource = DataSourceGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idBairro'
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
  inherited DBGrid1: TDBGrid
    Width = 374
    Height = 385
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'idBairro'
        Title.Caption = 'C'#243'digo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 273
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 442
    Width = 374
    TabOrder = 3
    ExplicitLeft = 0
    ExplicitTop = 442
    ExplicitWidth = 374
    inherited Panel3: TPanel
      Left = 89
      ExplicitLeft = 89
    end
  end
  inherited DataSourceGrid: TDataSource
    Left = 8
    Top = 472
  end
  inherited FDMemTableGrid: TFDMemTable
    Left = 40
    Top = 472
  end
end
