
Config
  { font = "xft:JetBrainsMono Nerd Font:size=10"
  , additionalFonts = []
  , bgColor = "#1e1e2e"
  , fgColor = "#cdd6f4"
  , position = Top
  , lowerOnStart = True
  , hideOnStart = False
  , allDesktops = True
  , persistent = True

  , commands =
      [ Run Cpu ["-t", "CPU: <total>%"] 10
      , Run Memory ["-t", "MEM: <usedratio>%"] 10
      , Run Date "%a %b %d %H:%M" "date" 10
      , Run XMonadLog
      ]

  , sepChar = "%"
  , alignSep = "}{"

  , template = "%XMonadLog% }{ %cpu% | %memory% | %date%"
  }
