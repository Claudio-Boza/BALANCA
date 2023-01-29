object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conexao: TFDConnection
    Params.Strings = (
      'Database=D:\P\Delphi\Balanca\Database\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 32
  end
  object drive: TFDPhysFBDriverLink
    Left = 256
    Top = 40
  end
  object tb_balanca: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    Connection = conexao
    TableName = 'BALANCA'
    Left = 40
    Top = 160
    object tb_balancaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object tb_balancaMODELO: TIntegerField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
    end
    object tb_balancaPORTA: TStringField
      FieldName = 'PORTA'
      Origin = 'PORTA'
      Required = True
      Size = 5
    end
    object tb_balancaBOUD_RATE: TIntegerField
      FieldName = 'BOUD_RATE'
      Origin = 'BOUD_RATE'
      Required = True
    end
    object tb_balancaDATA_BITS: TIntegerField
      FieldName = 'DATA_BITS'
      Origin = 'DATA_BITS'
      Required = True
    end
    object tb_balancaPARITY: TIntegerField
      FieldName = 'PARITY'
      Origin = 'PARITY'
      Required = True
    end
    object tb_balancaSTOP_BITS: TIntegerField
      FieldName = 'STOP_BITS'
      Origin = 'STOP_BITS'
      Required = True
    end
    object tb_balancaHANDSHAKING: TIntegerField
      FieldName = 'HANDSHAKING'
      Origin = 'HANDSHAKING'
      Required = True
    end
    object tb_balancaCAMINHO_TXT: TStringField
      FieldName = 'CAMINHO_TXT'
      Origin = 'CAMINHO_TXT'
      Size = 254
    end
    object tb_balancaMONITORAR: TBooleanField
      FieldName = 'MONITORAR'
      Origin = 'MONITORAR'
    end
    object tb_balancaTIMEOUT: TIntegerField
      FieldName = 'TIMEOUT'
      Origin = 'TIMEOUT'
    end
  end
  object queryBalanca: TFDQuery
    Connection = conexao
    Left = 120
    Top = 160
  end
  object ds_balanca: TDataSource
    DataSet = tb_balanca
    Left = 200
    Top = 160
  end
  object tb_pesagem: TFDTable
    IndexFieldNames = 'ID'
    Connection = conexao
    TableName = 'PESAGEM'
    Left = 32
    Top = 256
    object tb_pesagemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object tb_pesagemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 254
    end
    object tb_pesagemDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
    end
    object tb_pesagemHORAS_ENTRADA: TTimeField
      FieldName = 'HORAS_ENTRADA'
      Origin = 'HORAS_ENTRADA'
    end
    object tb_pesagemDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object tb_pesagemHORAS_SAIDA: TIntegerField
      FieldName = 'HORAS_SAIDA'
      Origin = 'HORAS_SAIDA'
    end
    object tb_pesagemPESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      Origin = 'PESO_BRUTO'
      Precision = 18
      Size = 2
    end
    object tb_pesagemPESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      Origin = 'PESO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object tb_pesagemPESO_TOTAL: TFMTBCDField
      FieldName = 'PESO_TOTAL'
      Origin = 'PESO_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object queryPesagem: TFDQuery
    Connection = conexao
    Left = 112
    Top = 256
  end
  object ds_pesagem: TDataSource
    DataSet = tb_pesagem
    Left = 192
    Top = 256
  end
end
