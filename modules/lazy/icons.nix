{lib, ...}: let
  inherit (lib) mkOption types;
in {
  # options.lib.lazy.icons = mkOption { type = types.attrs; default = { }; };
  #
  # config.lib.lazy.icons = {
  #   padLeading = icon: " " + icon;
  #   padTrailing = icon: icon + " ";
  #
  #   TrafficLight = "󰔫";
  #   traffic_light.Outlined = "󱠪";
  #
  #   Alert = "󰀦";
  #   alert.Outline = "󰀪":
  #   alert = {
  #     Box = "󰀧";
  #     box.Outline = "󰳤";
  #
  #     Circle = "󰀨";
  #     circle.Check = "󱇭";
  #     circle.check.Outline = "󱇮";
  #     circle.Outline = "󰗖";
  #
  #     Decagram = "󰚽";
  #     decagram.Outline = "󰳥";
  #
  #     Minus = "󱒻";
  #     minus.Outline = "󱒾";
  #
  #     Octagon = "󰀩";
  #     octagon.Outline = "󰳦";
  #
  #     Octagram = "󰝧";
  #     octagram.Outline = "󰳧";
  #
  #     Plus = "󱒺";
  #     plus.Outline = "󱒽";
  #
  #     Remove = "󱒼";
  #     remove.Outline = "󱒿";
  #
  #     Rhombus = "󱇎";
  #     rhombus.Outline = "󱇏";
  #   };
  #
  #   arrow = {
  #     All = "󰁁";
  #
  #     bottom = {
  #       Left = "󰁂";
  #       left = {
  #         Thick = "󰦸";
  #
  #         Thin = "󱦶";
  #         thin.circle.Outline = "󱖖";
  #
  #         bold = {
  #           Box = "󱥤";
  #           box.Outline = "󱥥";
  #           Outline = "󰦷";
  #         };
  #       };
  #
  #       Right = "󰁃";
  #       right = {
  #         Thick = "󰦺";
  #
  #         Thin = "󱦷";
  #         thin.circle.Outline = "󱖕";
  #
  #         bold = {
  #           Box = "󱥦";
  #           box.Outline = "󱥧";
  #           Outline = "󰦹";
  #         };
  #       };
  #     };
  #
  #     top = {
  #       Left = "󰁛";
  #       left = {
  #         Thick = "󰧄";
  #         Thin = "󱦵";
  #
  #         bold = {
  #           Box = "󱥨";
  #           box.Outline = "󱥩";
  #
  #           Outline = "󰧃";
  #         };
  #
  #         bottom.Right = "󰹵";
  #         bottom.right.Bold = "󰹶";
  #       };
  #
  #       Right = "󰁜";
  #       right = {
  #         Thick = "󰧆";
  #
  #         Thin = "󱦴";
  #         thin = {
  #           circle.Outline = "󱖔";
  #         };
  #
  #         bold = {
  #           Box = "󱥪";
  #           box.Outline = "󱥫";
  #
  #           Outline = "󰧅";
  #         };
  #
  #         bottom.Left = "󰹷";
  #         bottom.left.Bold = "󰹸";
  #       };
  #     };
  #
  #     u = {
  #       down = {
  #         Left = "󱞭";
  #         left.Bold = "󱞮";
  #
  #         Right = "󱞯";
  #         right.Bold = "󱞰";
  #       };
  #
  #       left = {
  #         Bottom = "󱞱";
  #         bottom.Bold = "󱞲";
  #
  #         Top = "󱞳";
  #         top.Bold = "󱞴";
  #       };
  #
  #       up = {
  #         Left = "󱞹";
  #         left.Bold = "󱞺";
  #
  #         Right = "󱞻";
  #         right.Bold = "󱞼";
  #       };
  #
  #       right = {
  #         Bottom = "󱞵";
  #         bottom.Bold = "󱞶";
  #
  #         Top = "󱞷";
  #         top.Bold = "󱞸";
  #       };
  #     };
  #
  #
  #     Down = "󰁅";
  #     down = {
  #       Bold = "󰜮";
  #       bold = {
  #         Box = "󰜯";
  #         box.Outline = "󰜰";
  #         Circle = "󰁇";
  #         circle.Outline = "󰁈";
  #         hexagon.Outline = "󰁉";
  #         Outline = "󰦿";
  #       };
  #
  #       Box = "󰛀";
  #       Circle = "󰳛";
  #       circle.Outline = "󰳜";
  #       drop.Circle = "󰁊";
  #       drop.circle.Outline = "󰁋";
  #       Left = "󱞡";
  #       left.Bold = "󱞢";
  #       Right = "󱞣";
  #       right.Bold = "󱞤";
  #       Thick = "󰁆";
  #       Thin = "󱦳";
  #       thin.circle.Outline = "󱖙";
  #     };
  #
  #     Left = "󰁍";
  #     left = {
  #       Bottom = "󱞥";
  #       bottom.Bold = "󱞦";
  #
  #       Bold = "󰜱";
  #       bold = {
  #         Box = "󰜲";
  #         box.Outline = "󰜳";
  #         Circle = "󰁏";
  #         circle.Outline = "󰁐";
  #         hexagon.Outline = "󰁑";
  #         Outline = "󰧀";
  #       };
  #
  #       Box = "󰛁";
  #       Right = "󰹳";
  #       right.Bold = "󰹴";
  #       right.bold.Outline = "󰧁";
  #       Top = "󱞧";
  #       top.Bold = "󱞨";
  #       Thick = "󰁎";
  #       Thin = "󱦱";
  #       thin.circle.Outline = "󱖚";
  #     };
  #
  #     Right = "󰁔";
  #     right = {
  #       Bottom = "";
  #       bottom.Bold = "";
  #
  #       Bold = "󰜴";
  #       bold = {
  #         Box = "󰜵";
  #         box.Outline = "󰜶";
  #         Circle = "󰁖";
  #         circle.Outline = "󰁗";
  #         hexagon.Outline = "󰁘";
  #         Outline = "󰧂";
  #       };
  #
  #       Box = "󰛂";
  #       Top = "󱞫";
  #       top.Bold = "󱞬";
  #       Thick = "󰁕";
  #       Thin = "󱦰";
  #       thin.circle.Outline = "󱖘";
  #     };
  #
  #     Up = "󰁝";
  #     up = {
  #       Bold = "󰜷";
  #       bold = {
  #         Box = "󰜸";
  #         box.Outline = "󰜹";
  #         Circle = "󰁟";
  #         circle.Outline = "󰁠";
  #         hexagon.Outline = "󰁡";
  #         Outline = "󰧇";
  #       };
  #
  #       Box = "󰛃";
  #       Circle = "󰳡";
  #       circle.Outline = "󰳢";
  #       drop.Circle = "󰁢";
  #       drop.circle.Outline = "󰁣";
  #       Left = "󱞽";
  #       left.Bold = "󱞾";
  #       Right = "󱞿";
  #       right.Bold = "󱟀";
  #       Thick = "󰁞";
  #       Thin = "󱦲";
  #       thin.circle.Outline = "󱖗";
  #     };
  #
  #     Collapse = "󰘕";
  #     collapse = {
  #       All = "󰁄";
  #       Down = "󰞒";
  #       Horizontal = "󰡌";
  #       Left = "󰞓";
  #       Right = "󰞔";
  #       Up = "󰞕";
  #       Vertical = "󰡍";
  #     };
  #
  #     Decision = "󰦻";
  #     decision = {
  #       Auto = "󰦼";
  #       auto.Outline = "󰦽";
  #       Outline = "󰦾";
  #     };
  #
  #     Expand = "󰘖";
  #     expand = {
  #       All = "󰁌";
  #       Down = "󰞖";
  #       Horizontal = "󰡎";
  #       Left = "󰞗";
  #       Right = "󰞘";
  #       Up = "󰞙";
  #       Vertical = "󰡏";
  #     };
  #
  #     horizontal.Lock = "󱅛";
  #
  #     split.Horizontal = "󰤻";
  #     split.Vertical = "󰤼";
  #   };
  #
  #   Axis = "󰵈";
  #   axis = {
  #     Arrow = "󰵉";
  #     arrow.Info = "󱐎";
  #     arrow.Lock = "󰵊";
  #
  #     Lock = "󰵋";
  #
  #     x.Arrow = "󰵌";
  #     x.arrow.Lock = "󰵍";
  #     x.rotate.Clockwise = "󰵎";
  #     x.rotate.Counterclockwise = "󰵏";
  #     x.y.arrow.Lock = "󰵐";
  #
  #     y.Arrow = "󰵑";
  #     y.arrow.Lock = "󰵒";
  #     y.rotate.Clockwise = "󰵓";
  #     y.rotate.Counterclockwise = "󰵔";
  #
  #     z.Arrow = "󰵕";
  #     z.arrow.Lock = "󰵖";
  #     z.rotate.Clockwise = "󰵗";
  #     z.rotate.Counterclockwise = "󰵘";
  #   };
  #
  #   Book = "󰂺";
  #   book.Outline = "󰭤";
  #   book = {
  #     Account = "󱎭";
  #     account.Outline = "󱎮";
  #
  #     Alert = "󱙼";
  #     alert.Outline = "󱙽";
  #
  #     Alphabet = "󰘝";
  #
  #     Cancel = "󱚆";
  #     cancel.Outline = "󱚇";
  #
  #     Check = "󱓳";
  #     check.Outline = "󱓴";
  #
  #     Clock = "󱚈";
  #     clock.Outline = "󱚉";
  #
  #     Cog = "󱚊";
  #     cog.Outline = "󱚋";
  #
  #     Edit = "󱚌";
  #     edit.Outline = "󱚍";
  #
  #     Education = "󱛉";
  #     education.Outline = "󱛊";
  #
  #     Heart = "󱨝";
  #     heart.Outline = "󱨞";
  #
  #     Lock = "󰞚";
  #     lock.Open = "󰞛";
  #     lock.open.Outline = "󱚎";
  #     lock.Outline = "󱚏";
  #
  #     Marker = "󱚐";
  #     marker.Outline = "󱚑";
  #
  #     Minus = "󰗙";
  #     minus.Multiple = "󰪔";
  #     minus.multiple.Outline = "󰤋";
  #     minus.Outline = "󱚒";
  #
  #     Multiple = "󰂻";
  #     multiple.Outline = "󰐶";
  #
  #     Off = "󱚔";
  #     off.Outline = "󱚕";
  #
  #     Open = "󰂽";
  #     open.Outline = "󰭣";
  #     open.Variant = "󱓷";
  #     open.page.Variant = "󰗚";
  #     open.page.variant.Outline = "󱗖";
  #
  #     Plus = "󰗛";
  #     plus.Multiple = "󰪕";
  #     plus.multiple.Outline = "󰫞";
  #     plus.Outline = "󱚖";
  #
  #     arrow = {
  #       Down = "󱙾";
  #       down.Outline = "󱙿";
  #       Left = "󱚀";
  #       left.Outline = "󱚁";
  #       Up = "󱚄";
  #       up.Outline = "󱚅";
  #       Right = "󱚂";
  #       right.Outline = "󱚃";
  #     };
  #
  #     Refresh = "󱚗";
  #     refresh.Outline = "󱚘";
  #
  #     Remove = "󰪗";
  #     remove.Multiple = "󰪖";
  #     remove.multiple.Outline = "󰓊";
  #     remove.Outline = "󱚙";
  #
  #     Search = "󰺄";
  #     search.Outline = "󰺅";
  #
  #     Settings = "󱚚";
  #     settings.Outline = "󱚛";
  #
  #     Sync = "󱚜";
  #     sync.Outline = "󱛈";
  #
  #     Variant = "󰂿";
  #     variant.Multiple = "󰂼";
  #   };
  #
  #   Bookmark = "󰃀";
  #   bookmark.Outline = "󰃃";
  #   bookmark = {
  #     Check = "󰃁";
  #     check.Outline = "󱍻";
  #     Minus = "󰧌";
  #     minus.Outline = "󰧍";
  #     Multiple = "󰸕";
  #     multiple.Outline = "󰸖";
  #     Off = "󰧎";
  #     off.Outline = "󰧏";
  #     Plus = "󰃅";
  #     plus.Outline = "󰃄";
  #     Remove = "󰃆";
  #     remove.Outline = "󱍺";
  #   };
  #
  #   Check = "󰄬";
  #   check.Outline = "";
  #   check = {
  #     All = "󰄭";
  #     Bold = "󰸞";
  #     Circle = "󰗠";
  #     circle.Outline = "󰗡";
  #     Decagram = "󰞑";
  #     decagram.Outline = "󱝀";
  #     Network = "󰱓";
  #     network.Outline = "󰱔";
  #     Underline = "󰸟";
  #     underline.Circle = "󰸠";
  #     underline.circle.Outline = "󰸡";
  #   };
  #
  #   Close = "󰅖";
  #   close = {
  #     Box = "󰅗";
  #     box.Multiple = "󰱝";
  #     box.multiple.Outline = "󰱞";
  #     box.Outline = "󰅘";
  #
  #     Circle = "󰅙";
  #     circle.Multiple = "󰘪";
  #     circle.multiple.Outline = "󰢃";
  #     circle.Outline = "󰅚";
  #
  #     Network = "󰅛";
  #     network.Outline = "󰱟";
  #
  #     Octagon = "󰅜";
  #     octagon.Outline = "󰅝";
  #
  #     Outline = "󰛉";
  #     Thick = "";
  #   };
  #
  #   Bug = "󰃤";
  #   bug = {
  #     Check = "󰨮";
  #     check.Outline = "󰨯";
  #
  #     Outline = "󰨰";
  #   };
  #
  #   Folder = "󰉋";
  #   folder = {
  #     Account = "󰉌";
  #     account.Outline = "󰮜";
  #
  #     Alert = "󰷌";
  #     alert.Outline = "󰷍";
  #
  #     arrow = {
  #       Down = "󱧰";
  #       down.Outline = "󱧩";
  #
  #       Left = "󱧪";
  #       left.Outline = "󱧫";
  #       left.Right = "󱧬";
  #       left.right.Outline = "󱧭";
  #
  #       Up = "󱧰";
  #       up.Down = "󱧱";
  #       up.down.Outline = "󱧲";
  #       up.Outline = "󱧳";
  #
  #       Right = "󱧮";
  #       right.Outline = "󱧯";
  #     };
  #
  #     Cancel = "󱧴";
  #     cancel.Outline = "󱧵";
  #
  #     Check = "󱥾";
  #     check.Outline = "󱥿";
  #
  #     Clock = "󰪺";
  #     clock.Outline = "󰪻";
  #
  #     Cog = "󱁿";
  #     cog.Outline = "󱂀";
  #
  #     Download = "󰉍";
  #     download.Outline = "󱃩";
  #
  #     Edit = "󰣞";
  #     edit.Outline = "󰷎";
  #
  #     Eye = "󱞊";
  #     eye.Outline = "󱞋";
  #
  #     File = "󱧶";
  #     file.Outline = "󱧷";
  #
  #     Heart = "󱃪";
  #     heart.Outline = "󱃫";
  #
  #     Hidden = "󱞞";
  #
  #     Home = "󱂵";
  #     home.Outline = "󱂶";
  #
  #     Image = "󰉏";
  #
  #     Information = "󱂷";
  #     information.Outline = "󱂸";
  #
  #     Key = "󰢬";
  #     key.Network = "󰢭";
  #     key.network.Outline = "󰲀";
  #     key.Outline = "󱃬";
  #
  #     Lock = "󰉐";
  #     lock.Open = "󰉑";
  #     lock.open.Outline = "󱪧";
  #     lock.Outline = "󱪨";
  #
  #     Marker = "󱉭";
  #     marker.Outline = "󱉮";
  #
  #     Move = "󰉒";
  #     move.Outline = "󱉆";
  #
  #     Multiple = "󰉓";
  #     multiple.Image = "󰉔";
  #     multiple.Outline = "󰉕";
  #     multiple.Plus = "󱑾";
  #     multiple.plus.Outline = "󱑿";
  #
  #     Music = "󱍙";
  #     music.Outline = "󱍚";
  #
  #     Network = "󰡰";
  #     network.Outline = "󰲁";
  #
  #     Off = "󱧸";
  #     off.Outline = "󱧹";
  #
  #     Open = "󰝰";
  #     open.Outline = "󰷏";
  #
  #     Outline = "󰉖";
  #
  #     Play = "󱧺";
  #     play.Outline = "󱧻";
  #
  #     Plus = "󰉗";
  #     plus.Outline = "󰮝";
  #
  #     Pound = "󰴉";
  #     pound.Outline = "󰴊";
  #
  #     Question = "󱧊";
  #     question.Outline = "󱧋";
  #
  #     Refresh = "󰝉";
  #     refresh.Outline = "󰕂";
  #
  #     Remove = "󰉘";
  #     remove.Outline = "󰮞";
  #
  #     Search = "󰥨";
  #     search.Outline = "󰥩";
  #
  #     Settings = "󱁽";
  #     settings.Outline = "󱁾";
  #
  #     Star = "󰚝";
  #     star.Multiple = "󱏓";
  #     star.multiple.Outline = "󱏔";
  #     star.Outline = "󰮟";
  #
  #     Swap = "󰾶";
  #     swap.Outline = "󰾷";
  #
  #     Sync = "󰴋";
  #     sync.Outline = "󰴌";
  #
  #     Table = "󱋣";
  #     table.Outline = "󱋤";
  #
  #     Text = "󰲂";
  #     text.Outline = "󰲃";
  #
  #     Upload = "󰉙";
  #     upload.Outline = "󱃭";
  #
  #     Wrench = "󱧼";
  #     wrench.Outline = "󱧽";
  #
  #     Zip = "󰛫";
  #     zip.Outline = "󰞹";
  #   };
  #
  #   File = "󰈔";
  #   file.Outline = "󰈤";
  #   file = {
  #     Account = "󰜻";
  #     account.Outline = "󱀨";
  #     Alert = "󰩋";
  #     alert.Outline = "󰩌";
  #     Cabinet = "󰪶";
  #     Cancel = "󰷆";
  #     cancel.Outline = "󰷇";
  #     Certificate = "󱆆";
  #     certificate.Outline = "󱆇";
  #     Chart = "󰈕";
  #     chart.Check = "󱧆";
  #     chart.check.Outline = "󱧇";
  #     chart.Outline = "󱀩";
  #     Check = "󰈖";
  #     check.Outline = "󰸩";
  #     Clock = "󱋡";
  #     clock.Outline = "󱋢";
  #     Code = "󰈮";
  #     code.Outline = "󱀫";
  #     Cog = "󱁻";
  #     cog.Outline = "󱁼";
  #     Compare = "󰢪";
  #
  #     Document = "󰈙";
  #     document.Outline = "󰧮";
  #
  #     document = {
  #       Alert = "󱪗";
  #       alert.Outline = "󱪘";
  #       Check = "󱪙";
  #       check.Outline = "󱪚";
  #       Edit = "󰷈";
  #       edit.Outline = "󰷉";
  #       Minus = "󱪛";
  #       minus.Outline = "󱪜";
  #       Multiple = "󱔗";
  #       multiple.Outline = "󱔘";
  #       Plus = "󱪝";
  #       plus.Outline = "󱪞";
  #       Remove = "󱪟";
  #       remove.Outline = "󱪠";
  #     };
  #
  #     Download = "󰥥";
  #     download.Outline = "󰥦";
  #
  #     Edit = "󱇧";
  #     edit.Outline = "󱇨";
  #
  #     Export = "󰈝";
  #     export.Outline = "󱀮";
  #
  #     Eye = "󰷊";
  #     eye.Outline = "󰷋";
  #
  #     Find = "󰈞";
  #     find.Outline = "󰮗";
  #
  #     Hidden = "󰘓";
  #
  #     Image = "󰈟";
  #     image.Outline = "󰺰";
  #     image = {
  #       Marker = "󱝲";
  #       marker.Outline = "󱝳";
  #       Minus = "󱤻";
  #       minus.Outline = "󱤼";
  #       Plus = "󱤽";
  #       plus.Outline = "󱤾";
  #       Remove = "󱤿";
  #       remove.Outline = "󱥀";
  #     };
  #
  #     Import = "󰈠";
  #     import.Outline = "󱀯";
  #
  #     Key = "󱆄";
  #     key.Outline = "󱆅";
  #
  #     Link = "󱅷";
  #     link.Outline = "󱅸";
  #
  #     Lock = "󰈡";
  #     lock.Open = "󱧈";
  #     lock.open.Outline = "󱧉";
  #     lock.Outline = "󱀰";
  #
  #     Marker = "󱝴";
  #     marker.Outline = "󱝵";
  #
  #     Minus = "󱪡";
  #     minus.Outline = "󱪢";
  #
  #     Move = "󰪹";
  #     move.Outline = "󱀱";
  #
  #     Multiple = "󰈢";
  #     multiple.Outline = "󱀲";
  #
  #     Tree = "󰙅";
  #     tree.Outline = "󱏒";
  #
  #     Undo = "󰣜";
  #     undo.Outline = "󱀼";
  #
  #     Upload = "󰩍";
  #     upload.Outline = "󰩎";
  #   };
  #
  #   Filter = "󰈲";
  #   filter.Outline = "󰈳";
  #   filter = {
  #     Check = "󱣬";
  #     check.Outline = "󱣭";
  #
  #     Cog = "󱪣";
  #     cog.Outline = "󱪤";
  #
  #     Menu = "󱃥";
  #     menu.Outline = "󱃦";
  #
  #     Minus = "󰻮";
  #     minus.Outline = "󰻯";
  #
  #     Multiple = "󱨿";
  #     multiple.Outline = "󱩀";
  #
  #     Off = "󱓯";
  #     off.Outline = "󱓰";
  #
  #     Plus = "󰻰";
  #     plus.Outline = "󰻱";
  #
  #     Remove = "󰈴";
  #     remove.Outline = "󰈵";
  #
  #     Settings = "󱪥";
  #     settings.Outline = "󱪦";
  #
  #     Variant = "󰈶";
  #     variant.Minus = "󱄒";
  #     variant.Plus = "󱄓";
  #     variant.Remove = "󱀿";
  #   };
  #
  #   Fire = "󰈸";
  #   fire = {
  #     Alert = "󱗗";
  #     Circle = "󱠇";
  #     Extinguisher = "󰻲";
  #     Off = "󱜢";
  #     Truck = "󰢫";
  #
  #     Hydrant = "󱄷";
  #     hydrant = {
  #       Alert = "";
  #       Off = "";
  #     };
  #   };
  #
  #   Flash = "󰉁";
  #   flash = {
  #     Alert = "󰻷";
  #     Auto = "󰉂";
  #     Off = "󰉃";
  #
  #     Outline = "󰛕";
  #     outline.Alert = "󰻸";
  #   };
  #
  #   Inbox = "";
  #   inbox.Outline = "";
  #   inbox = {
  #     Full = "󱉲";
  #     full.Outline = "󱉳";
  #     Multiple = "󰢰";
  #     multiple.Outline = "󰮨";
  #     Remove = "󱖟";
  #     remove.Outline = "󱖠";
  #
  #     arrow = {
  #       Down = "󰋻";
  #       down.Outline = "󱉰";
  #       Up = "󰏑";
  #       up.Outline = "󱉱";
  #     };
  #   };
  #
  #   Keyboard = "󰌌";
  #   keyboard.Outline = "󰥻";
  #   keyboard = {
  #     Backspace = "󰌍";
  #     Caps = "󰌎";
  #     Close = "󰌏";
  #     Esc = "󱊷";
  #     Off = "󰌐";
  #     off.Outline = "";
  #     Return = "󰌑";
  #     Settings = "󰧹";
  #     settings.Outline = "󰧺";
  #     Space = "󱁐";
  #     Variant = "󰌓";
  #
  #     Tab = "󰌒";
  #     tab.Reverse = "󰌥";
  #
  #     # TODO: maybe add fn keys if needed?
  #     # fn = {
  #     #   "1" = "";
  #     #   "2" = "";
  #     #   "3" = "";
  #     #   "4" = "";
  #     #   ...
  #     # };
  #   };
  #
  #   Label = "󰌕";
  #   label.Outline = "󰌖";
  #   label = {
  #     Multiple = "󱍵";
  #     multiple.Outline = "󱍶";
  #     Off = "󰫋";
  #     off.Outline = "󰫌";
  #     Percent = "󱋪";
  #     percent.Outline = "󱋫";
  #     Variant = "󰫍";
  #     variant.Outline = "󰫎";
  #   };
  #
  #   lan = {
  #     Check = "󱊪";
  #     Connect = "󰌘";
  #     Disconnect = "󰌙";
  #     Pending = "󰌚";
  #   };
  #
  #   # TODO: layers = {};
  #
  #   led = {
  #     Off = "󰌫";
  #     On = "󰌬";
  #     Strip = "󰟖";
  #     Outline = "󰌭";
  #
  #     variant = {
  #       On = "󰌯";
  #       Off = "󰌮";
  #       Outline = "󰌰";
  #
  #       Strip = "󱁑";
  #       strip.Off = "󱩋";
  #     };
  #   };
  #
  #   light_switch = {
  #     On = "󰥾";
  #     Off = "󱨤";
  #   };
  #
  #   Lightbulb = "󰌵";
  #   lightbulb.Outline = "󰌶";
  #   lightbulb = {
  #     Alert = "󱧡";
  #     alert.Outline = "󱧢";
  #     Auto = "󱠀";
  #     auto.Outline = "󱠁";
  #     Night = "󱩌";
  #     night.Outline = "󱩍";
  #
  #     Group = "󱉓";
  #     group.Outline = "󱉔";
  #     group.Off = "󱋍";
  #     group.off.Outline = "󱋎";
  #
  #     Off = "󰹏";
  #     off.Outline = "󰹐";
  #
  #     Multiple = "󱉕";
  #     multiple.Off = "󱋏";
  #     multiple.off.Outline = "󱋐";
  #     multiple.Outline = "󱉖";
  #
  #     Question = "󱧣";
  #     Variant = "󱠂";
  #     variant.Outline = "󱠃";
  #
  #     On = "󰛨";
  #     outline.On = "󰛩";
  #     # on = {
  #     #   # TODO: icons.lightbulb.on percentiles
  #     #   "10" = "";
  #     #   "20" = "";
  #     #   "30" = "";
  #     #   "40" = "";
  #     # };
  #
  #     Cfl = "󱈈";
  #     cfl = {
  #       Off = "󱈉";
  #       Spiral = "󱉵";
  #       spiral.Off = "󱋃";
  #     };
  #
  #     Spot = "󱟴";
  #     spot.Off = "󱟵";
  #   };
  #
  #   # TODO: icons.link
  #   Link = "󰌷";
  #   link = {
  #     Box = "󰴚";
  #     box.Outline = "󰴛";
  #     box.Variant = "󰴜";
  #     box.variant.Outline = "󰴝";
  #
  #     Lock = "󱂺";
  #     Off = "󰌸";
  #     Plus = "󰲔";
  #
  #     Variant = "󰌹";
  #     variant = {
  #       Minus = "󱃿";
  #       Off = "󰌺";
  #       Plus = "󱄀";
  #       Remove = "󱄁";
  #     };
  #   };
  #
  #   list.Status = "󱖫";
  #
  #   Clipboard = "";
  #   clipboard.Outline = "";
  #   clipboard = {
  #     List = "";
  #     list.Outline = "";
  #   };
  #
  #   format = {
  #     list.Bulleted = "󰉹";
  #     list.bulleted.Square = "󰷐";
  #     list.bulleted.Triangle = "󰺲";
  #     list.bulleted.Type = "󰉺";
  #
  #     list.Checkbox = "󰥪";
  #     list.Checks = "󰝖";
  #     list.Group = "󱡠";
  #     list.Numbered = "󰉻";
  #     list.numbered.Rtl = "󰴍";
  #     list.Text = "󱉯";
  #   };
  #
  #   view = {
  #     Agenda = "";
  #     agenda.Outline = "";
  #     Array = "";
  #     array.Outline = "";
  #     Carousel = "";
  #     carousel.Outline = "";
  #     Column = "";
  #     column.Outline = "";
  #     Comfy = "";
  #     comfy.Outline = "";
  #     Compact = "";
  #     compact.Outline = "";
  #     Dashboard = "";
  #     dashboard.Edit = "";
  #     dashboard.Outline = "";
  #     dashboard.Variant = "";
  #     dashboard.variant.Outline = "";
  #     Day = "";
  #     day.Outline = "";
  #     Gallery = "";
  #     gallery.Outline = "";
  #     Grid = "";
  #     grid.Outline = "";
  #     grid.Plus = "";
  #     grid.plus.Outline = "";
  #     Headline = "";
  #     headline.Outline = "";
  #     Module = "";
  #     module.Outline = "";
  #     Parallel = "";
  #     parellel.Outline = "";
  #     Quilt = "";
  #     quilt.Outline = "";
  #     Sequential = "";
  #     sequential.Outline = "";
  #     split.Horizontal = "";
  #     split.Vertical = "";
  #     Stream = "";
  #     stream.Outline = "";
  #     Week = "";
  #     week.Outline = "";
  #     List = "󰕲";
  #     list.Outline = "󱒋";
  #   };
  #
  #   # TODO: icons.location
  #   location = {
  #     Enter = "󰿄";
  #     Exit = "󰿅";
  #   };
  #
  #   # TODO: icons.lock
  #   lock = {
  #     Alert = "";
  #     Check = "";
  #     Clock = "";
  #     Minus = "";
  #     Off = "";
  #     Open = "";
  #     Pattern = "";
  #     Plus = "";
  #     Question = "";
  #     Remove = "";
  #     Reset = "";
  #     Smart = "";
  #
  #     outline = {};
  #   };
  #
  #   Logout = "󰍃";
  #   logout.Variant = "󰗽";
  #
  #   # TODO: icons.magnify
  #   Magnify = "󰍉";
  #   magnify = {
  #     Expand = "󱡴";
  #
  #     Minus = "󰍊";
  #     minus.Cursor = "󰩢";
  #     minus.Outline = "󰛬";
  #
  #     Plus = "󰍋";
  #     plus.Cursor = "󰩣";
  #     plus.Outline = "󰛭";
  #
  #     remove.Cursor = "󱈌";
  #     remove.Outline = "󱈍";
  #
  #     Scan = "󱉶";
  #   };
  #
  #   Mailbox = "󰛮";
  #   mailbox.Outline = "󰶌";
  #   mailbox = {
  #     Open = "󰶈";
  #     open.Outline = "󰶉";
  #     open = {
  #       Up = "󰶊";
  #       up.Outline = "󰶋";
  #     };
  #
  #     Up = "󰶍";
  #     up.Outline = "󰶎";
  #   };
  #
  #   Map = "󰍍";
  #   map.Outline = "󰦂";
  #   map = {
  #     Check = "󰺼";
  #     check.Outline = "󰺽";
  #
  #     Clock = "󰴞";
  #     clock.Outline = "󰴟";
  #
  #     Legend = "󰨁";
  #     Minus = "󰦁";
  #     Plus = "󰦃";
  #
  #     Search = "󰦄";
  #     search.Outline = "󰦅";
  #
  #     Marker = "󰍎";
  #     marker.Outline = "󰟙";
  #     marker = {
  #       Account = "󱣣";
  #       account.Outline = "󱣤";
  #
  #       Alert = "󰼅";
  #       alert.Outline = "󰼆";
  #
  #       Check = "󰲕";
  #       check.Outline = "󱋻";
  #
  #       Down = "󱄂";
  #
  #       Left = "󱋛";
  #       left.Outline = "󱋝";
  #
  #       Minus = "󰙐";
  #       minus.Outline = "󱋹";
  #
  #       Multiple = "󰍐";
  #       multiple.Outline = "󱉷";
  #
  #       Off = "󰍑";
  #       off.Outline = "󱋽";
  #
  #       Plus = "󰙑";
  #       plus.Outline = "󱋸";
  #
  #       Question = "󰼇";
  #       question.Outline = "󰼈";
  #
  #       Up = "󱄃";
  #
  #       Radius = "󰍒";
  #       radius.Outline = "󱋼";
  #
  #       Remove = "󰼉";
  #       remove.Outline = "󱋺";
  #       remove.Variant = "󰼊";
  #
  #       Right = "󱋜";
  #       right.Outline = "󱋞";
  #
  #       Star = "󱘈";
  #       star.Outline = "󱘉";
  #     };
  #   };
  #
  #   Menu = "󰍜";
  #   menu = {
  #     Down = "󰍝";
  #     down.Outline = "󰚶";
  #     Left = "󰍞";
  #     left.Outline = "󰨂";
  #     Open = "󰮫";
  #     Right = "󰍟";
  #     right.Outline = "󰨃";
  #     Swap = "󰩤";
  #     swap.Outline = "󰩥";
  #     Up = "󰍠";
  #     up.Outline = "󰚷";
  #   };
  #
  #   # TODO: icons.Message
  #   Message = "";
  #   message = {
  #     Alert = "";
  #     alert.Outline = "";
  #
  #     Badge = "";
  #     badge.Outline = "";
  #
  #     Bookmark = "";
  #     bookmark.Outline = "";
  #     Bulleted = "";
  #     Cog = "";
  #     Draw = "";
  #     Fast = "";
  #     Flash = "";
  #     Image = "";
  #     Lock = "";
  #     Minus = "";
  #     Off = "";
  #     Plus = "";
  #     Processing = "";
  #     Question = "";
  #     Reply = "";
  #     Settings = "";
  #     Star = "";
  #     Text = "";
  #     Video = "";
  #
  #     outline = {};
  #   };
  #
  #   # TODO: icons.Minus
  #   minus = {
  #     Box = "";
  #     Cirle = "";
  #     Network = "";
  #     Thick = "";
  #   };
  #
  #   # TODO: icons.Monitor
  #   monitor = {
  #     Account = "";
  #     Cellphone = "";
  #     Dashboard = "";
  #     Edit = "";
  #     Eye = "";
  #     Lock = "";
  #     Multiple = "";
  #     Off = "";
  #     Screenshot = "";
  #     Share = "";
  #     Shimmer = "";
  #     Small = "";
  #     Speaker = "";
  #     Star = "";
  #   };
  #
  #   # TODO: icons.Network
  #   Network = "";
  #   network.Outline = "";
  #   network = {
  #     Off = "";
  #     off.Outline = "";
  #
  #     Pos = "";
  #     pos.Outline = "";
  #   };
  #
  #   Note = "";
  #   note.Outline = "";
  #   note = {
  #     Alert = "";
  #     alert.Outline = "";
  #
  #     Check = "";
  #     check.Outline = "";
  #
  #     Edit = "";
  #     edit.Outline = "";
  #
  #     Minus = "";
  #     minus.Outline = "";
  #
  #     Multiple = "";
  #     multiple.Outline = "";
  #
  #     Off = "";
  #     off.Outline = "";
  #
  #     Plus = "";
  #     plus.Outline = "";
  #
  #     Remote = "";
  #     remove.Outline = "";
  #
  #     Search = "";
  #     search.Outline = "";
  #
  #     Text = "";
  #     text.Outline = "";
  #   };
  #
  #   Notbook = "";
  #   notebook.Outline = "";
  #   notebook = {
  #     Check = "";
  #     check.Outline = "";
  #
  #     Edit = "";
  #     edit.Outline = "";
  #
  #     Heart = "";
  #     heart.Outline = "";
  #
  #     Minus = "";
  #     minus.Outline = "";
  #
  #     Multiple = "";
  #     multiple.Outline = "";
  #
  #     Plus = "";
  #     plus.Outline = "";
  #
  #     Remove = "";
  #     remove.Outline = "";
  #   };
  #
  #   Numeric = "";
  #   numeric = {
  #     One = "";
  #     one = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Two = "";
  #     two = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Three = "";
  #     three = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Four = "";
  #     four = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Five = "";
  #     five = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Six = "";
  #     six = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Seven = "";
  #     seven = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Eight = "";
  #     eight = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Nine = "";
  #     nine = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Ten = "";
  #     ten = {
  #       Box = "";
  #       Circle = "";
  #       Plus = "";
  #     };
  #
  #     Off = "";
  #   };
  #
  #   Package = "󰏓";
  #   package = {
  #     Down = "󰏔";
  #     Up = "󰏕";
  #
  #     Variant = "󰏖";
  #     variant = {
  #       Closed = "󰏗";
  #       closed = {
  #         Minus = "󱧔";
  #         Plus = "󱧕";
  #         Remove = "󱧖";
  #       };
  #
  #       Minus = "󱧗";
  #       Plus = "󱧘";
  #       Remove = "󱧙";
  #     };
  #   };
  #
  #   page = {
  #     First = "󰘀";
  #     Last = "󰘁";
  #
  #     Fit = "󰻵";
  #     fit.Outline = "󰻶";
  #
  #     Next = "󰮰";
  #     next.Outline = "󰮱";
  #     Previous = "󰮲";
  #     previous.Outline = "󰮲";
  #
  #     layout = {
  #       Body = "󰛺";
  #       Footer = "󰛻";
  #
  #       Header = "󰛼";
  #       header.Footer = "󰽿";
  #
  #       sidebar.Left = "󰛽";
  #       sidebar.Right = "󰛾";
  #     };
  #   };
  #
  #   Pail = "󱐗";
  #   pail.Outline = "󱐺";
  #   pail = {
  #     Minus = "󱐷";
  #     minus.Outline = "󱐼";
  #
  #     Off = "󱐹";
  #     off.Outline = "󱐾";
  #
  #     Plus = "󱐶";
  #     plus.Outline = "󱐻";
  #
  #     Remove = "󱐸";
  #     remove.Outline = "󱐽";
  #   };
  #
  #   Palette = "󰏘";
  #   palette.Outline = "󰸌";
  #   palette = {
  #     Advanced = "󰏙";
  #
  #     Swatch = "󰢵";
  #     swatch = {
  #       Outline = "󱍜";
  #       Variant = "󱥚";
  #     };
  #   };
  #
  #   pan = {
  #     Down = "";
  #     Horizontal = "";
  #     Left = "";
  #     Right = "";
  #     Up = "";
  #   };
  #
  #
  #   PaperClip = "󰏢";
  #
  #   paper_clip = {
  #     Check = "󱫆";
  #     Lock = "󱧚";
  #     Minus = "󱫇";
  #     Off = "󱫈";
  #     Plus = "󱫉";
  #     Remove = "󱫊";
  #   };
  #
  #   paper_roll = {
  #     Default = "󱅗";
  #     Outline = "󱅘";
  #   };
  #
  #
  #   key = {
  #     Alert = "󱦃";
  #     Chain = "󱕴";
  #     Change = "󰌇";
  #     Link = "󱆟";
  #     Minus = "󰌈";
  #     Outline = "󰷖";
  #     Plus = "󰌉";
  #     Remove = "󰷖";
  #     Star = "󱆞";
  #     Variant = "󰌋";
  #     Wireless = "󰿂";
  #   };
  #
  #   toggle = {
  #     On = "";
  #     Off = "";
  #   };
  #
  #   Pencil = "󰏫";
  #   pencil = {
  #     Box = "󰏬";
  #     box.Multiple = "󱅄";
  #     Circle = "󰛿";
  #     Lock = "󰏮";
  #     Minus = "󰷨";
  #     Off = "󰏯";
  #     Plus = "󰷫";
  #     Remove = "󰷭";
  #     Ruler = "󱍓";
  #
  #     Outline = "󰲶";
  #     outline = {
  #       Box = "󰏭";
  #       box.Multiple = "󱅅";
  #       Circle = "󰝶";
  #       Lock = "󰷧";
  #       Minus = "󰷩";
  #       Off = "󰷪";
  #       Plus = "󰷬";
  #       Remove = "󰷮";
  #     };
  #   };
  #
  #   kind = {
  #     Array = "";
  #     Boolean = "";
  #     Class = "";
  #     Color = "";
  #     Constant = "";
  #     Constructor = "";
  #     Enum = "";
  #     EnumMember = "";
  #     Event = "";
  #     Field = "";
  #     File = "";
  #     Folder = "";
  #     Function = "";
  #     Interface = "";
  #     Key = "";
  #     Keyword = "";
  #     Method = "";
  #     Module = "";
  #     Namespace = "";
  #     Null = "ﳠ";
  #     Number = "";
  #     Object = "";
  #     Operator = "";
  #     Package = "";
  #     Property = "";
  #     Reference = "";
  #     Snippet = "";
  #     String = "";
  #     Struct = "";
  #     Text = "";
  #     TypeParameter = "";
  #     Unit = "";
  #     Value = "";
  #     Variable = "";
  #     Copilot = "";
  #     TabNine = "⌬";
  #   };
  #   git = {
  #     line = {
  #       Added = "";
  #       Modified = "";
  #      Removed = "";
  #     };
  #     file = {
  #       Deleted = "";
  #       Ignored = "󰫙";
  #      Renamed = "";
  #       Staged = "✓";
  #       Unmerged = "";
  #       Merged = "";
  #       Unstaged = "";
  #       Untracked = "◌";
  #       Changed = "󰉺";
  #     };
  #     Copied = "󰆏";
  #     Ignored = "";
  #     Diff = "";
  #     Repo = "";
  #     Octoface = "";
  #     Branch = "";
  #   };
  #   ui = {
  #
  #     BoldDividerLeft = "";
  #     BoldDividerRight = "";
  #     BoldLineLeft = "▎";
  #     BookMark = "";
  #     BoxChecked = "";
  #     Stacks = "";
  #     Scopes = "";
  #     Watches = "";
  #     DebugConsole = "";
  #     Calendar = "";
  #     Check = "";
  #     ChevronRight = ">";
  #     ChevronShortDown = "";
  #     ChevronShortLeft = "";
  #     ChevronShortRight = "";
  #     ChevronShortUp = "";
  #     Circle = "";
  #     CloudDownload = "";
  #     Code = "";
  #     Comment = "";
  #     Dashboard = "";
  #     DividerLeft = "";
  #     DividerRight = "";
  #     DoubleChevronRight = "»";
  #     Ellipsis = "";
  #     EmptyFolder = "";
  #     EmptyFolderOpen = "";
  #     ExitCircle = "󰿅";
  #     File = "";
  #     FileSymlink = "";
  #     Files = "";
  #     FileRename = "";
  #     FindFile = "󰈞";
  #     FindText = "";
  #     Fire = "";
  #     Folder = "";
  #     FolderOpen = "";
  #     FolderSymlink = "";
  #     Forward = "";
  #     Gear = "";
  #     History = "";
  #     LineLeft = "▏";
  #     LineMiddle = "│";
  #     List = "";
  #     Lock = "";
  #     NewFile = "";
  #     Note = "";
  #     Package = "";
  #
  #     pin = {
  #       On = "󰤱";
  #       Off = "󰤰";
  #     };
  #
  #     Plus = "";
  #     Project = "";
  #     Save = "";
  #     Search = "";
  #     SignIn = "";
  #     SignOut = "";
  #     Sort = "󰒺";
  #     Tab = "";
  #     Table = "";
  #     Target = "󰀘";
  #     Telescope = "";
  #     Text = "";
  #
  #
  #     Tree = "";
  #     Triangle = "󰐊";
  #     TriangleShortArrowDown = "";
  #     TriangleShortArrowLeft = "";
  #     TriangleShortArrowRight = "";
  #     TriangleShortArrowUp = "";
  #   };
  #   diagnostics = {
  #     BoldError = "";
  #     Error = "";
  #     BoldWarning = "";
  #     Warning = "";
  #     BoldInformation = "";
  #     Information = "";
  #     BoldQuestion = "";
  #     Question = "";
  #     BoldHint = "";
  #     Hint = "󰌶";
  #     Debug = "";
  #     Trace = "✎";
  #   };
  #   misc = {
  #     Robot = "ﮧ";
  #     Squirrel = "";
  #     Tag = "";
  #     Watch = "";
  #     Smiley = "";
  #     Package = "";
  #     CircuitBoard = "";
  #     LualineFmt = "";
  #   };
  #   nvtree_chad = {
  #     default = "󰈚";
  #     symlink = "";
  #     folder = {
  #       default = "";
  #       empty = "";
  #       empty_open = "";
  #       open = "";
  #       symlink = "";
  #       symlink_open = "";
  #       arrow_open = "";
  #       arrow_closed = "";
  #     };
  #   };
  # };
}
