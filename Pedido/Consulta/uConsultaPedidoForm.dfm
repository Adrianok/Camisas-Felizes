inherited ConsultaPedidoForm: TConsultaPedidoForm
  Left = 893
  Caption = 'Consulta cadastro de Pedido'
  ClientHeight = 540
  ClientWidth = 794
  Position = poDesigned
  ExplicitWidth = 800
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 794
    ExplicitWidth = 794
  end
  inherited Panel2: TPanel
    Top = 460
    Width = 794
    ExplicitLeft = -224
    ExplicitTop = 452
    ExplicitWidth = 794
    inherited Panel3: TPanel
      Left = 496
      Width = 297
      ExplicitLeft = 496
      ExplicitWidth = 297
    end
  end
  object DBGrid: TDBGrid [2]
    Left = 0
    Top = 57
    Width = 794
    Height = 403
    Align = alClient
    DataSource = DataSourceGrid
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
        FieldName = 'idPedido'
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
    Width = 794
    Height = 403
    DataSource = nil
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'idPedido'
        Title.Caption = 'C'#243'digo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome do Cliente'
        Width = 273
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data do pedido'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valortotal'
        Title.Caption = 'Valor do Pedido'
        Width = 86
        Visible = True
      end>
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
