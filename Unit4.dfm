object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 440
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBEdit1: TDBEdit
    Left = 8
    Top = 160
    Width = 289
    Height = 21
    DataField = 'nome'
    DataSource = ds_estado
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 303
    Top = 160
    Width = 122
    Height = 21
    DataField = 'sigla'
    DataSource = ds_estado
    TabOrder = 1
  end
  object insericidade: TButton
    Left = 8
    Top = 407
    Width = 75
    Height = 25
    Caption = 'inserir cidade'
    TabOrder = 2
    OnClick = insericidadeClick
  end
  object salvacidade: TButton
    Left = 89
    Top = 407
    Width = 75
    Height = 25
    Caption = 'salvar cidade'
    TabOrder = 3
    OnClick = salvacidadeClick
  end
  object excluicidade: TButton
    Left = 251
    Top = 407
    Width = 75
    Height = 25
    Caption = 'excluir cidade'
    TabOrder = 4
    OnClick = excluicidadeClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 240
    Width = 754
    Height = 120
    DataSource = ds_cidade
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 8
    Width = 754
    Height = 120
    DataSource = ds_estado
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qry_cidade'
        Visible = False
      end>
  end
  object Button4: TButton
    Left = 8
    Top = 187
    Width = 75
    Height = 25
    Caption = 'inserir estado'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 89
    Top = 187
    Width = 75
    Height = 25
    Caption = 'salvar estado'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 170
    Top = 187
    Width = 75
    Height = 25
    Caption = 'excluir estado'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 332
    Top = 186
    Width = 93
    Height = 25
    Caption = 'cancelar estado'
    TabOrder = 10
    OnClick = Button7Click
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 375
    Width = 417
    Height = 21
    DataField = 'nome'
    DataSource = ds_cidade
    TabOrder = 11
  end
  object Button8: TButton
    Left = 251
    Top = 186
    Width = 75
    Height = 25
    Caption = 'editar estado'
    TabOrder = 12
    OnClick = Button8Click
  end
  object editacidade: TButton
    Left = 170
    Top = 407
    Width = 75
    Height = 25
    Caption = 'editar cidade'
    TabOrder = 13
    OnClick = editacidadeClick
  end
  object cancelacidade: TButton
    Left = 332
    Top = 407
    Width = 93
    Height = 25
    Caption = 'cancelar cidade'
    TabOrder = 14
    OnClick = cancelacidadeClick
  end
  object conexao: TSQLConnection
    ConnectionName = 'Devart MySQL Direct'
    DriverName = 'DevartMySQLDirect'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=localhost'
      'DataBase=delphi'
      'DriverName=DevartMySQLDirect'
      'User_Name=deivid'
      'Password=6291'
      'FetchAll=True'
      'EnableBoolean=False'
      'IPVersion=IPv4')
    Connected = True
    Left = 456
    Top = 136
  end
  object qry_estado: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from estado')
    SQLConnection = conexao
    Left = 528
    Top = 136
    object qry_estadoid_estado: TIntegerField
      FieldName = 'id_estado'
    end
    object qry_estadonome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qry_estadosigla: TStringField
      FieldName = 'sigla'
      Size = 2
    end
  end
  object dsp_estado: TDataSetProvider
    DataSet = qry_estado
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 136
  end
  object cds_estado: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_estado'
    AfterPost = cds_estadoAfterPost
    AfterDelete = cds_estadoAfterDelete
    Left = 664
    Top = 136
    object cds_estadoid_estado: TIntegerField
      FieldName = 'id_estado'
    end
    object cds_estadonome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cds_estadosigla: TStringField
      FieldName = 'sigla'
      Size = 2
    end
    object cds_estadoqry_cidade: TDataSetField
      FieldName = 'qry_cidade'
    end
  end
  object ds_estado: TDataSource
    DataSet = cds_estado
    Left = 728
    Top = 136
  end
  object ds_estado_cidade: TDataSource
    DataSet = qry_estado
    Left = 456
    Top = 192
  end
  object qry_cidade: TSQLQuery
    DataSource = ds_estado_cidade
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_estado'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from cidade where id_estado= :id_estado')
    SQLConnection = conexao
    Left = 528
    Top = 192
    object qry_cidadeid: TIntegerField
      FieldName = 'id'
    end
    object qry_cidadeid_estado: TIntegerField
      FieldName = 'id_estado'
    end
    object qry_cidadenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object cds_cidade: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cds_estadoqry_cidade
    Params = <>
    Left = 664
    Top = 192
    object cds_cidadeid: TIntegerField
      FieldName = 'id'
    end
    object cds_cidadeid_estado: TIntegerField
      FieldName = 'id_estado'
    end
    object cds_cidadenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object ds_cidade: TDataSource
    DataSet = cds_cidade
    Left = 728
    Top = 192
  end
end
