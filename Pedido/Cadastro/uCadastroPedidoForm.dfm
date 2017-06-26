inherited CadastroPedidoForm: TCadastroPedidoForm
  Caption = 'CadastroPedidoForm'
  ClientHeight = 615
  ClientWidth = 1114
  ExplicitWidth = 1120
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl [0]
    Tag = 666
    Left = 0
    Top = 91
    Width = 1113
    Height = 478
    ActivePage = pgCabecalho
    Align = alCustom
    TabOrder = 1
    object pgCabecalho: TTabSheet
      Caption = 'Cabe'#231'alho'
      object Label3: TLabel
        Left = 2
        Top = 261
        Width = 95
        Height = 21
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object gpCliente: TGroupBox
        Left = 2
        Top = 141
        Width = 563
        Height = 116
        Caption = 'Dados do cliente'
        TabOrder = 0
        object Label6: TLabel
          Left = 46
          Top = 19
          Width = 56
          Height = 21
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCpfCnpj: TLabeledEdit
          Left = 340
          Top = 18
          Width = 213
          Height = 26
          Hint = 'CPF/CNPJ'
          CharCase = ecUpperCase
          EditLabel.Width = 74
          EditLabel.Height = 23
          EditLabel.Caption = 'CPF/CNPJ:'
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
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
        end
        object edtNomeCliente: TLabeledEdit
          AlignWithMargins = True
          Left = 118
          Top = 66
          Width = 435
          Height = 26
          Hint = 'Nome do Cliente'
          CharCase = ecUpperCase
          EditLabel.Width = 49
          EditLabel.Height = 23
          EditLabel.Caption = 'Nome:'
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
          TabOrder = 1
        end
        object edtNmClient: TLabeledEdit
          Tag = 999
          Left = 111
          Top = 18
          Width = 109
          Height = 26
          Hint = 'C'#243'digo do cliente'
          CharCase = ecUpperCase
          EditLabel.Width = 5
          EditLabel.Height = 23
          EditLabel.Caption = ' '
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
          TabOrder = 2
        end
      end
      object gpEntrega: TGroupBox
        Tag = 999
        Left = 571
        Top = 3
        Width = 532
        Height = 254
        Caption = 'Dados da entrega'
        Enabled = False
        TabOrder = 1
        object Label2: TLabel
          Left = 208
          Top = 13
          Width = 158
          Height = 21
          Caption = 'Previs'#227'o de entrega: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtReceptor: TLabeledEdit
          Tag = 888
          AlignWithMargins = True
          Left = 88
          Top = 204
          Width = 432
          Height = 26
          Hint = 'Nome do receptor'
          CharCase = ecUpperCase
          EditLabel.Width = 71
          EditLabel.Height = 23
          EditLabel.Caption = 'Receptor:'
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
        object edtCidade: TLabeledEdit
          Tag = 888
          Left = 114
          Top = 156
          Width = 406
          Height = 26
          Hint = 'Cidade'
          CharCase = ecUpperCase
          EditLabel.Width = 60
          EditLabel.Height = 23
          EditLabel.Caption = 'Cidade :'
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
          TabOrder = 1
        end
        object edtRua: TLabeledEdit
          Tag = 888
          Left = 114
          Top = 106
          Width = 406
          Height = 26
          Hint = 'Rua'
          CharCase = ecUpperCase
          EditLabel.Width = 30
          EditLabel.Height = 23
          EditLabel.Caption = 'Rua:'
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
        object edtNmr: TLabeledEdit
          Tag = 888
          Left = 114
          Top = 58
          Width = 84
          Height = 26
          Hint = 'Numero'
          CharCase = ecUpperCase
          EditLabel.Width = 23
          EditLabel.Height = 23
          EditLabel.Caption = 'N'#186':'
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
          NumbersOnly = True
          ParentFont = False
          TabOrder = 3
        end
        object dtePrev: TDateTimePicker
          Left = 372
          Top = 12
          Width = 150
          Height = 26
          Hint = 'Previs'#227'o de entrega'
          Date = 42907.820127361110000000
          Time = 42907.820127361110000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtBairro: TLabeledEdit
          Tag = 888
          Left = 293
          Top = 58
          Width = 227
          Height = 26
          Hint = 'Bairro'
          CharCase = ecUpperCase
          EditLabel.Width = 46
          EditLabel.Height = 23
          EditLabel.Caption = 'Bairro:'
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
          TabOrder = 5
        end
      end
      object gpNota: TGroupBox
        Left = 2
        Top = 3
        Width = 563
        Height = 138
        Caption = 'Dados da Nota'
        TabOrder = 2
        object Label1: TLabel
          Left = 385
          Top = 13
          Width = 42
          Height = 21
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 52
          Top = 13
          Width = 141
          Height = 21
          Caption = 'N'#250'mero do pedido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCodigo: TLabeledEdit
          Tag = 999
          Left = 211
          Top = 12
          Width = 121
          Height = 26
          Hint = 'C'#243'digo do pedido'
          CharCase = ecUpperCase
          EditLabel.Width = 5
          EditLabel.Height = 23
          EditLabel.Caption = ' '
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
        object dteData: TDateTimePicker
          Left = 440
          Top = 12
          Width = 113
          Height = 26
          Hint = 'Data do pedido'
          Date = 42907.820127361110000000
          Time = 42907.820127361110000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtNomeVendedor: TLabeledEdit
          AlignWithMargins = True
          Left = 216
          Top = 58
          Width = 337
          Height = 26
          Hint = 'Nome do vendedor'
          CharCase = ecUpperCase
          EditLabel.Width = 76
          EditLabel.Height = 23
          EditLabel.Caption = 'Vendedor:'
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
      object edtObservacoes: TMemo
        Tag = 888
        Left = 2
        Top = 288
        Width = 504
        Height = 159
        Hint = 'Observa'#231#227'o'
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object chkAltEnd: TCheckBox
        Tag = 666
        Left = 579
        Top = 21
        Width = 174
        Height = 17
        Caption = 'Adicionar endere'#231'o'
        TabOrder = 4
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  inherited Panel1: TPanel
    Width = 1114
    ExplicitWidth = 1114
    inherited Panel3: TPanel
      Left = 913
      ExplicitLeft = 913
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 568
    Width = 1114
    Height = 47
    Align = alBottom
    Caption = 'Dados gerais'
    TabOrder = 2
    object Label4: TLabel
      Left = 72
      Top = 16
      Width = 57
      Height = 21
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 663
      Top = 16
      Width = 160
      Height = 21
      Caption = 'Valor total do pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNomeClienteEx: TLabeledEdit
      Tag = 999
      AlignWithMargins = True
      Left = 147
      Top = 15
      Width = 442
      Height = 26
      Hint = 'Nome do Cliente'
      CharCase = ecUpperCase
      EditLabel.Width = 5
      EditLabel.Height = 23
      EditLabel.Caption = ' '
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
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
    end
    object edtValorTotal: TLabeledEdit
      Tag = 999
      Left = 829
      Top = 15
      Width = 265
      Height = 26
      Hint = 'Valor total do pedido'
      CharCase = ecUpperCase
      EditLabel.Width = 5
      EditLabel.Height = 23
      EditLabel.Caption = ' '
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
  end
end
