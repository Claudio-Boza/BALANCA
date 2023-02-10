object DataModule1: TDataModule1
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conexao: TFDConnection
    Params.Strings = (
      'Database=D:\BALANCA\DataBase\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
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
    IndexName = 'PK_BALANCA'
    Connection = conexao
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.UpdateTableName = 'BALANCA'
    TableName = 'BALANCA'
    Left = 40
    Top = 160
    object tb_balancaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object tb_balancaBOUD_RATE: TStringField
      FieldName = 'BOUD_RATE'
      Origin = 'BOUD_RATE'
      Required = True
      Size = 15
    end
    object tb_balancaDATA_BITS: TStringField
      FieldName = 'DATA_BITS'
      Origin = 'DATA_BITS'
      Required = True
      Size = 15
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
    Left = 128
    Top = 160
  end
  object ds_balanca: TDataSource
    DataSet = tb_balanca
    Left = 208
    Top = 160
  end
  object tb_pesagem: TFDTable
    IndexFieldNames = 'ID'
    Connection = conexao
    UpdateOptions.UpdateTableName = 'PESAGEM'
    TableName = 'PESAGEM'
    Left = 32
    Top = 256
    object tb_pesagemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object tb_pesagemPLACA: TStringField
      DisplayWidth = 10
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Size = 8
    end
    object tb_pesagemMOTORISTA: TStringField
      DisplayWidth = 25
      FieldName = 'MOTORISTA'
      Origin = 'MOTORISTA'
      Size = 80
    end
    object tb_pesagemDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 254
    end
    object tb_pesagemDATA_ENTRADA: TDateField
      DisplayLabel = 'DATA ENTRADA'
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
    end
    object tb_pesagemHORAS_ENTRADA: TTimeField
      DisplayLabel = 'HORAS ENTRADA'
      FieldName = 'HORAS_ENTRADA'
      Origin = 'HORAS_ENTRADA'
    end
    object tb_pesagemDATA_SAIDA: TDateField
      DisplayLabel = 'DATA SA'#205'DA'
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object tb_pesagemHORAS_SAIDA: TTimeField
      DisplayLabel = 'HORAS SA'#205'DA'
      FieldName = 'HORAS_SAIDA'
      Origin = 'HORAS_SAIDA'
    end
    object tb_pesagemPESO_BRUTO: TFMTBCDField
      DisplayLabel = 'PESO BRUTO'
      FieldName = 'PESO_BRUTO'
      Origin = 'PESO_BRUTO'
      Precision = 18
      Size = 2
    end
    object tb_pesagemPESO_LIQUIDO: TFMTBCDField
      DisplayLabel = 'PESO LIQUIDO'
      FieldName = 'PESO_LIQUIDO'
      Origin = 'PESO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object tb_pesagemPESO_TOTAL: TFMTBCDField
      DisplayLabel = 'PESO TOTAL'
      FieldName = 'PESO_TOTAL'
      Origin = 'PESO_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object queryPesagem: TFDQuery
    Connection = conexao
    Left = 128
    Top = 256
  end
  object ds_pesagem: TDataSource
    DataSet = tb_pesagem
    Left = 216
    Top = 264
  end
end
