object DirectoryFrame: TDirectoryFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabOrder = 0
    TabDragDrop = True
    HoldShiftToDragDrop = False
  end
  object DirectoryActionList: TActionList
    Images = ImagesList
    Left = 84
    Top = 68
    object DirectoryOpenAction: TAction
      Caption = '&Open Directory'
      Hint = 'Open directory'
      ImageIndex = 0
      OnExecute = DirectoryOpenActionExecute
    end
    object DirectoryCloseAction: TAction
      Caption = '&Close Directory'
      Hint = 'Close directory'
      ImageIndex = 1
      OnExecute = DirectoryCloseActionExecute
    end
    object DirectoryEditAction: TAction
      Caption = '&Edit Directory'
      Hint = 'Edit directory'
      ImageIndex = 2
      OnExecute = DirectoryEditActionExecute
    end
    object DirectoryRefreshAction: TAction
      Caption = '&Refresh'
      Hint = 'Refresh files'
      ImageIndex = 3
      OnExecute = DirectoryRefreshActionExecute
    end
    object DirectoryRenameAction: TAction
      Caption = 'Re&name'
      Hint = 'Rename a file'
      ImageIndex = 4
      OnExecute = DirectoryRenameActionExecute
    end
    object DirectoryDeleteAction: TAction
      Caption = '&Delete'
      Hint = 'Delete a file'
      ImageIndex = 5
      OnExecute = DirectoryDeleteActionExecute
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ImagesList
    Left = 104
    Top = 156
    object OpenDirectory1: TMenuItem
      Action = DirectoryOpenAction
      Hint = 'Open a new directory'
    end
    object CloseDirectory1: TMenuItem
      Action = DirectoryCloseAction
      Hint = 'Close the active directory'
    end
    object EditDirectory1: TMenuItem
      Action = DirectoryEditAction
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Refresh1: TMenuItem
      Action = DirectoryRefreshAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Rename1: TMenuItem
      Action = DirectoryRenameAction
    end
    object Delete1: TMenuItem
      Action = DirectoryDeleteAction
    end
  end
  object ImagesList: TBCImageList
    Left = 264
    Top = 96
    Bitmap = {
      494C010106005400C00110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDA46200EDA46200EDA4
      6200EDA46200EDA4620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDA46200FFE5BA00FECCA300F4B6
      8100EDA46200EDA46200EDA46200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF4E700FFE7
      CF00FFE5C900FFE2C200FFE0BD00FFDDB600FFDAB100FFD7AD00FFD5A900FFD4
      A500FFD3A300FFD9B100CA680000000000000000000000000000000000000000
      0000000000000000000000000000EDA46200FFF6CC00FEE2B700FCCA9F00F4B6
      8100EDA46200EDA46200EDA46200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFEEDE00FEE3
      C500FEE0C000FEDDBA00FEDAB400FED7AD00FED4A900FED1A40000000000FECE
      9C0000000000FFD3A400CA680000000000000000000000000000000000000000
      0000000000000000000000000000EDA46200FFFACD00FEE2B700FECCA300F4B6
      8100EEA66800EDA46200EDA46200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF2E500FFE7
      CB00FFE3C6003F52CE000D29D3002E44CC00D4BCB800FED5A900FFD3A4000000
      0000FECE9D00FFD4A600CA680000000000000000000000000000000000000000
      0000000000000000000000000000F4CA9000FFFFD400FFE5BA00FED0A600F4B6
      8100EEA66800EDA46200EDA46200EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF6EB00FEEA
      D100FEE6CB00FEE3C6000000E100A49DC300FEDAB500FED8AF00FED7AA000000
      0000FED0A100FFD7AA00CA680000000000000000000000000000000000000000
      00000000000000000000EDA46200FEF2C700FFFACD00FED0A600F4B68100EEBA
      7900EEA66800EDA46200EDA46200EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFAF200FEED
      D900FFE9D100FFE6CB000000E100A5A1C700FEDDBA00FEDAB500FED8B0000000
      0000FED3A500FFD8AD00CA680000000000000000000000000000000000000000
      00000000000000000000EDA46200E7AB6800D77E3200DA813600E3954C00EEA6
      6800EEBA7900EFB47300EEA66800EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFCF800FFEF
      E000FEEDD900FFEAD3000000E100A4A3CC00FFE1C100FFDDBA00FEDCB5000000
      0000FED5AA00FFDAB400CA680000000000000000000000000000000000000000
      00000000000000000000D77E3200B7410000C95F1300DE833900EDA46200F0C2
      8400F7DAA400F4D79F00EEBA7900EAA35F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFE00FFF3
      E500FFEFE000FEEDD9000000E100A3A3D100FEE3C700FFE1C100FFDEBB000000
      0000FED8B000FFDDBA00CA680000000000000000000000000000000000000000
      00000000000000000000DE833900C2550B00CB651800DE833900004B0000004B
      0000FCEEBD00FEE2B700EEBA7900EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00D5D5
      EE00FFF3E500FFEFE0000000E100ADAFDE00FEE7CE00D4C7CE00FFE2C2000000
      0000FEDCB600FFE0C000CA680000000000000000000000000000000000000000
      000000000000000000000000000000000000DE833900004B00001E9A360039D7
      6700004B0000EDA4620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF004B64
      DE00B3B7E100F9ECDF000000E100ADB1E200E2D3D0002740D000FFE5C7000000
      0000FFDEBB00FFE3C500CA680000000000000000000000000000000000000000
      000093625D009C695E000000000000000000004B00000A72120026AC440023BA
      41000C861600004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF007186
      E2000A2BDD000A2ADC000A2ADA000A2AD9000A29D8003950D200FEE7CE000000
      0000FFE1C200FFE6CB00CA68000000000000AD8179009F6F6A00C79D8300C498
      7E009C695E00B6784400915C590000000000004B0000004B00000A7212000C8C
      1800004B0000004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00F7F4
      F000F7F3EC00F8F1E900F7EFE400F9EDE000FAEBDC00F9E9D50000000000FFE9
      CF0000000000FFEAD300CA68000000000000A1767500DEB27D009F5B33009C6B
      6700C2937900AC765800915C590000000000000000000000000002630500004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF400FFF7EF00FFF4
      E700FFF0E100FFF7EE00CA680000000000008C595900905B5500AF5E1600D1A1
      7700A16E6300A16A50000000000000000000000000000000000002630500004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA680000000000000000000000000000000000009E5E3A00A170
      6500C5A9AB00976867000000000000000000004B0000004B0000004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C5959009365
      6600976868000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000007000000070000000700000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000047503000000000000700000000000000000000000000000007000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000007000000070000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000007000000070000000700000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000007000000070000000700000007000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007000000070000000700000007000000070
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000070000000700000007000000070
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      000018640C001C620C0000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000700000007000000070
      0000000000000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      00001C650D001C660E0000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      B5000000B500000000000000B5000000B5008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007000000000000000000000000000000070000000000000047503000070
      00000000000000000000000000000000000084240500FFC17900E58E4000D36E
      1A008424050000000000000000000000000000000000000000001B670F001874
      160018781800187617001A6D12001C650D0084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B50084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      0000000000000008E10000000000000000000000000000000000000000000000
      0000000000000070000000700000007000000000000000000000000000000070
      0000000000000000000000000000000000008323040084240500842305008323
      04008424050000000000000000000000000000000000000000001B670F001973
      1600187E1C00187B1B001A6C11001C650D008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      00000000B5000000B5000000B500000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      00000008E100000000000008E100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187919001879190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000008E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B6910001B69100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B500000000000000B5000000B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000008E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFF8300000000C003FF0100000000
      8001FE01000000008001FE01000000008001FE00000000008001FC0000000000
      8001FC00000000008001FC00000000008001FC00000000008001FF0300000000
      8001F303000000008001010300000000800101CF00000000800103CF00000000
      C003C31F00000000FFFFC7FF00000000DC1FDC1FDC1FFFFFC01FC01FC01FFFFF
      DC1FDC1FDC1FEE3FDFFFDFFFDFFFE5DFDC1FDC1FDC1FE3EFC01FC01FC01FE1EF
      DC1FDC1FDC1FE0FFDFFFDFFFDFFFFFFFDC1FDC1FDC1FFE0FC01FC01FC01FEF0F
      DC13DC1FDC1FEF8F07F307E407E1F74F07C007E007E9F8EF07C007F107E5FFFF
      FFF3FFE0FFE0FFFFFFF3FFE4FFFEFFFF00000000000000000000000000000000
      000000000000}
  end
end
