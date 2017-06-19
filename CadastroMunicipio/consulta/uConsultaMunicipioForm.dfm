inherited ConsultaUfForm: TConsultaUfForm
  Left = 893
  Caption = 'Consulta cadastro de UF'
  ClientHeight = 522
  ClientWidth = 374
  Position = poDesigned
  ExplicitWidth = 380
  ExplicitHeight = 551
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
  inherited DBGrid1: TDBGrid
    Width = 374
    Height = 385
    Columns = <
      item
        Expanded = False
        FieldName = 'iduf'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        ImeName = 'sigla'
        Title.Caption = 'Sigla'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 210
        Visible = True
      end>
  end
  inherited DataSourceGrid: TDataSource
    Left = 128
    Top = 328
  end
  inherited FDMemTableGrid: TFDMemTable
    Left = 48
    Top = 329
  end
end
