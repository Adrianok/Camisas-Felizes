inherited ConsultaModeloForm: TConsultaModeloForm
  Left = 893
  Caption = 'Consulta cadastro de Modelo'
  ClientHeight = 522
  ClientWidth = 458
  Position = poDesigned
  ExplicitWidth = 464
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 458
    ExplicitWidth = 458
  end
  object DBGrid: TDBGrid [1]
    Left = 0
    Top = 57
    Width = 458
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
        FieldName = 'idModelo'
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
    Width = 458
    Height = 385
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'idModelo'
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
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Width = 88
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 442
    Width = 458
    TabOrder = 3
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
