object FormFileAnalyzer: TFormFileAnalyzer
  Left = 281
  Top = 166
  Caption = 'FormFileAnalyzer'
  ClientHeight = 566
  ClientWidth = 742
  Color = clBtnFace
  Constraints.MinHeight = 280
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenuOne
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object StatusBarOne: TStatusBar
    Left = 0
    Top = 544
    Width = 742
    Height = 22
    Panels = <
      item
        Width = 150
      end
      item
        Width = 100
      end>
    OnResize = StatusBarOneResize
    object LabelHttp: TLabel
      Left = 457
      Top = 0
      Width = 222
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      Alignment = taRightJustify
      Caption = 'http://blog.csdn.net/zswang    '
      Transparent = True
      OnClick = LabelHttpClick
    end
  end
  object GroupBoxSearch: TGroupBox
    Left = 0
    Top = 34
    Width = 742
    Height = 93
    Align = alTop
    Caption = #25628#32034#26465#20214
    TabOrder = 0
    object PageControlSearch: TPageControl
      Left = 2
      Top = 18
      Width = 738
      Height = 73
      ActivePage = TabSheetGeneral
      Align = alClient
      TabOrder = 0
      TabStop = False
      OnChange = PageControlSearchChange
      object TabSheetGeneral: TTabSheet
        Caption = #26222#36890
        DesignSize = (
          730
          42)
        object ComboBoxGeneral: TComboBox
          Left = -1
          Top = 3
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetMark: TTabSheet
        Caption = #29305#24449#30721
        ImageIndex = 10
        DesignSize = (
          730
          42)
        object ComboBoxMark: TComboBox
          Left = -1
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetPascal: TTabSheet
        Caption = 'Pascal'
        ImageIndex = 3
        DesignSize = (
          730
          42)
        object ComboBoxPascal: TComboBox
          Left = 3
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetC: TTabSheet
        Caption = 'C'
        ImageIndex = 12
        DesignSize = (
          730
          42)
        object ComboBoxC: TComboBox
          Left = 3
          Top = 5
          Width = 730
          Height = 24
          Hint = 'GUID'
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetHex: TTabSheet
        Caption = #21313#20845#36827#21046
        ImageIndex = 1
        DesignSize = (
          730
          42)
        object ComboBoxHex: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetInteger: TTabSheet
        Caption = 'Integer'
        ImageIndex = 4
        DesignSize = (
          730
          42)
        object SpeedButtonIntegerHex: TSpeedButton
          Left = 3
          Top = 5
          Width = 31
          Height = 22
          Caption = 'Hex'
          OnClick = SpeedButtonIntegerHexClick
        end
        object ComboBoxInteger: TComboBox
          Left = 36
          Top = 5
          Width = 695
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetBin: TTabSheet
        Caption = #20108#36827#21046
        ImageIndex = 10
        DesignSize = (
          730
          42)
        object ComboBoxBin: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetSmallint: TTabSheet
        Caption = 'Smallint'
        ImageIndex = 11
        DesignSize = (
          730
          42)
        object ComboBoxSmallint: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetInt64: TTabSheet
        Caption = 'Int64'
        ImageIndex = 6
        DesignSize = (
          730
          42)
        object ComboBoxInt64: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetSingle: TTabSheet
        Caption = 'Single'
        ImageIndex = 5
        DesignSize = (
          730
          42)
        object ComboBoxSingle: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetDouble: TTabSheet
        Caption = 'Double'
        ImageIndex = 7
        DesignSize = (
          730
          42)
        object ComboBoxDouble: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetGUID: TTabSheet
        Caption = 'GUID'
        ImageIndex = 8
        DesignSize = (
          730
          42)
        object ComboBoxGUID: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          Hint = 'GUID'
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
      object TabSheetBase64: TTabSheet
        Caption = 'Base64'
        ImageIndex = 2
        DesignSize = (
          730
          42)
        object ComboBoxBase64: TComboBox
          Left = 0
          Top = 5
          Width = 730
          Height = 24
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          OnChange = ComboBoxChange
          OnKeyDown = ComboBoxSelectKeyDown
        end
      end
    end
  end
  object GroupBoxRange: TGroupBox
    Left = 0
    Top = 127
    Width = 742
    Height = 61
    Align = alTop
    Caption = #25628#32034#33539#22260
    TabOrder = 2
    object CheckBoxIgnoreCase: TCheckBox
      Left = 350
      Top = 25
      Width = 139
      Height = 18
      Hint = #26159#21542#24573#30053#22823#23567#20889
      Caption = #24573#30053#22823#23567#20889
      TabOrder = 2
    end
    object ComboBoxCode: TComboBox
      Left = 216
      Top = 22
      Width = 122
      Height = 24
      Hint = #26222#36890#23383#31526#32534#30721#26041#24335
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 1
      Text = 'Ansi'
      OnSelect = ComboBoxCodeSelect
      Items.Strings = (
        'Ansi'
        'Unicode'
        'Utf8')
    end
    object ComboBoxFilter: TComboBox
      Left = 15
      Top = 22
      Width = 195
      Height = 24
      Hint = #25193#23637#21517#21015#34920
      ItemHeight = 16
      TabOrder = 0
      Text = '*.*'
      Items.Strings = (
        '*.*'
        '*.js;*.css;*.html;*.htm;*.json'
        '*.php;*.tpl;*.html;*.htm;*.js;*.css'
        '*.exe;*.dll;*.ocx'
        '*.txt;*.ini;*.htm;*.html'
        '*.pas;*.dpr;*.dfm'
        '*.cpp;*.c;*.hpp;*.h'
        '*.bmp;*.jpg;*.gif;*.png')
    end
  end
  object GroupBoxFileList: TGroupBox
    Left = 0
    Top = 188
    Width = 742
    Height = 356
    Align = alClient
    Caption = #25991#20214#25968#25454
    TabOrder = 3
    object ListViewFileList: TListView
      Left = 2
      Top = 49
      Width = 738
      Height = 305
      Align = alClient
      Columns = <
        item
          Caption = #25991#20214#21517
          Width = 78
        end
        item
          Caption = #36335#24452
        end
        item
          Caption = #22320#22336
          Width = 78
        end
        item
          Caption = #26368#26032#20540
          Width = 138
        end
        item
          Caption = #21382#21490#20540
          Width = 138
        end>
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenuList
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = ListViewFileListChange
      OnColumnClick = ListViewFileListColumnClick
      OnCompare = ListViewFileListCompare
      OnContextPopup = ListViewFileListContextPopup
      OnCustomDrawItem = ListViewFileListCustomDrawItem
      OnDblClick = ListViewFileListDblClick
      OnKeyDown = ListViewFileListKeyDown
      OnMouseDown = ListViewFileListMouseDown
      OnSelectItem = ListViewFileListSelectItem
    end
    object ToolBarMemoryList: TToolBar
      Left = 2
      Top = 18
      Width = 738
      Height = 31
      ButtonHeight = 30
      ButtonWidth = 31
      Caption = 'ToolBarMemoryList'
      Images = ImageListTools
      TabOrder = 1
      TabStop = True
      object ToolButtonAddressInc: TToolButton
        Left = 0
        Top = 0
        Action = ActionAddressInc
        OnMouseDown = ToolButtonMouseDown
        OnMouseUp = ToolButtonAddressIncMouseUp
      end
      object ToolButtonAddressDec: TToolButton
        Left = 31
        Top = 0
        Action = ActionAddressDec
        DropdownMenu = PopupMenuAddress
        Style = tbsDropDown
        OnMouseDown = ToolButtonMouseDown
        OnMouseUp = ToolButtonAddressIncMouseUp
      end
      object ToolButtonSeparatorAddress: TToolButton
        Left = 81
        Top = 0
        Width = 8
        Caption = 'ToolButtonSeparatorAddress'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButtonLengthInc: TToolButton
        Left = 89
        Top = 0
        Action = ActionLengthInc
        OnMouseDown = ToolButtonMouseDown
        OnMouseUp = ToolButtonAddressIncMouseUp
      end
      object ToolButtonLengthDec: TToolButton
        Left = 120
        Top = 0
        Action = ActionLengthDec
        DropdownMenu = PopupMenuLength
        Style = tbsDropDown
        OnMouseDown = ToolButtonMouseDown
        OnMouseUp = ToolButtonAddressIncMouseUp
      end
      object ToolButtonRemove: TToolButton
        Left = 170
        Top = 0
        Action = ActionRemove
      end
      object ToolButtonSeparatorLength: TToolButton
        Left = 201
        Top = 0
        Width = 8
        Caption = 'ToolButtonSeparatorLength'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButtonDelete: TToolButton
        Left = 209
        Top = 0
        Action = ActionDelete
      end
      object ToolButtonHex: TToolButton
        Left = 240
        Top = 0
        Action = ActionHex
      end
      object ToolButtonCopy: TToolButton
        Left = 271
        Top = 0
        Action = ActionCopy
        DropdownMenu = PopupMenuCopy
        Style = tbsDropDown
      end
      object ToolButtonSave: TToolButton
        Left = 321
        Top = 0
        Action = ActionSave
      end
      object ToolButtonInsert: TToolButton
        Left = 352
        Top = 0
        Action = ActionInsert
      end
      object ToolButtonSeparatorEdit: TToolButton
        Left = 383
        Top = 0
        Width = 8
        Caption = 'ToolButtonSeparatorEdit'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButtonRefurbish: TToolButton
        Left = 391
        Top = 0
        Action = ActionRefurbish
      end
      object ToolButtonEdit: TToolButton
        Left = 422
        Top = 0
        Action = ActionEdit
      end
      object ToolButtonEditor: TToolButton
        Left = 453
        Top = 0
        Width = 8
        ImageIndex = 20
        Style = tbsSeparator
      end
      object ToolButtonHexEditor: TToolButton
        Left = 461
        Top = 0
        Action = ActionHexEditor
      end
      object ToolButtonAsmDisplay: TToolButton
        Left = 492
        Top = 0
        Action = ActionAsmDisplay
      end
      object ToolButtonOpenDir: TToolButton
        Left = 523
        Top = 0
        Action = ActionOpenDir
      end
      object ToolButtonSeparatorSearch: TToolButton
        Left = 554
        Top = 0
        Width = 7
        Caption = 'ToolButtonSeparatorSearch'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButtonClear: TToolButton
        Left = 561
        Top = 0
        Action = ActionClear
      end
      object ToolButtonSearch: TToolButton
        Left = 592
        Top = 0
        Action = ActionSearch
      end
    end
  end
  object ToolBarSelect: TToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 34
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBarMemoryList'
    EdgeInner = esNone
    Images = ImageListTools
    TabOrder = 1
    TabStop = True
    Transparent = True
    OnResize = ToolBarSelectResize
    object ImageDrag: TImage
      Left = 0
      Top = 0
      Width = 31
      Height = 30
      Hint = #36890#36807#25176#25341#36873#25321#31383#20307#36827#31243
      Margins.Top = 6
      Center = True
      OnMouseDown = ImageDragMouseDown
      OnMouseMove = ImageDragMouseMove
      OnMouseUp = ImageDragMouseUp
    end
    object ToolButtonSelectFile: TToolButton
      AlignWithMargins = True
      Left = 31
      Top = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Action = ActionSelectFile
    end
    object ToolButtonSelectDir: TToolButton
      AlignWithMargins = True
      Left = 62
      Top = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Action = ActionSelectDir
    end
    object ToolButtonSelectWindow: TToolButton
      AlignWithMargins = True
      Left = 93
      Top = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Action = ActionSelectWindow
    end
    object ToolButtonSelectProcess: TToolButton
      AlignWithMargins = True
      Left = 124
      Top = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Action = ActionSelectProcess
    end
    object ToolButtonSeparatorSelect: TToolButton
      Left = 155
      Top = 0
      Width = 8
      Caption = 'ToolButtonSeparatorSelect'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ComboBoxSelect: TComboBox
      Left = 163
      Top = 3
      Width = 358
      Height = 24
      Hint = #38656#35201#20998#26512#30340#25991#20214#21517
      BevelInner = bvLowered
      BevelOuter = bvNone
      Ctl3D = False
      ItemHeight = 16
      ParentCtl3D = False
      TabOrder = 0
      OnChange = ComboBoxSelectChange
      OnKeyDown = ComboBoxSelectKeyDown
    end
  end
  object MainMenuOne: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Images = ImageListTools
    Left = 48
    Top = 216
    object MenuItemFile: TMenuItem
      Caption = #25991#20214'(&F)'
      object MenuItemSelectDir: TMenuItem
        Action = ActionSelectDir
      end
      object MenuItemSelectFile: TMenuItem
        Action = ActionSelectFile
      end
      object MenuItemSelectProcess: TMenuItem
        Action = ActionSelectProcess
      end
      object MenuItemSelectWindow: TMenuItem
        Action = ActionSelectWindow
      end
      object MenuItemOpenDir: TMenuItem
        Action = ActionOpenDir
      end
      object MenuItemClose: TMenuItem
        Action = ActionClose
      end
    end
    object MenuItemSearch: TMenuItem
      Caption = #25628#32034'(&S)'
      object MenuItemSearchA: TMenuItem
        Action = ActionSearch
      end
      object MenuItemInsert: TMenuItem
        Action = ActionInsert
      end
      object MenuItemAsmDisplay: TMenuItem
        Action = ActionAsmDisplay
      end
      object MenuItemHexEditor: TMenuItem
        Action = ActionHexEditor
      end
      object MenuItemRemove: TMenuItem
        Action = ActionRemove
      end
    end
    object MenuItemSelect: TMenuItem
      Caption = #36873#25321'(&E)'
      object MenuItemSelectAll: TMenuItem
        Action = ActionSelectAll
      end
      object MenuItemSelectNotA: TMenuItem
        Action = ActionSelectNot
      end
      object MenuItemSelectChangedA: TMenuItem
        Action = ActionSelectChanged
      end
      object MenuItemAddressInc: TMenuItem
        Action = ActionAddressInc
      end
      object MenuItemAddressDec: TMenuItem
        Action = ActionAddressDec
      end
      object MenuItemLengthDec: TMenuItem
        Action = ActionLengthDec
      end
      object MenuItemLengthInc: TMenuItem
        Action = ActionLengthInc
      end
      object MenuItemCopyA: TMenuItem
        Action = ActionCopy
      end
      object MenuItemDelete: TMenuItem
        Action = ActionDelete
      end
      object MenuItemEdit: TMenuItem
        Action = ActionEdit
      end
      object MenuItemHex: TMenuItem
        Action = ActionHex
      end
      object MenuItemRefurbish: TMenuItem
        Action = ActionRefurbish
      end
      object MenuItemSave: TMenuItem
        Action = ActionSave
      end
      object MenuItemGetNewValueA: TMenuItem
        Action = ActionGetNewValue
      end
    end
    object MenuItemOption: TMenuItem
      Caption = #36873#39033'(&O)'
      object MenuItemAddress: TMenuItem
        Caption = #22320#22336#20559#31227'(&A)'
        object MenuItemAddress1ByteA: TMenuItem
          Action = ActionAddress1Byte
        end
        object MenuItemAddress16ByteA: TMenuItem
          Action = ActionAddress16Byte
        end
        object MenuItemAddress256ByteA: TMenuItem
          Action = ActionAddress256Byte
        end
        object MenuItemAddress1024ByteA: TMenuItem
          Action = ActionAddress1024Byte
        end
        object MenuItemAddress4096ByteA: TMenuItem
          Action = ActionAddress4096Byte
        end
        object MenuItemAddressCustomA: TMenuItem
          Action = ActionAddressCustom
        end
      end
      object MenuItemLength: TMenuItem
        Caption = #38271#24230#20559#31227'(&L)'
        object MenuItemLength1ByteA: TMenuItem
          Action = ActionLength1Byte
        end
        object MenuItemLength16ByteA: TMenuItem
          Action = ActionLength16Byte
        end
        object MenuItemLength32ByteA: TMenuItem
          Action = ActionLength32Byte
        end
        object MenuItemLengthCustomA: TMenuItem
          Action = ActionLengthCustom
        end
      end
      object MenuItemCopy: TMenuItem
        Caption = #22797#21046#26041#24335'(&C)'
        object MenuItemCopyAllA: TMenuItem
          Action = ActionCopyAll
        end
        object MenuItemCopyFileNameA: TMenuItem
          Action = ActionCopyFileName
        end
        object MenuItemCopyNewA: TMenuItem
          Action = ActionCopyNew
        end
        object MenuItemCopyOldA: TMenuItem
          Action = ActionCopyOld
        end
        object MenuItemCopyAddressA: TMenuItem
          Action = ActionCopyAddress
        end
        object N5: TMenuItem
          Action = ActionCopyPathName
        end
      end
      object MenuItemDoubleClickA: TMenuItem
        Caption = #21452#20987#21151#33021'(&D)'
        object MenuItemDoubleGetA: TMenuItem
          Action = ActionDoubleGet
        end
        object MenuItemDoubleHexA: TMenuItem
          Action = ActionDoubleHex
        end
        object MenuItemDoubleDisplayA: TMenuItem
          Action = ActionDoubleDisplay
        end
        object N6: TMenuItem
          Action = ActionDoubleExplorer
        end
      end
      object N7: TMenuItem
        Caption = #24377#20986#33756#21333
        object N8: TMenuItem
          Action = ActionPopupSystem
        end
        object N9: TMenuItem
          Action = ActionPopupInternal
        end
      end
    end
    object MenuItemHelp: TMenuItem
      Caption = #24110#21161'(&H)'
      object MenuItemLiveUpdate: TMenuItem
        Action = ActionLiveUpdate
      end
      object MenuItemHelpA: TMenuItem
        Action = ActionHelp
      end
      object MenuItemBlogA: TMenuItem
        Action = ActionBlog
      end
      object MenuItemAbout: TMenuItem
        Action = ActionAbout
      end
    end
  end
  object ImageListDrag: TImageList
    Height = 23
    Width = 27
    Left = 202
    Top = 216
    Bitmap = {
      494C01010200040024001B001700FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006C000000170000000100200000000000D026
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C60000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000000000000C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000006C0000001700000001000100
      00000000700100000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ImageListSort: TImageList
    Height = 10
    Width = 10
    Left = 264
    Top = 216
    Bitmap = {
      494C01010200040024000A000A00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000280000000A00000001002000000000004006
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000084848400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000848484000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      84000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000084848400848484000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      00008484840000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00000000000000000000000000000000008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000280000000A0000000100010000000000500000000000000000000000
      000000000000000000000000FFFFFF00FFFFF00000000000807CF00000000000
      9E78700000000000DEFB700000000000CCF3300000000000EDF7B00000000000
      E1E7900000000000F3E0100000000000FFFFF00000000000FFFFF00000000000
      00000000000000000000000000000000000000000000}
  end
  object ImageListTools: TImageList
    Height = 24
    Width = 24
    Left = 233
    Top = 216
    Bitmap = {
      494C0101170018000C0018001800FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000074848F006B7985005F6C7600505C6500414B
      53003039400022292F00151B20000D1217000D1217000D1217000D1217000D12
      1700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F600DFDFDF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DFDFDF00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000076879200A2DFF0006FCDEA0048B8E20036AE
      DB002CA9D90025A1D2002098C7001F8EBC001D83AE00187EAB001E719600151B
      2000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600C8C8C800838383006C6C6C006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C0083838300C8C8
      C800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007C8E9800B0EAF6009FE9FB0092E4FC0081DD
      FB0074D6FA0067CEF7005CC6F4004CBCF00040B4EC0034AAE800147BA9002C33
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      8400840084008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFDFDF001C82B5001A81B300177DB000157BAE001278AB000F75A8000C72
      A5000A70A300076DA000056B9E0003699C0001679A00006699004B4B4B008383
      8300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080919C00B6EDF800AAECFB009BE8FB008FE3
      FC0081DDFB0070D5F90067CEF7005AC5F4004CBCF0003CB2EC000F82B4003A42
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084008400840084000000
      000000000000C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002187BA0066CCFF001F85B80099FFFF006ED4FF006ED4FF006ED4FF006ED4
      FF006ED4FF006ED4FF006ED4FF006ED4FF003AA0D30099FFFF00006699006D6D
      6D00000000000000000000000000000000000000000000000000000000000000
      0000A5A55F009A9A560089894D00737341005F5F36004848290033331D002222
      130017170D0017170D0017170D0017170D0017170D004ABBF0000B8ABF004852
      5B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084008400840000000000000000000000
      000000000000C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000248ABD0066CCFF00268CBF0099FFFF007AE0FF007AE0FF007AE0FF007AE0
      FF007AE0FF007AE0FF007AE0FF007AE0FF0043A9DC0099FFFF0001679A006C6C
      6C00000000000000000000000000000000000000000000000000000000000000
      0000A6A66100DCDCBB00C4C49700B3B37700AAAA6800A6A660009F9F59009494
      53008D8D4F00838349007C7C4600727240002222130057C4F3000B8FC7005662
      6A00000000000000000000000000000000000000000000000000000000000000
      0000848484008400840084008400000000000000000000000000000000008400
      84008400840000000000C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000278DC00066CCFF002C92C50099FFFF0085EBFF0085EBFF0085EBFF0085EB
      FF0085EBFF0085EBFF0085EBFF0085EBFF004DB3E60099FFFF0003699C006C6C
      6C00000000000000000000000000000000000000000000000000000000000000
      0000ABAB6900E2E2C700DBDBC000D7D7B800D0D0AC00CBCBA300C5C59900C0C0
      9000B9B98300B3B37800AEAE6E00797944004242250062CCF7001899CF00626F
      7900000000000000000000000000000000000000000000000000000000000000
      0000848484008400840000000000000000000000000084008400840084008400
      8400840084008400840000000000C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000298FC20066CCFF003298CB0099FFFF0091F7FF0091F7FF0091F7FF0091F7
      FF0091F7FF0091F7FF0091F7FF0091F7FF0056BCEF0099FFFF00056B9E006C6C
      6C00000000000000000000000000000000000000000000000000000000000000
      0000AEAE6E00E5E5CB00DFDFC600DADABD00D5D5B500D0D0AC00CACAA100C5C5
      9900C0C08F00B9B98300B2B276007C7C4600555530007ED8FB005CC0F100626F
      7900000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000008400840084008400840084000084840000FF
      FF0084008400840084008400840000000000C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002C92C5006ED4FF003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF005FC5F80099FFFF00076DA0006D6D
      6D00000000000000000000000000000000000000000000000000000000000000
      0000B0B07200E7E7D000DEDEC500DDDDC300D8D8BA00D3D3B100CFCFAB00CACA
      A100C5C59800BEBE8C00B8B882008181480068683B008496A0008395A0007484
      8F00000000000000000000000000000000000000000000000000000000000000
      0000848484008400840084008400840084008400840084008400840084000084
      84008400840084008400840084008400840000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002E94C7007AE0FF002C92C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0081E6FF00FFFFFF000A70A3008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000B2B27600E7E7D000E2E2CC00E1E1CA00DCDCC200D7D7B900D3D3B100CFCF
      AA00CACAA100C5C59800BEBE8C0086864B007B7B450000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840000000000840084008400840084008400840084008400
      840000FFFF0000FFFF0084008400840084008400840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003096C90085EBFF0081E6FF002C92C5002C92C5002C92C5002C92C5002C92
      C5002C92C500278DC0002389BC001F85B8001B81B4001A81B3001A81B300DFDF
      DF00000000000000000000000000000000000000000000000000000000000000
      0000B4B47900E7E7D000E2E2CC00E2E2CC00DEDEC500DCDCC100D7D7B900D3D3
      B100CFCFAA00C9C9A000C4C49700949453008D8D4F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400000000008400840084008400840084008400
      8400840084000084840000FFFF0000FFFF008400840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003298CB0091F7FF008EF4FF008EF4FF008EF4FF008EF4FF008EF4FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00157BAE008C8C8C00DEDEDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6B67C00E7E7D000E9E9CF00E9E9CF00E9E9CF00E7E6CA00E5E5C600E1E1
      C200DEDEBB00DCDCB700D8D7B000C6C695008D8D4F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084000000000084008400840084008400
      8400008484008400840000FFFF0000FFFF008400840084008400840084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003399CC00FFFFFF0099FFFF0099FFFF0099FFFF0099FFFF00FFFFFF00248A
      BD002187BA001E84B7001C82B5001A81B300177DB000DFDFDF00F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7B78000B7B78000B7B78000B7B78000B7B78000B6B67C00B4B47900B4B4
      7900B3B37700B2B27600B0B07300B0B07200A5A55F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400840000000000840084008400
      840000FFFF0000FFFF0000FFFF00840084008400840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003399CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00298FC200C8C8
      C800F6F6F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8B88200DFDFC200E5E5CB00E5E5CB00DFDFC200D7D7B300B7B78000DEDE
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084008400000000008400
      8400840084008400840084008400840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC003298CB003096C9002E94C700DFDFDF00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7D400B8B88200B8B88200B8B88200B8B88200B8B88200DEDED7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084000000
      0000840084008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      8400840084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000008484000084840000848400008484000084
      8400008484000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000084848400FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C60000840000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6C6000084
      000000840000FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF0000000000FFFFFF0084848400848484008484
      840084848400848484008484840084848400FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600008400000084
      0000008400000084000000840000C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6C6000084
      000000840000FFFFFF008484000084840000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000FFFFFF000000000000000000848484008484
      840084848400848484008484840084848400FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C60000840000C6C6C600FFFFFF0084840000FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C60084840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60084840000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF0000000000FFFFFF0084848400848484008484
      840084848400848484008484840084848400FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF0084840000FFFFFF00C6C6
      C60000840000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C6008484000084840000FFFF
      FF000084000000840000C6C6C600FFFFFF00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000008484840000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000FFFFFF000000000000000000848484008484
      840084848400848484008484840084848400FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600008400000084
      0000008400000084000000840000C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000848484008484840000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000084000000840000C6C6C600FFFFFF00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C6008484840000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000840000C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008484840000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C60084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      840084848400848484008484840000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000000000000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF0000000000FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000008400000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF0000000000FFFF
      FF00FFFFFF000000000000000000FFFFFF000000FF000000FF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5D6D900B2B5C100A1A6
      B800A1A6B800B2B5C100D5D6D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E95B1005768B300627BD1007E9AE3008EAB
      EC008AA8E8007E9AE300617CD0005769B3008F95B20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5AABB00495FBB007B99E30094B7F00089B2EF007FACEE007BAA
      EE007BAAEE007FACEE0089B2EF0094B7F0007B98E300495FBB00A6AABB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707BAB005876D80083A6EE006A97EC005C8BE8005C8FEB005D90EB005D90
      EB005C8DE8005D90EB005B8CE8005D8EEB006A97EC0080A3EB005977DB00707B
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F7A
      AB005471D7006487E3004D78E4004A78E4004A78E2004C7BE6004D7CE6004D7D
      E6004C7CE3004D7CE6004B7AE3004B79E5004A78E4004C77E100658AE6005471
      D6006F7AAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A8BA003F5D
      CF004F73DC003862D9003863DA003965DB003A67DC003B68DD003C6ADE003C6A
      DE003C6ADE003C6ADE003B68DD003A67DC003965DB003863DA003862D9004F73
      DC003E5DCF00A4A8BA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000354EB7004162
      D7002B51D4002850D1002C56D8005886E600608CE6006291EA006292EB006392
      EB00628FE7006292EB00618EE700618FE9005886E6002B56D5002951D5002B51
      D4004061D400354EB70000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000878EAE002B49C7002345
      CC001D41CC001C41CA003A5DD500E5EAF500F0F2F400F3F5F700F3F5F700F3F5
      F700F0F2F400F3F5F700F0F2F400F3F5F700E5EAF500395CD2001D42CD001D41
      CC002244C9002C4ACA00878EAE00000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003E52AE001C3ABF001233
      BE001233BF001334C1003554CC00E9EBF300F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500E9EBF3003554CC001334C1001233
      BF001233BE001C3ABF003E52AE00000000000000000000000000000000000000
      000000000000FF00000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2D2D600233DB7002741BD001B37
      BD000F2CBB000C2AB800304CC800EDEEF600F6F6F600F9F9F900F9F9F900F9F9
      F900F6F6F600F9F9F900F6F6F600F9F9F900EDEEF6002F4BC5000D2BBB000F2C
      BB001A36BA002842C000233DB700D3D3D7000000000000000000000000000000
      000000000000FF0000000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000008484840000FFFF000000000000FFFF000000
      000000FFFF000000000000FFFF00000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEB1BF002B44C000384FBF00384F
      C200324AC0001F38B800324BC300EDEFF700F6F6F600FAFAFA00FAFAFA00FAFA
      FA00F6F6F600FAFAFA00F6F6F600FAFAFA00EDEFF700314AC0002039BB00324A
      C000374EBF003950C2002A44BE00B0B3C0000000000000000000000000000000
      000000000000FF0000000000000084848400FFFFFF00FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000848484000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009CA0B500364DC3003F55C1003E54
      C4003E54C4003D53C100586CCD00EFF1F800F7F7F700FAFAFA00FAFAFA00FAFA
      FA00F7F7F700FAFAFA00F7F7F700FAFAFA00EFF1F800576BCA003E54C4003E54
      C4003D53C1004056C400364DC3009CA0B5000000000000000000000000000000
      000000000000FF0000000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000008484840000FFFF000000000000FFFF000000
      000000FFFF000000000000FFFF00000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009CA0B6004057C5004A60C700475D
      C600475DC600475DC6006175CF00EEEFF500F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800EEEFF5006175CE00475DC600475D
      C600475DC6004A60C7004057C5009CA0B6000000000000000000000000000000
      000000000000FF0000000000000084848400FFFFFF00FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000848484000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFB2BF00485FCC00586DCE005368
      CF005368CF005167CC006B80D600F2F3F900F9F9F900FCFCFC00FCFCFC00FCFC
      FC00F9F9F900FCFCFC00F9F9F900FCFCFC00F2F3F9006A7ED3005368CF005368
      CF005167CC00596ED100475EC900B2B4C1000000000000000000000000000000
      000000000000FF0000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000008484840000FFFF000000000000FFFF000000
      000000FFFF000000000000FFFF00000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2D3D700475DC4006A7ED5005D72
      D2005D72D2005D72D2007487D700F0F1F700F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F0F1F7007486D7005D72D2005D72
      D2005D72D2006A7ED500475DC400D4D5D8000000000000000000000000000000
      000000000000FF00000000000000848484008400000084000000840000008400
      000084000000840000008400000084000000840000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000008484840084848400848484008484840000FF
      FF000000000000FFFF000000000000FFFF000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D5FB2007F91DE006B82
      DB006A81DB00697FD8008093DF00F4F5FB00FAFAFA00FDFDFD00FDFDFD00FDFD
      FD00FAFAFA00FDFDFD00FAFAFA00FDFDFD00F4F5FB007E90DC006A81DB006A81
      DB006A7FD8008294E1004D5FB200000000000000000000000000000000000000
      000000000000FF0000000000000084848400FFFFFF0084000000840000008400
      00008400000084000000FFFFFF0084000000FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000008484840000FFFF000000000000FFFF008484
      8400848484008484840084848400848484000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C92B000778ADB008296
      E300768DE000758ADD00768CDE00B7BFE700C7CDEA00CBD0ED00CBD0ED00CBD0
      ED00C7CDEA00CBD0ED00C7CDEA00CBD0ED00B7BFE7007589DB00768DE000768D
      E0007F93E000788DDE008C92B000000000000000000000000000000000000000
      000000000000FF00000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A5FBD00A0B0
      E9008398E4008095E3007F95E3007488DC007287DB007287DB007287DB007287
      DB007287DB007287DB007287DB007287DB007488DC007F94E3008095E3008398
      E400A0B0E9004A5FBD0000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A6AABA007389
      DE00A9BAF0008EA3E9008FA4EC008FA4EC008CA1E9008FA4EC008FA4EC008FA4
      EC008CA1E9008FA4EC008CA1E9008FA4EC008FA4EC008CA1E90091A6EC00A9BA
      F0007286DB00A7ABBB0000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000757F
      AC008B9DE100B2C2F1009EB2F1009AAFF00096ACED009AAFF0009AAFF0009AAF
      F00096ACED009AAFF00096ACED009AAFF0009AAFF0009AAFEE00B5C5F4008B9D
      E100757FAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007680AD008194E000C5D1F600B0C1F300A3B7F200A1B6F200A1B6F200A1B6
      F200A1B6F200A1B6F200A1B6F200A3B7F200B0C1F300C5D1F5008194E0007680
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A8ABBB005468BF00A8B7ED00CBD7F700C6D4FA00BCCCFA00B8CA
      FA00B5C7F600BCCCFA00C3D1F700CEDAFB00A8B7ED005468BE00A8ABBB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009398B2005E6EB400778AD4009BABE700B1C0
      F200AEBDEF009BABE700778AD4005F6EB4009499B20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6D6D900B5B8C200A4A8
      B900A4A8B900B5B8C200D6D6D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000900000000100010000000000C00600000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000FFFFFFFF
      FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000
      FFFFFFFE000FFFFFFF000000F8000FFE000FFFE3FF000000F0000FFE000FFF81
      FF000000F0000FFE000FFE18FF000000F0000FF0000FF8607F000000F0000FF0
      000FF1803F000000F0000FF0000FF2001F000000F0000FF0000FF0000F000000
      F0000FF0000FF0001F000000F0000FF0007FFA001F000000F0000FF0007FFD00
      1F000000F0001FF0007FFE800F000000F0001FF0007FFF400F000000F807FFF0
      0FFFFFA03F000000FC0FFFF01FFFFFD0FF000000FFFFFFFFFFFFFFE3FF000000
      FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
      FF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFB42EFFB46EFFFFFFFFF3FFFFB5F5FFB7AEFF001FFFE1FFFF843
      BFF842AFF000FFFC0FFFFB5F5FFB5E4FF0007FF807FFFB42EFFCE2EFF0003FF0
      03FFFFFFFFFFFFFFF0001FF801FFF0000FF0000FF0000FFC00FFF0000FF0000F
      F001FFFE007FF0000FF0000FF001FFFF003FF0000FF0000FF001FFFF801FF000
      0FF0000FF8FF1FFFC00FF0000FF0000FFFFF9FFFE01FF0000FF0000FFFF75FFF
      F03FF0000FF0000FFFF8FFFFF87FF0000FF0000FFFFFFFFFFCFFF0000FF0000F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FB42EFFFFFFFFC001FFFFFFFFB5F5FF8001FFC001FFC007FF843BFF8001FFC00
      1FFDFF7FFB5F5FF8001FFC001FFD017FFB42EFF8001FFC001FFDFF7FFFFFFFF8
      001FFC001FFD017FFE01FFF8001FFC001FFDFF7FFEA9FFF8001FFC001FFD017F
      FED5FFF8001FFC001FFDFE3FF0A99FF8001FFC001FFD0C3FF4FD0FF8001FFC00
      1FFDF81FF6019FF8001FFC001FFD000FF4019FF8001FFC001FFDF00FF7EF9FF8
      003FFC003FFC001FF00E1FF8007FFC007FFFFC3FF00FFFF800FFFC00FFFFFE7F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFFDFFFFFFFFFFFFFFDFFBFF0000FFFFFFFFC001FF8FFFFFC3FBFFFE0
      0FF8001FF87F7FF0000FFFEFEFF8001FFC7EFFF81E7FFFE82FF8001FFE3CFFF0
      000FF80FEFF8001FFF19FFFE00FFFBE82FF8001FFF83FFF0000FFA0FEFF8001F
      FFC7FFFF81FFFBE90FF8001FFF83FFF0000FFA0F5FF8001FFF19FFFE027FFBEF
      3FF8001FFC3CFFF0000FFA407FF8001FF87E7FFC3CDFFBD7FFF8001FF8FFBFF0
      000FFBCFFFF8001FFFFFFFF8FFBFF81FFFF8001FFFFFFFF0000FFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFE
      007FFFFFFFFFFFFFFFFFFFF8001FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFF
      FFFFFFE00007FFFFFFFFFFFFFFFFFFC00003FFFFFFFFFFFFF07C1FC00003F800
      0FF8001FF47D1F800001FBFFEFFBFFDFF47D1F800001FA002FFA005FF0101F00
      0000FA002FFA555FF2041F000000FA002FFAAA5FF2041F000000FA002FFA555F
      F2041F000000FA002FFAAA5FF8003F000000FA002FFA555FFD147F000000FA00
      2FFA0A5FFC107F800001FA002FFA40DFFE38FF800001FA002FFB1FDFFEBAFFC0
      0003FBFFEFFBFFDFFE38FFC00003F8000FF8001FFFFFFFE00007FFFFFFFFFFFF
      FFFFFFF0000FFFFFFFFFFFFFFFFFFFF8001FFFFFFFFFFFFFFFFFFFFE007FFFFF
      FFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83
      FFFFFFFFFFFFFFFFFFFFFF83FFFFFFFFFFFFFFFFFFFFFF83FFFFFFFFFFF7FFFF
      EFFFFF83FFFFFFFFFF87FFFFE1FFF8003FFFFFFFFC003FFC003FF8003FF8001F
      FF87FFFFE1FFF8003FF8001FFFF7FFFFEFFFF8003FF8001FFFFFFFFFFFFFF800
      3FF8001FFFFFFFFFFFFFFF83FFFFFFFFFFFFFFFFFFFFFF83FFFFFFFFFFFFFFFF
      FFFFFF83FFFFFFFFFFFFFFFFFFFFFF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object ActionListTools: TActionList
    Images = ImageListTools
    Left = 78
    Top = 216
    object ActionAddressInc: TAction
      Caption = #24038#31227#22320#22336'(&L)'#9'<'
      Hint = #24038#31227#22320#22336
      ImageIndex = 0
      OnExecute = ActionOffsetExecute
    end
    object ActionAddressDec: TAction
      Caption = #21491#31227#22320#22336'(&R)'#9'>'
      Hint = #21491#31227#22320#22336
      ImageIndex = 1
      OnExecute = ActionOffsetExecute
    end
    object ActionLengthInc: TAction
      Caption = #22686#21152#38271#24230'(&A)'#9'+'
      Hint = #22686#21152#38271#24230
      ImageIndex = 2
      OnExecute = ActionOffsetExecute
    end
    object ActionLengthDec: TAction
      Caption = #20943#23569#38271#24230'(&S)'#9'-'
      Hint = #20943#23569#38271#24230
      ImageIndex = 3
      OnExecute = ActionOffsetExecute
    end
    object ActionSearch: TAction
      Caption = #25628#32034'(&S)'
      Hint = #25628#32034
      ImageIndex = 4
      ShortCut = 114
      OnExecute = ActionSearchExecute
    end
    object ActionSelectFile: TAction
      Caption = #36873#25321#25991#20214'(&F)'
      Hint = #36873#25321#25991#20214
      ImageIndex = 16
      ShortCut = 16463
      OnExecute = ActionSelectFileExecute
    end
    object ActionAddress1Byte: TAction
      Tag = 1
      Caption = '1'#23383#33410'(&1)'
      Checked = True
      GroupIndex = 1
      Hint = '1'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionAddress16Byte: TAction
      Tag = 16
      Caption = '16'#23383#33410'(&2)'
      GroupIndex = 1
      Hint = '16'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionAddress32Byte: TAction
      Tag = 32
      Caption = '32'#23383#33410'(&3)'
      GroupIndex = 1
      Hint = '32'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionAddress256Byte: TAction
      Tag = 256
      Caption = '256'#23383#33410'(&4)'
      GroupIndex = 1
      Hint = '256'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionAddress1024Byte: TAction
      Tag = 1024
      Caption = '1024'#23383#33410'(&5)'
      GroupIndex = 1
      Hint = '1024'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionAddress4096Byte: TAction
      Tag = 4096
      Caption = '4096'#23383#33410'(&6)'
      GroupIndex = 1
      Hint = '4096'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionAddressCustom: TAction
      Caption = #33258#23450#20041'(&0)'
      GroupIndex = 1
      Hint = #33258#23450#20041
      OnExecute = ActionAddressCustomExecute
    end
    object ActionLength1Byte: TAction
      Tag = 1
      Caption = '1'#23383#33410'(&1)'
      Checked = True
      GroupIndex = 2
      Hint = '1'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionLength16Byte: TAction
      Tag = 16
      Caption = '16'#23383#33410'(&2)'
      GroupIndex = 2
      Hint = '16'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionLength32Byte: TAction
      Tag = 32
      Caption = '32'#23383#33410'(&3)'
      GroupIndex = 2
      Hint = '32'#23383#33410
      OnExecute = ActionNByteExecute
    end
    object ActionLengthCustom: TAction
      Caption = #33258#23450#20041'(&0)'
      GroupIndex = 2
      Hint = #33258#23450#20041
      OnExecute = ActionLengthCustomExecute
    end
    object ActionDelete: TAction
      Caption = #21024#38500'(&D)'
      Hint = #21024#38500#36873#25321#39033
      ImageIndex = 8
      OnExecute = ActionDeleteExecute
    end
    object ActionClear: TAction
      Caption = #28165#38500'(&C)'
      Hint = #28165#38500
      ImageIndex = 9
      OnExecute = ActionClearExecute
    end
    object ActionEdit: TAction
      Caption = #32534#36753'(&E)'
      Hint = #32534#36753
      ImageIndex = 13
      OnExecute = ActionEditExecute
    end
    object ActionSave: TAction
      Caption = #20445#23384'(&S)'
      Hint = #25968#25454#22359#23384#20026#25991#20214
      ImageIndex = 11
      OnExecute = ActionSaveExecute
    end
    object ActionCopy: TAction
      Caption = #22797#21046'(&C)'
      Hint = #22797#21046
      ImageIndex = 10
      ShortCut = 16451
      OnExecute = ActionCopyExecute
    end
    object ActionHex: TAction
      Caption = #20999#25442#26174#31034#26041#24335'(&H)'
      Hint = #20999#25442#26174#31034#26041#24335
      ImageIndex = 12
      OnExecute = ActionOffsetExecute
    end
    object ActionRefurbish: TAction
      Caption = #21047#26032'(&R)'
      Hint = #21047#26032
      ImageIndex = 14
      ShortCut = 116
      OnExecute = ActionRefurbishExecute
    end
    object ActionSelectAll: TAction
      Caption = #20840#36873'(&O)'
      Hint = #20840#36873
      OnExecute = ActionSelectAllExecute
    end
    object ActionInsert: TAction
      Caption = #25554#20837'(&I)'
      Hint = #25554#20837#22320#22336#39033
      ImageIndex = 15
      ShortCut = 45
      OnExecute = ActionInsertExecute
    end
    object ActionRemove: TAction
      Caption = #20559#31227'(&M)'
      Hint = #35745#31639#20004#20010#22320#22336#38388#20559#31227
      ImageIndex = 17
      OnExecute = ActionRemoveExecute
    end
    object ActionHexEditor: TAction
      Caption = #21313#20845#36827#21046#32534#36753'(&H)'
      Hint = #21313#20845#36827#21046#32534#36753
      ImageIndex = 18
      OnExecute = ActionHexEditorExecute
    end
    object ActionAsmDisplay: TAction
      Caption = #27719#32534#23519#30475'(&A)'
      Hint = #27719#32534#23519#30475
      ImageIndex = 19
      OnExecute = ActionAsmDisplayExecute
    end
    object ActionCopyAll: TAction
      Tag = 1
      Caption = #22797#21046#25972#39033'(&O)'
      GroupIndex = 3
      Hint = #22797#21046#25972#39033
      OnExecute = ActionCopyNewExecute
    end
    object ActionCopyNew: TAction
      Tag = 2
      Caption = #22797#21046#26368#26032#20540'(&N)'
      GroupIndex = 3
      Hint = #22797#21046#26368#26032#20540
      OnExecute = ActionCopyNewExecute
    end
    object ActionCopyOld: TAction
      Tag = 3
      Caption = #22797#21046#21382#21490#20540'(&O)'
      GroupIndex = 3
      Hint = #22797#21046#21382#21490#20540
      OnExecute = ActionCopyNewExecute
    end
    object ActionCopyAddress: TAction
      Tag = 4
      Caption = #22797#21046#22320#22336'(&A)'
      GroupIndex = 3
      Hint = #22797#21046#22320#22336
      OnExecute = ActionCopyNewExecute
    end
    object ActionCopyFileName: TAction
      Tag = 5
      Caption = #22797#21046#25991#20214#21517'(&F)'
      GroupIndex = 3
      Hint = #22797#21046#25991#20214#21517#65292#19981#21253#25324#36335#24452
      OnExecute = ActionCopyNewExecute
    end
    object ActionCopyPathName: TAction
      Tag = 6
      Caption = #22797#21046#23436#25972#25991#20214#21517
      Checked = True
      GroupIndex = 3
      Hint = #22797#21046#23436#25972#25991#20214#36335#24452#21644#25991#20214#21517
      OnExecute = ActionCopyNewExecute
    end
    object ActionSelectWindow: TAction
      Caption = #36873#25321#31383#20307#36827#31243'(&W)'
      Hint = #36890#36807#31383#20307#36873#25321#36827#31243
      ImageIndex = 6
      ShortCut = 16471
      OnExecute = ActionSelectWindowExecute
    end
    object ActionSelectProcess: TAction
      Caption = #36873#25321#36827#31243'(&P)'
      Hint = #36890#36807#21015#34920#36873#25321#36827#31243
      ImageIndex = 7
      OnExecute = ActionSelectProcessExecute
    end
    object ActionSelectNot: TAction
      Caption = #21453#36873'(&N)'
      Hint = #21453#21521#36873#25321
      OnExecute = ActionSelectNotExecute
    end
    object ActionSelectChanged: TAction
      Caption = #36873#25321#25913#21464#39033'(&G)'
      Hint = #36873#25321#25913#21464#39033
      OnExecute = ActionSelectChangedExecute
    end
    object ActionClose: TAction
      Caption = #20851#38381'(&C)'
      Hint = #36864#20986#31243#24207
      OnExecute = ActionCloseExecute
    end
    object ActionOpenDir: TAction
      Caption = #25171#24320#25991#20214#25152#22312#30446#24405'(&D)'
      Hint = #25171#24320#25991#20214#25152#22312#30446#24405
      ImageIndex = 20
      ShortCut = 16453
      OnExecute = ActionOpenDirExecute
    end
    object ActionAbout: TAction
      Caption = #20851#20110'(&A)'
      Hint = #20851#20110#26412#36719#20214
      OnExecute = ActionAboutExecute
    end
    object ActionSelectDir: TAction
      Caption = #36873#25321#30446#24405'(&R)'
      Hint = #36873#25321#25628#32034#30446#24405
      ImageIndex = 21
      ShortCut = 16466
      OnExecute = ActionSelectDirExecute
    end
    object ActionHelp: TAction
      Caption = #24110#21161'(&H)'
      Hint = #25171#24320#24110#21161#25991#26723
      ImageIndex = 22
      OnExecute = ActionHelpExecute
    end
    object ActionDoubleGet: TAction
      Tag = 1
      Caption = #24471#21040#26368#26032#20540'(&G)'
      GroupIndex = 4
      Hint = #21452#20987#36873#25321#39033#24471#21040#26368#26032#20540#21040#36755#20837#26694#20013
      OnExecute = ActionDoubleGetExecute
    end
    object ActionDoubleHex: TAction
      Tag = 2
      Caption = #21313#20845#36827#21046#32534#36753#22120'(&H)'
      GroupIndex = 4
      Hint = #21452#20987#36873#25321#39033#29992#21313#20845#36827#21046#32534#36753#22120
      OnExecute = ActionDoubleGetExecute
    end
    object ActionDoubleDisplay: TAction
      Tag = 3
      Caption = #20999#25442#26174#31034#26041#24335'(&D)'
      GroupIndex = 4
      Hint = #21452#20987#36873#25321#39033#20999#25442#26174#31034#26041#24335
      OnExecute = ActionDoubleGetExecute
    end
    object ActionDoubleExplorer: TAction
      Tag = 4
      Caption = #25171#24320#25991#20214#22841
      Checked = True
      GroupIndex = 4
      OnExecute = ActionDoubleGetExecute
    end
    object ActionGetNewValue: TAction
      Caption = #33719#24471#26368#26032#20540
      Hint = #33719#24471#26368#26032#20540
      OnExecute = ActionGetNewValueExecute
    end
    object ActionBlog: TAction
      Caption = 'Blog(&B)'
      Hint = 'http://blog.sina.com.cn/u/589d32f5010007jf'
      OnExecute = ActionBlogExecute
    end
    object ActionLiveUpdate: TAction
      Caption = #22312#32447#21319#32423
      OnExecute = ActionLiveUpdateExecute
    end
    object ActionSysMenu: TAction
      Caption = #31995#32479#33756#21333'...'
      OnExecute = ActionSysMenuExecute
    end
    object ActionPopupSystem: TAction
      Tag = 1
      Caption = #25805#20316#31995#32479#25991#20214#24377#20986#33756#21333
      Checked = True
      GroupIndex = 7
      OnExecute = ActionPopupSystemExecute
    end
    object ActionPopupInternal: TAction
      Tag = 2
      Caption = #26412#31243#24207#20869#37096#33756#21333
      GroupIndex = 7
      OnExecute = ActionPopupSystemExecute
    end
  end
  object PopupMenuLength: TPopupMenu
    Tag = 1
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Images = ImageListTools
    Left = 140
    Top = 216
    object MenuItemLength1Byte: TMenuItem
      Action = ActionLength1Byte
    end
    object MenuItemLength16Byte: TMenuItem
      Action = ActionLength16Byte
    end
    object MenuItemLength32Byte: TMenuItem
      Action = ActionLength32Byte
    end
    object MenuItemLengthCustom: TMenuItem
      Action = ActionLengthCustom
    end
  end
  object PopupMenuAddress: TPopupMenu
    Tag = 1
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Images = ImageListTools
    Left = 109
    Top = 216
    object MenuItemAddress1Byte: TMenuItem
      Action = ActionAddress1Byte
    end
    object MenuItemAddress16Byte: TMenuItem
      Action = ActionAddress16Byte
    end
    object MenuItemAddress32Byte: TMenuItem
      Action = ActionAddress32Byte
    end
    object MenuItemAddress256Byte: TMenuItem
      Action = ActionAddress256Byte
    end
    object MenuItemAddress1024Byte: TMenuItem
      Action = ActionAddress1024Byte
    end
    object MenuItemAddress4096Byte: TMenuItem
      Action = ActionAddress4096Byte
    end
    object MenuItemAddressCustom: TMenuItem
      Action = ActionAddressCustom
    end
  end
  object OpenDialogOne: TOpenDialog
    Filter = 
      'All files(*.*)|*.*|Text files(*.txt)|*.txt|Data file(*.dat)|*.da' +
      't'
    Left = 296
    Top = 216
  end
  object PopupMenuCopy: TPopupMenu
    Tag = 6
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Images = ImageListTools
    Left = 172
    Top = 216
    object N4: TMenuItem
      Action = ActionCopyPathName
    end
    object MenuItemCopyAll: TMenuItem
      Action = ActionCopyAll
    end
    object MenuItemCopyNew: TMenuItem
      Action = ActionCopyNew
    end
    object MenuItemCopyOld: TMenuItem
      Action = ActionCopyOld
    end
    object MenuItemCopyAddress: TMenuItem
      Action = ActionCopyAddress
    end
    object MenuItemCopyFileName: TMenuItem
      Action = ActionCopyFileName
    end
  end
  object SaveDialogOne: TSaveDialog
    Filter = 
      'All files(*.*)|*.*|Text files(*.txt)|*.txt|Data file(*.dat)|*.da' +
      't'
    Left = 326
    Top = 216
  end
  object PopupMenuList: TPopupMenu
    Tag = 2
    Images = ImageListTools
    Left = 360
    Top = 216
    object N1: TMenuItem
      Action = ActionSysMenu
    end
    object MenuItemRefurbishB: TMenuItem
      Action = ActionRefurbish
    end
    object MenuItemHexB: TMenuItem
      Action = ActionHex
    end
    object MenuItemSearchB: TMenuItem
      Action = ActionSearch
    end
    object MenuItemDeleteB: TMenuItem
      Action = ActionDelete
    end
    object MenuItemClear: TMenuItem
      Action = ActionClear
    end
    object MenuItemCopyB: TMenuItem
      Action = ActionCopy
    end
    object MenuItemSelected: TMenuItem
      Caption = #36873#25321
      object MenuItemSelectAllB: TMenuItem
        Action = ActionSelectAll
      end
      object MenuItemSelectNot: TMenuItem
        Action = ActionSelectNot
      end
      object MenuItemSelectChanged: TMenuItem
        Action = ActionSelectChanged
      end
    end
    object MenuItemSaveB: TMenuItem
      Action = ActionSave
    end
    object MenuItemInsertB: TMenuItem
      Action = ActionInsert
    end
    object MenuItemGetNewValueC: TMenuItem
      Action = ActionGetNewValue
    end
    object MenuItemLineC: TMenuItem
      Caption = '-'
    end
    object MenuItemCopyC: TMenuItem
      Caption = #22797#21046#26041#24335
      Hint = #22797#21046#26041#24335
      object MenuItemCopyAllC: TMenuItem
        Action = ActionCopyAll
      end
      object MenuItemCopyFileNameC: TMenuItem
        Action = ActionCopyFileName
      end
      object MenuItemCopyAddressC: TMenuItem
        Action = ActionCopyAddress
      end
      object MenuItemCopyNewC: TMenuItem
        Action = ActionCopyNew
      end
      object MenuItemCopyOldC: TMenuItem
        Action = ActionCopyOld
      end
      object N3: TMenuItem
        Action = ActionCopyPathName
      end
    end
    object MenuItemDoubleClick: TMenuItem
      Caption = #21452#20987#21151#33021
      Hint = #21452#20987#21151#33021
      object MenuItemDoubleGetC: TMenuItem
        Action = ActionDoubleGet
      end
      object MenuItemDoubleHexC: TMenuItem
        Action = ActionDoubleHex
      end
      object MenuItemDoubleDisplayC: TMenuItem
        Action = ActionDoubleDisplay
      end
      object N2: TMenuItem
        Action = ActionDoubleExplorer
      end
    end
  end
  object TimerButton: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerButtonTimer
    Left = 16
    Top = 216
  end
end
