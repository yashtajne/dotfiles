import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import qualified XMonad.StackSet as W
import qualified Data.Map as M

toggleFullscreen :: X ()
toggleFullscreen =
  withWindowSet $ \ws ->
    withFocused $ \w -> do
      let fullRect = W.RationalRect 0 0 1 1
      let isFullFloat = M.lookup w (W.floating ws) == Just fullRect
      if isFullFloat
        then windows (W.sink w)
        else windows (W.float w fullRect)

myKeys =
	[ ("M-<Return>", spawn "gnome-terminal")
	, ("M-p", spawn "rofi -show drun")
	, ("M-<Backspace>", kill)
	, ("M-f", toggleFullscreen)
	, ("M-=", sendMessage Expand)
	, ("M--", sendMessage Shrink)
	]

main = xmonad $ def
  { modMask = mod4Mask
  , terminal = "gnome-terminal"
  }
  `additionalKeysP` myKeys
