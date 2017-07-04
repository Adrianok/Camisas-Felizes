inherited ConsultaPedidoForm: TConsultaPedidoForm
  Left = 566
  Caption = 'Consulta cadastro de Pedido'
  ClientHeight = 540
  ClientWidth = 794
  Position = poDesigned
  ExplicitTop = -5
  ExplicitWidth = 800
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 794
    ExplicitWidth = 794
  end
  inherited DBGrid1: TDBGrid
    Width = 794
    Height = 403
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    Columns = <
      item
        Expanded = False
        FieldName = 'idPedido'
        Title.Caption = 'C'#243'digo do pedido'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome do Cliente'
        Width = 298
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data do pedido'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valortotal'
        Title.Caption = 'Valor do Pedido'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Quantidade de itens'
        Width = 102
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 460
    Width = 794
    ExplicitTop = 460
    ExplicitWidth = 794
    inherited Panel3: TPanel
      Left = 509
      ExplicitLeft = 509
    end
  end
  inherited DataSourceGrid: TDataSource
    Left = 8
    Top = 472
  end
  inherited FDMemTableGrid: TFDMemTable
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evCache, evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    FetchOptions.Cache = []
    Left = 40
    Top = 472
  end
end
