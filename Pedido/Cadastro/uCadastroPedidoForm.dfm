inherited CadastroPedidoForm: TCadastroPedidoForm
  Caption = 'CadastroPedidoForm'
  ClientHeight = 533
  ClientWidth = 814
  ExplicitWidth = 820
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 554
    Top = 128
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
  inherited Panel1: TPanel
    Width = 814
    ExplicitWidth = 814
    inherited Panel3: TPanel
      Left = 613
      ExplicitLeft = 613
    end
  end
  object edtPedido: TLabeledEdit
    Left = 70
    Top = 192
    Width = 487
    Height = 26
    Hint = 'Valor do pedido'
    CharCase = ecUpperCase
    EditLabel.Width = 54
    EditLabel.Height = 23
    EditLabel.Caption = 'Pedido:'
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
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    TextHint = 'Informe os Pedidos dispon'#237'veis'
  end
  object LabeledEdit1: TLabeledEdit
    AlignWithMargins = True
    Left = 70
    Top = 248
    Width = 487
    Height = 26
    Hint = 'Nome do Cliente'
    CharCase = ecUpperCase
    EditLabel.Width = 54
    EditLabel.Height = 23
    EditLabel.Caption = 'Pedido:'
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
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
    TextHint = 'Informe os Pedidos dispon'#237'veis'
  end
  object edtCodigo: TLabeledEdit
    Tag = 999
    Left = 70
    Top = 136
    Width = 153
    Height = 26
    Hint = 'C'#243'digo do pedido'
    CharCase = ecUpperCase
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
    TabOrder = 3
  end
  object dteDataAtual: TDateTimePicker
    Left = 609
    Top = 127
    Width = 186
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
    TabOrder = 4
  end
end
