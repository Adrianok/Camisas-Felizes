inherited ConsultaMunicipioForm: TConsultaMunicipioForm
  Left = 893
  Caption = 'Consulta cadastro de Municipio'
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    Columns = <
      item
        Expanded = False
        FieldName = 'idMunicipio'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf_iduf'
        ImeName = 'sigla'
        Title.Caption = 'Estado'
        Width = 60
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
