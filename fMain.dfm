object frmKeywordDispatcher: TfrmKeywordDispatcher
  Left = 0
  Top = 0
  Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088' '#1089#1087#1080#1089#1082#1086#1074' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074
  ClientHeight = 441
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlMain: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 825
    Height = 360
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object spltMain: TcxSplitter
      Left = 427
      Top = 0
      Width = 8
      Height = 360
      Control = pnlKeywordsList
      ExplicitLeft = 433
    end
    object pnlKeywordsList: TPanel
      Left = 0
      Top = 0
      Width = 427
      Height = 360
      Align = alLeft
      TabOrder = 1
      DesignSize = (
        427
        360)
      object grdKeywordsLists: TcxGrid
        Left = 1
        Top = 1
        Width = 425
        Height = 358
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 431
        object tvKeywordsLists: TcxGridDBTableView
          OnMouseDown = tvKeywordsListsMouseDown
          OnMouseLeave = tvKeywordsListsMouseLeave
          OnMouseMove = tvKeywordsListsMouseMove
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnCellClick = tvKeywordsListsCellClick
          OnCustomDrawCell = tvKeywordsListsCustomDrawCell
          OnEditing = tvKeywordsListsEditing
          OnEditKeyUp = tvKeywordsListsEditKeyUp
          OnSelectionChanged = tvKeywordsListsSelectionChanged
          DataController.DataSource = dtmMain.dsKeywordsLists
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnCompare = tvKeywordListDataControllerCompare
          NewItemRow.InfoText = '+ '#1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1085#1086#1074#1086#1075#1086' '#1089#1087#1080#1089#1082#1072
          NewItemRow.SeparatorWidth = 2
          OptionsBehavior.CellHints = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.ExpandMasterRowOnDblClick = False
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.FocusRect = False
          OptionsView.NoDataToDisplayInfoText = ' '
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.HeaderEndEllipsis = True
          Styles.Selection = cxStyle1
          object tvcCheckBox: TcxGridDBColumn
            DataBinding.FieldName = 'IsChecked'
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Options.Editing = False
            Options.Sorting = False
            Width = 25
            IsCaptionAssigned = True
          end
          object tvcKeywordList: TcxGridDBColumn
            Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074
            DataBinding.FieldName = 'Keyword'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 322
          end
          object tvcDelete: TcxGridDBColumn
            Options.Editing = False
            Options.ShowEditButtons = isebAlways
            Options.AutoWidthSizable = False
            Options.Sorting = False
            Width = 33
            IsCaptionAssigned = True
          end
          object tvcColor: TcxGridDBColumn
            DataBinding.FieldName = 'Color'
            OnGetCellHint = tvcColorGetCellHint
            Options.Editing = False
            Options.AutoWidthSizable = False
            Options.Sorting = False
            Width = 31
            IsCaptionAssigned = True
          end
          object tvcIndex: TcxGridDBColumn
            DataBinding.FieldName = 'num'
            Visible = False
          end
        end
        object lvlKeywordsLists: TcxGridLevel
          GridView = tvKeywordsLists
        end
      end
      object btnExport: TcxButton
        Left = 361
        Top = 2
        Width = 32
        Height = 22
        Action = actExport
        Anchors = [akTop, akRight, akBottom]
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 367
      end
      object btnImport: TcxButton
        Left = 394
        Top = 2
        Width = 31
        Height = 22
        Action = actImport
        Anchors = [akTop, akRight, akBottom]
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 400
      end
    end
    object pnlKeywords: TPanel
      Left = 435
      Top = 0
      Width = 390
      Height = 360
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 680
      ExplicitTop = 128
      ExplicitWidth = 185
      ExplicitHeight = 41
      object grdKeywords: TcxGrid
        Left = 1
        Top = 1
        Width = 388
        Height = 358
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 2
        object tvKeywords: TcxGridDBTableView
          OnMouseDown = tvKeywordsMouseDown
          OnMouseLeave = tvKeywordsMouseLeave
          OnMouseMove = tvKeywordsMouseMove
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnCellClick = tvKeywordsCellClick
          OnCustomDrawCell = tvKeywordsCustomDrawCell
          OnEditing = tvKeywordsListsEditing
          OnEditKeyUp = tvKeywordsEditKeyUp
          DataController.DataSource = dtmMain.dsKeywords
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnCompare = tvKeywordsDataControllerCompare
          NewItemRow.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1086#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
          NewItemRow.SeparatorWidth = 2
          OptionsBehavior.CellHints = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.ExpandMasterRowOnDblClick = False
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.FocusRect = False
          OptionsView.NoDataToDisplayInfoText = ' '
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.HeaderEndEllipsis = True
          Styles.Selection = cxStyle1
          object tvcKeywordsName: TcxGridDBColumn
            Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
            DataBinding.FieldName = 'Keyword'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 326
          end
          object tvcKeywordsDelete: TcxGridDBColumn
            Options.Editing = False
            Options.ShowEditButtons = isebAlways
            Options.AutoWidthSizable = False
            Options.Sorting = False
            Width = 33
            IsCaptionAssigned = True
          end
          object tvcKeywordsID: TcxGridDBColumn
            DataBinding.FieldName = 'num'
            Visible = False
          end
        end
        object lvlKeywords: TcxGridLevel
          GridView = tvKeywords
        end
      end
    end
  end
  object pnlBottomButtons: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 390
    Width = 825
    Height = 41
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alBottom
    TabOrder = 1
    object btnDefault: TcxButton
      AlignWithMargins = True
      Left = 607
      Top = 8
      Width = 97
      Height = 25
      Margins.Top = 7
      Margins.Right = 10
      Margins.Bottom = 7
      Align = alRight
      Action = actLoadDefault
      SpeedButtonOptions.Flat = True
      TabOrder = 0
    end
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 724
      Top = 8
      Width = 97
      Height = 25
      Margins.Left = 10
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alRight
      Action = actClose
      SpeedButtonOptions.Flat = True
      TabOrder = 1
    end
  end
  object alMain: TActionList
    Images = ilMain
    Left = 242
    Top = 58
    object actClose: TAction
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      OnExecute = actCloseExecute
    end
    object actExport: TAction
      ImageIndex = 0
      ImageName = #1040#1088#1093#1080#1074'_'#1074#1099#1076#1072#1090#1100
      OnExecute = actExportExecute
    end
    object actImport: TAction
      ImageIndex = 1
      ImageName = #1040#1088#1093#1080#1074'_'#1087#1088#1080#1085#1103#1090#1100
      OnExecute = actImportExecute
      OnUpdate = actImportUpdate
    end
    object actLoadDefault: TAction
      Caption = #1055#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102
      OnExecute = actLoadDefaultExecute
    end
  end
  object ilColoredBitmap: TImageList
    Left = 514
    Top = 162
  end
  object cdChangeKeywordColor: TColorDialog
    Left = 594
    Top = 226
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 360
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
  end
  object icMain: TImageCollection
    Images = <
      item
        Name = #1044#1086#1073#1072#1074#1080#1090#1100
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000B1300000B1301009A9C18000000017352474200AE
              CE1CE90000000467414D410000B18F0BFC610500000048494441547801EDD3B1
              0900200C04C0D725DCC2E91CC3E9DCC229140B41D0E68B60913FB01192279000
              22A754DA588FA98930A680FF01E1F5C96ECAD66BBEFA994F40D11D2840BC9A48
              020D8833F64A270000000049454E44AE426082}
          end>
      end
      item
        Name = #1069#1082#1089#1087#1086#1088#1090
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000B1300000B1301009A9C18000000017352474200AE
              CE1CE90000000467414D410000B18F0BFC610500000149494441547801ED963D
              4EC3401085DF7A91A0CC115C21852A9C007304A8412427C02920110D941114F1
              0DB0803AE606F806A140381D390235281E766D29B211C4EBC5218EB45F35B31E
              799E3C3F6BC0B0D65C4C4E71FEEAE20F30E872F6D202E7E3C49EF15DDC6C3F43
              030B3AF4225B240FE63E9F05C9D9BF09B0984C6E674E6CF12D6FA1417901FDE8
              1244AD1F9E38E84D862849B91E904D1793B73026A62EAE7716C7680990356678
              2B8C23BC23E6FBAA4DA9568234F993522C4323694A77DC5009DF8012715B689D
              0A639A3974BE0585396F734BEE872B14A0BF07FA11E5FC4153EB5D7A63582146
              8011B07201B93DE03D8CD2D122E6BBC7071D54C8F06EE4330B27D2768F0EE723
              6B4A50AF1E2849253DA22F60D0F45101752D0139DE7DA0F58FF73BB487620114
              8A1BDA1197B42DEC369601A3C7AC9B2B017D5A9D54C4B2A0903EAC2E0C75E20B
              9AF650274740BC600000000049454E44AE426082}
          end>
      end
      item
        Name = #1048#1084#1087#1086#1088#1090
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000B1300000B1301009A9C18000000017352474200AE
              CE1CE90000000467414D410000B18F0BFC61050000014C494441547801ED953D
              52C33010859F3439004770C724439313108E106A18E21B980A772415010ACC09
              627EEAC0117C03A870898F400984F1B24E661894C48E2C2771A3AFF26A76BD4F
              D26A17B0D48C80297E4C8A3D6C1AFD4BA266AC002BC00AB0026A17A0D73EFDB8
              074A1D35529E2B36A503C5968D775CECDE61050DE8404838E1A8D0675ED0CFA4
              0D0DF4AEE0B21921A553E84218E07AEF55C7B5DC04F3DF420E392976A25B0C5B
              1E342957849F5F1E888A7696B04F1F25504E20781CCF663C89D03BEEBA4B23CE
              62871D5E20C4CE4272C2015F57B22CECE67E1C0A89E9E97947877F79CB3FC369
              02D15D5827B879C98B30EB03F34599155DB666807923BA6A059C397BE72127EF
              C310BD3E9047569415A92620687FA022B5CF829C13A04EF0F034C25AA17DAC16
              40113FB10E770787BF7BD804829EFF9BCA15D044BA33119B8222FA96FA33C5B2
              0D7E0110CF5DB25644B9580000000049454E44AE426082}
          end>
      end
      item
        Name = 'CheckBox'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D494844520000000C0000000C0802000000D917CB
              B0000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA864000000CD494441542853758E31
              0A8430104537B2066D2C6D044B41F00A41040BCF6A616DA978052B4B1BC14AB0
              5174757F325961111F84CCFC7909C38AA2D8F7FDF58C10E20D234D53CBB274F6
              635916D334CBB2446DE0C0B0FF59D735CBB2799E95AF2480775480699AE2386E
              DBF6380E4AA4040369DFF7A82F8373AE0489FE090616ECBA8E0CC771EABA765D
              97A65AC25AE45D46144586A1A7F28281D4F7FD711CEF06D0158CA6698220B81B
              40361F85E77955558561789E2725802496E739638C9A3BDBB62549C28661D0C1
              039CF32F91476EAFA6E587B20000000049454E44AE426082}
          end>
      end
      item
        Name = #1059#1076#1072#1083#1080#1090#1100
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C18000002EA49444154789C
              ED59396B5451143EA630282E85462B510B974A2BB173A9B4128D680C082E885D
              D044E59D93093C70C305C1E517B8342E955829885B278AA255A285C4D8B83323
              3131CC2737F3E6CD89B3306F72EE38CA7C7099E21EBEF37DEFDE77E7DCF3889A
              68A2095B08E693E038315E9220138D17C4384687308F1A1A01B612E33B095066
              7C23413B35AC78C15805F1F9314601B650C36D1BC6D75824A39F18DBA8077349
              D0468C0E120CA8F9CF8DB59D0447D5137642DB8A629C60C61B6522A48681E0B9
              12D659216EA78A7BEA53D049620C57B19FEB3318C3C43851A57A4C2146FAAF8B
              962213E9EA57C0B9FD7757E00F08362BA2DBE41B8C3B2ADF260BC2D5F579F122
              309EA97CAB68D24861A15ACE41F20DC1509C2F850593270C319504D988749442
              B458E82C93AB8518BFA25CD9F1DC2670FF9C855528FE93B22D04118D8F96C4AF
              15F18A0A71E748F093186712CDE51160A5DAFFAFC80C827B31712F36948D638C
              44C94712CDE5C1D8A80CDC253330AE2A03BBCBC6E9B33BC95C1E01F62A0397C9
              0C6ED90B02D89B0141AF8A3B65A69F04DD8AF88247039754DC0133FD24D8A188
              6F7834704BC56D37D34F01D6A9BDF9C89B01C6933826C01A33FDD487654AC080
              C715781BC7F46189997E0A314B09C8785C811F714C881966FA23019998FC0866
              9A1B0830BBB6DABF5A4CBCCF2E35372058AEF8FBCDF593E0B112B1D68381F52A
              E6A1B97E62DC544FA8C3DC00A353F15F37D74F8C8B2AC1410F067A14FF7973FD
              C41095E0B4872D7456F107E6FA89B14789B8E2C1C035656097B9FEAA4ADD7C27
              C3FD26994B52B2D78C6A2E1BB9764CBA640BA4D25C924B53CD70BDCD42824FE6
              FC822F31BF6B0A7BB970BB4B7D2E4996BAD06AC6DD85D6FA340E18EF55B5B8C8
              8C3785C5F569DD301E2803FB0C79F7ABF7EBBE196F8944814AE45A2DEDD48D69
              35F385981E7DD929EC7FC66153CD25CAEAC10967BAED7857B6D2353D4E191F3C
              881FF2737C96823BE65C3991FB9C943F996A19A3E3A5B3EB4030E6D4477C134D
              FC5FF80DC8684F5D3F7B7F0C0000000049454E44AE426082}
          end>
      end
      item
        Name = #1057#1087#1080#1089#1086#1082
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C180000016349444154789C
              ED99CD4A033110C7E3A145DFA15032C7BDF6D9FC38752D743D4CF001FA3CFA08
              3D59A1509878B7C25E0A9151D4A88B2D4DD235DBF9418EC9CC3F339964779412
              04612B83DBD599469A68438F80B401635D9281B4611BDAD035DB54D19C37F63E
              99D3A679B0CD61B93C0D16C03B7F68E7E16B8CC30570DA7C2EF8743E9AB99E4A
              C468E67A8074E145E12178513FE78B72DE578929CA79DF3F13C10BFA218DE2E1
              A16D42970500DA1B30B60E38A435A0ADDA11E0DC89465A07974BA4759B11A8F2
              8D40424004784804F60024858E258560F78BEC57B97C9B8BF492CD45F6F3C2FA
              98AB0D3DE770913545A07A1741D3D604A40244C0B14400FEAE428D0FB5ACAA90
              6E782AE75485EA2D11902A141C81548094510F790B19790B852187780F40AA50
              A7520833FFBDAEBF3538E832A588829D47BA8ADAE0E086DBAEDFBDFFB2C53468
              A9C90768EFA234F9185E887743A35D246FB3A25DB0AD68CE0B42C7790580ACBD
              C53C863E3F0000000049454E44AE426082}
          end>
      end>
    Left = 544
    Top = 55
  end
  object ilMain: TVirtualImageList
    DisabledGrayscale = True
    Images = <
      item
        CollectionIndex = 1
        CollectionName = #1069#1082#1089#1087#1086#1088#1090
        Name = #1040#1088#1093#1080#1074'_'#1074#1099#1076#1072#1090#1100
      end
      item
        CollectionIndex = 2
        CollectionName = #1048#1084#1087#1086#1088#1090
        Name = #1040#1088#1093#1080#1074'_'#1087#1088#1080#1085#1103#1090#1100
      end
      item
        CollectionIndex = 0
        CollectionName = #1044#1086#1073#1072#1074#1080#1090#1100
        Name = #1089#1080#1085#1080#1077'-'#1076#1086#1073#1072#1074#1080#1090#1100
      end
      item
        CollectionIndex = 5
        CollectionName = #1057#1087#1080#1089#1086#1082
        Name = #1057#1087#1080#1089#1086#1082
      end
      item
        CollectionIndex = 4
        CollectionName = #1059#1076#1072#1083#1080#1090#1100
        Name = #1059#1076#1072#1083#1080#1090#1100
      end>
    ImageCollection = icMain
    Left = 594
    Top = 130
  end
  object ilCheck: TVirtualImageList
    Images = <
      item
        CollectionIndex = 3
        CollectionName = 'CheckBox'
        Name = 'CheckBox'
      end>
    ImageCollection = icMain
    Width = 12
    Height = 12
    Left = 645
    Top = 106
  end
end
