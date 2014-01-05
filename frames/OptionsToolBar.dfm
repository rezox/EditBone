inherited OptionsToolBarFrame: TOptionsToolBarFrame
  Width = 451
  Height = 305
  Align = alClient
  ExplicitWidth = 451
  ExplicitHeight = 305
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 305
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object VirtualDrawTree: TVirtualDrawTree
      AlignWithMargins = True
      Left = 4
      Top = 0
      Width = 447
      Height = 305
      Hint = 
        'Use drag and drop to move menu items. Right click popup menu to ' +
        'insert and delete items.'
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Ctl3D = True
      DragOperations = []
      EditDelay = 0
      Header.AutoSizeIndex = 0
      Header.DefaultHeight = 20
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Height = 20
      Header.Images = ImageList
      Header.Options = [hoAutoResize, hoShowSortGlyphs, hoVisible, hoAutoSpring]
      Images = ImageList
      Indent = 0
      ParentCtl3D = False
      PopupMenu = PopupMenu
      SelectionBlendFactor = 255
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
      TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toFullRowSelect, toMiddleClickSelect]
      WantTabs = True
      OnDragAllowed = VirtualDrawTreeDragAllowed
      OnDragOver = VirtualDrawTreeDragOver
      OnDragDrop = VirtualDrawTreeDragDrop
      OnDrawNode = VirtualDrawTreeDrawNode
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetImageIndex = VirtualDrawTreeGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      Columns = <
        item
          Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coAutoSpring]
          Position = 0
          Width = 443
          WideText = 'Menu Item'
        end>
    end
  end
  object ImageList: TBCImageList
    Left = 168
    Top = 166
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003FA074000089490000884700008949003FA07400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007070700000000000707070000000
      0000707070000000000070707000000000007070700000000000707070000000
      0000707070000000000070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008949000FE9AC0000E2A1000FE9AC0000894900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000087470020E4AF0000D99B0020E4AF0000874700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000087460031E2B50000D49A0031E2B50000874600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000087440044E4BC0000D0980044E4BC0000874400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003FA07300008A4800008947000089
      4700008846000083400058E3C30000CD980058E3C30000834000008846000089
      470000894700008A48003FA0730000000000000000002A50A400182DC300182D
      C300182DC300182DC300182DC300182DC300182DC300182DC300182DC300182D
      C300182DC300182DC3002A50A400000000000000000000000000000000000000
      0000000000000000000000000000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000089470069EBD20000D0A00000D0
      A10000D0A10000CE9E0000CB9A0000CA990000CB9A0000CE9E0000D0A10000D0
      A10000D0A00069EBD200008947000000000000000000182DC3007183FF007183
      FF007183FF007183FF007183FF007183FF007183FF007183FF007183FF007183
      FF007183FF007183FF00182DC3000000000070707000AB7D4D00AB7D4D00AB7D
      4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D
      4D00AB7D4D00AB7D4D0070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000088440075E8D30000C6990000C6
      990000C6990000C6990000C6990000C6990000C6990000C6990000C6990000C6
      990000C6990075E8D300008844000000000000000000182DC3007183FF007183
      FF007183FF007183FF007183FF007183FF007183FF007183FF007183FF007183
      FF007183FF007183FF00182DC30000000000AB7D4D0070707000AB7D4D007070
      7000AB7D4D0070707000AB7D4D0070707000AB7D4D0070707000AB7D4D007070
      7000AB7D4D0070707000AB7D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008946008AEEDE008AEADA008BEA
      D9008BEAD9008BE8D70052D8BE0000C2960052D8BE008BE8D7008BEAD9008BEA
      D9008AEADA008AEEDE00008946000000000000000000182DC3007183FF007183
      FF007183FF007183FF007183FF007183FF007183FF007183FF007183FF007183
      FF007183FF007183FF00182DC3000000000070707000AB7D4D00AB7D4D00AB7D
      4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D4D00AB7D
      4D00AB7D4D00AB7D4D0070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004FB0830000894600008743000087
      43000086420000813A0097E9DC0000BE950097E9DC0000813A00008642000087
      430000874300008946001094570000000000000000002D54A800182DC300182D
      C300182DC300182DC300182DC300182DC300182DC300182DC300182DC300182D
      C300182DC300182DC3001C4C9C00000000000000000000000000000000000000
      0000000000000000000000000000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000086410099EADE0000BB950099EADE0000864100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000087420098E9DE0000B7940098E9DE0000874200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6F73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000088430097E7E00000B3950097E7E00000884300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676E760000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000676E7600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008946009AE9E60096E6E1009AE9E60000894600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6F73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004FB0820000894600008843000089460010945600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6F7300000000006B6F73000000
      00006B6F7300000000006B6F7300000000006B6F7300000000006B6F73000000
      00006B6F7300000000006B6F7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000F83FFFFF55550000
      F83FFFFFFEFF0000F83FFFFF7FFD0000F83FFFFFFEFF0000F83FFFFF7FFD0000
      00018001FEFF0000000180010001000000018001000100000001800100010000
      00018001FEFF0000F83FFFFF7FFD0000F83FFFFFFEFF0000F83FFFFF7FFD0000
      F83FFFFFFEFF0000F83FFFFF5555000000000000000000000000000000000000
      000000000000}
  end
  object ButtonActionList: TActionList
    Images = ImageList
    Left = 245
    Top = 173
    object AddItemAction: TAction
      Caption = 'Add Item'
      Hint = 'Add item'
      ImageIndex = 0
      OnExecute = AddItemActionExecute
    end
    object DeleteItemAction: TAction
      Caption = 'Delete Item'
      Hint = 'Delete item'
      ImageIndex = 1
    end
    object AddDividerAction: TAction
      Caption = 'Add Divider'
      Hint = 'Add divider'
      ImageIndex = 2
    end
  end
  object PopupMenu: TPopupMenu
    Images = ImageList
    Left = 280
    Top = 86
    object Additem1: TMenuItem
      Action = AddItemAction
    end
    object AddDivider1: TMenuItem
      Action = AddDividerAction
    end
    object DeleteItem1: TMenuItem
      Action = DeleteItemAction
    end
  end
end
