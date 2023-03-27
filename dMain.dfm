object dtmMain: TdtmMain
  OnCreate = DataModuleCreate
  Height = 445
  Width = 603
  PixelsPerInch = 96
  object conMain: TFDConnection
    Params.Strings = (
      'Database=local.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auRunTime]
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object qryGetKeywordsLists: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'select row_number() over(ORDER BY k.id) num, k.* '
      'from keyword k')
    Left = 101
    Top = 121
  end
  object dsKeywordsLists: TDataSource
    DataSet = mdKeywordsLists
    Left = 101
    Top = 64
  end
  object qryAddNewKeywordsLists: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'INSERT INTO keyword (keyword, IsDefault, IsChecked, Color)  '
      'VALUES (:p_keyword, :p_IsDefault, :p_IsChecked, :p_color);')
    Left = 101
    Top = 232
    ParamData = <
      item
        Name = 'P_KEYWORD'
        ParamType = ptInput
      end
      item
        Name = 'P_ISDEFAULT'
        ParamType = ptInput
      end
      item
        Name = 'P_ISCHECKED'
        ParamType = ptInput
      end
      item
        Name = 'P_COLOR'
        ParamType = ptInput
      end>
  end
  object mdKeywordsLists: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 101
    Top = 8
  end
  object dlMain: TFDPhysSQLiteDriverLink
    DriverID = 'SQLite'
    VendorLib = 'SQLite3.dll'
    Left = 16
    Top = 64
  end
  object qryDeleteKeywordsLists: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'DELETE FROM keyword WHERE ID = :p_ID')
    Left = 101
    Top = 288
    ParamData = <
      item
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
  object qryUpdateKeywordsListsColor: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'UPDATE keyword SET color = :p_color WHERE id = :p_id;')
    Left = 101
    Top = 344
    ParamData = <
      item
        Name = 'P_COLOR'
        ParamType = ptInput
      end
      item
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
  object mdKeywords: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 261
    Top = 8
  end
  object dsKeywords: TDataSource
    DataSet = mdKeywords
    Left = 261
    Top = 64
  end
  object qryGetKeywords: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'select row_number() over(ORDER BY kl.id) num, kl.* '
      'from keywordsList kl'
      'where KeywordID = :p_keywordID')
    Left = 261
    Top = 120
    ParamData = <
      item
        Name = 'P_KEYWORDID'
        ParamType = ptInput
      end>
  end
  object qryAddNewKeywords: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'INSERT INTO keywordsList (keywordID, Keyword, IsChecked)  '
      'VALUES (:p_keywordID, :p_Keyword, :p_IsChecked);')
    Left = 261
    Top = 176
    ParamData = <
      item
        Name = 'P_KEYWORDID'
        ParamType = ptInput
      end
      item
        Name = 'P_KEYWORD'
        ParamType = ptInput
      end
      item
        Name = 'P_ISCHECKED'
        ParamType = ptInput
      end>
  end
  object qryDeleteKeywords: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'DELETE FROM keywordsList WHERE ID = :p_ID')
    Left = 261
    Top = 232
    ParamData = <
      item
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
  object qryGeyDefaultKeywordsLists: TFDQuery
    Connection = conMain
    SQL.Strings = (
      'select row_number() over(ORDER BY k.id) num, k.* '
      'from keyword k'
      'where isDefault = 1')
    Left = 101
    Top = 176
  end
end
