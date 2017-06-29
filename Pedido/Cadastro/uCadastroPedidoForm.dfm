inherited CadastroPedidoForm: TCadastroPedidoForm
  Caption = 'CadastroPedidoForm'
  ClientHeight = 615
  ClientWidth = 964
  ExplicitWidth = 970
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 964
    ExplicitWidth = 964
    inherited Panel2: TPanel
      ExplicitTop = 1
      ExplicitHeight = 70
      inherited btnNovo: TBitBtn
        Left = 3
        ExplicitLeft = 3
      end
    end
    inherited Panel3: TPanel
      Left = 878
      ExplicitLeft = 878
      ExplicitHeight = 70
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 568
    Width = 964
    Height = 47
    Align = alBottom
    Caption = 'Dados gerais'
    TabOrder = 1
    object Label4: TLabel
      Left = 6
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
      Left = 811
      Top = 16
      Width = 44
      Height = 21
      Caption = 'Total:'
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
      Left = 66
      Top = 15
      Width = 255
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
      Left = 856
      Top = 15
      Width = 102
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
  object pgItens: TPageControl
    Tag = 666
    Left = 0
    Top = 84
    Width = 1113
    Height = 478
    ActivePage = TabSheet1
    Align = alCustom
    TabOrder = 2
    object pgCabecalho: TTabSheet
      Caption = 'Cabe'#231'alho'
      object gpEntrega: TGroupBox
        Left = 420
        Top = 3
        Width = 532
        Height = 227
        Caption = 'Dados da entrega'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label2: TLabel
          Left = 234
          Top = 17
          Width = 123
          Height = 16
          Caption = 'Previs'#227'o de entrega: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dtePrev: TDateTimePicker
          Left = 359
          Top = 14
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
          TabOrder = 0
        end
        object edtReceptor: TLabeledEdit
          Tag = 888
          AlignWithMargins = True
          Left = 103
          Top = 47
          Width = 406
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
          TabOrder = 1
        end
        object GroupBox5: TGroupBox
          Tag = 999
          Left = 16
          Top = -241
          Width = 516
          Height = 119
          Caption = 'Endere'#231'o'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object LabeledEdit2: TLabeledEdit
            Tag = 888
            Left = 103
            Top = 13
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
            TabOrder = 0
          end
          object LabeledEdit3: TLabeledEdit
            Tag = 888
            Left = 103
            Top = 47
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
            TabOrder = 1
          end
          object LabeledEdit4: TLabeledEdit
            Tag = 888
            Left = 282
            Top = 47
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
            TabOrder = 2
          end
          object LabeledEdit5: TLabeledEdit
            Tag = 888
            Left = 103
            Top = 82
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
            TabOrder = 3
          end
        end
        object GroupBox2: TGroupBox
          Tag = 999
          Left = 0
          Top = 82
          Width = 537
          Height = 154
          Caption = 'Endere'#231'o'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtRua: TLabeledEdit
            Tag = 888
            Left = 103
            Top = 15
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
            TabOrder = 0
          end
          object edtNmr: TLabeledEdit
            Tag = 888
            Left = 103
            Top = 62
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
            TabOrder = 1
          end
          object edtBairro: TLabeledEdit
            Tag = 888
            Left = 282
            Top = 62
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
            TabOrder = 2
          end
          object edtCidade: TLabeledEdit
            Tag = 888
            Left = 103
            Top = 110
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
            TabOrder = 3
          end
        end
      end
      object gpCliente: TGroupBox
        Left = 3
        Top = 132
        Width = 412
        Height = 101
        Caption = 'Dados do cliente'
        TabOrder = 0
        object Label6: TLabel
          Left = 231
          Top = 16
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
        object Label8: TLabel
          Left = 63
          Top = 64
          Width = 78
          Height = 21
          Caption = 'CPF/CNPJ:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCpfCnpj: TLabeledEdit
          Left = 147
          Top = 63
          Width = 255
          Height = 26
          Hint = 'CPF/CNPJ'
          CharCase = ecUpperCase
          EditLabel.Width = 83
          EditLabel.Height = 23
          EditLabel.Caption = 'edtCpfCnpj'
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
        object edtNmClient: TLabeledEdit
          Tag = 999
          Left = 293
          Top = 15
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
          TabOrder = 1
        end
      end
      object gpNota: TGroupBox
        Left = 2
        Top = 3
        Width = 412
        Height = 80
        Caption = 'Dados do pedido'
        TabOrder = 2
        object Label1: TLabel
          Left = 242
          Top = 15
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
          Left = 4
          Top = 15
          Width = 125
          Height = 18
          Caption = 'N'#250'mero do pedido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 87
          Top = 26
          Width = 5
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 66
          Top = 47
          Width = 60
          Height = 16
          Caption = 'Vendedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCodigo: TLabeledEdit
          Tag = 999
          Left = 148
          Top = 15
          Width = 82
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
          Left = 290
          Top = 14
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
          Left = 148
          Top = 47
          Width = 255
          Height = 26
          Hint = 'Nome do vendedor'
          CharCase = ecUpperCase
          EditLabel.Width = 140
          EditLabel.Height = 23
          EditLabel.Caption = 'edtNomeVendedor'
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
      object chkAltEnd: TCheckBox
        Tag = 666
        Left = 428
        Top = 21
        Width = 174
        Height = 17
        Caption = 'Adicionar endere'#231'o'
        TabOrder = 3
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 247
        Width = 639
        Height = 170
        Caption = 'Dados do cliente'
        TabOrder = 4
        object Label3: TLabel
          Left = 10
          Top = 13
          Width = 73
          Height = 16
          Caption = 'Observa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtObservacoes: TMemo
          Tag = 888
          Left = 10
          Top = 36
          Width = 604
          Height = 121
          Hint = 'Observa'#231#227'o'
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 82
        Width = 411
        Height = 53
        Caption = 'Dados do cliente'
        TabOrder = 5
        object Label9: TLabel
          Left = 79
          Top = 18
          Width = 62
          Height = 21
          Caption = 'Usu'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LabeledEdit1: TLabeledEdit
          Left = 147
          Top = 18
          Width = 255
          Height = 26
          Hint = 'CPF/CNPJ'
          CharCase = ecUpperCase
          EditLabel.Width = 90
          EditLabel.Height = 23
          EditLabel.Caption = 'LabeledEdit1'
          EditLabel.Color = clBackground
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -17
          EditLabel.Font.Name = 'Segoe UI Light'
          EditLabel.Font.Style = []
          EditLabel.ParentColor = False
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
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object Label19: TLabel
        Left = 59
        Top = 236
        Width = 88
        Height = 16
        Caption = 'Itens do pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 599
        Top = 236
        Width = 106
        Height = 16
        Caption = 'Tamanhos e cores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox6: TGroupBox
        Left = 61
        Top = -13
        Width = 732
        Height = 202
        Caption = 'Dados do cliente'
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 22
          Width = 107
          Height = 16
          Caption = 'C'#243'digo do Modelo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 68
          Top = 53
          Width = 46
          Height = 16
          Caption = 'Modelo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 430
          Top = 53
          Width = 65
          Height = 16
          Caption = 'Pre'#231'o (un):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 397
          Top = 22
          Width = 98
          Height = 16
          Caption = 'Quantidade (un):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 401
          Top = 80
          Width = 64
          Height = 16
          Caption = 'Sequencia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCdItensPedido: TLabeledEdit
          Tag = 999
          Left = 121
          Top = 16
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
          TabOrder = 0
        end
        object edtModelo: TLabeledEdit
          Left = 120
          Top = 48
          Width = 255
          Height = 26
          CharCase = ecUpperCase
          EditLabel.Width = 80
          EditLabel.Height = 23
          EditLabel.Caption = 'edtModelo'
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
          TabOrder = 1
        end
        object GroupBox7: TGroupBox
          Left = 25
          Top = 98
          Width = 637
          Height = 91
          Caption = 'Tamanho e cor'
          TabOrder = 2
          object Label15: TLabel
            Left = 19
            Top = 21
            Width = 35
            Height = 16
            Caption = 'Tam.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 17
            Top = 53
            Width = 25
            Height = 16
            Caption = 'Cor:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 207
            Top = 22
            Width = 57
            Height = 16
            Caption = 'Qnt. (un):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtQntTam: TLabeledEdit
            Left = 270
            Top = 18
            Width = 109
            Height = 26
            Hint = 'CPF/CNPJ'
            CharCase = ecUpperCase
            EditLabel.Width = 79
            EditLabel.Height = 23
            EditLabel.Caption = 'edtQntTam'
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
          object edtTamanho: TLabeledEdit
            Left = 70
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
            TabOrder = 1
          end
          object edtCor: TLabeledEdit
            Left = 54
            Top = 50
            Width = 255
            Height = 26
            Hint = 'CPF/CNPJ'
            CharCase = ecUpperCase
            EditLabel.Width = 51
            EditLabel.Height = 23
            EditLabel.Caption = 'edtCor'
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
            TabOrder = 2
          end
          object btnAddModelo: TBitBtn
            Left = 544
            Top = 27
            Width = 57
            Height = 46
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -25
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            OnClick = btnNovoClick
          end
        end
        object edtQntItem: TLabeledEdit
          Left = 505
          Top = 16
          Width = 109
          Height = 26
          Hint = 'CPF/CNPJ'
          CharCase = ecUpperCase
          EditLabel.Width = 83
          EditLabel.Height = 23
          EditLabel.Caption = 'edtQntItem'
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
        object btnAddItem: TBitBtn
          Left = 632
          Top = 16
          Width = 57
          Height = 46
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -25
          Font.Name = 'Tahoma'
          Font.Style = []
          Layout = blGlyphTop
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          OnClick = btnNovoClick
        end
        object edtPrecoModelo: TLabeledEdit
          Left = 505
          Top = 48
          Width = 109
          Height = 26
          Hint = 'CPF/CNPJ'
          CharCase = ecUpperCase
          EditLabel.Width = 122
          EditLabel.Height = 23
          EditLabel.Caption = 'edtPrecoModelo'
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
          TabOrder = 5
        end
        object edtSequencia: TLabeledEdit
          Left = 505
          Top = 80
          Width = 109
          Height = 26
          Hint = 'CPF/CNPJ'
          CharCase = ecUpperCase
          EditLabel.Width = 97
          EditLabel.Height = 23
          EditLabel.Caption = 'edtSequencia'
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
          TabOrder = 6
        end
      end
      object btnExcluirModelo: TBitBtn
        Left = 704
        Top = 225
        Width = 176
        Height = 29
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -25
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = btnNovoClick
      end
      object btnExcluirItem: TBitBtn
        Left = 356
        Top = 225
        Width = 176
        Height = 29
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -25
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = btnNovoClick
      end
      object lvModelos: TListView
        Left = 599
        Top = 271
        Width = 193
        Height = 162
        Columns = <>
        TabOrder = 3
        ViewStyle = vsList
      end
    end
  end
  object lvItens: TListView
    Left = 58
    Top = 378
    Width = 511
    Height = 167
    Columns = <>
    TabOrder = 3
    ViewStyle = vsList
  end
end
