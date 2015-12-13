import XMonad
import XMonad.Actions.Volume
import Data.Map    (fromList)
import Data.Monoid (mappend)

main = xmonad defaultConfig {
     modMask = mod4Mask -- Use Super instead of Alt
     , keys = keys defaultConfig `mappend`
    \c -> fromList [
        ((0, xK_F6), lowerVolume 4 >> return ()),
        ((0, xK_F7), raiseVolume 4 >> return ())
    ]
}
