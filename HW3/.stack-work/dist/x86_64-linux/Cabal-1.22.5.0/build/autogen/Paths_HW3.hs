module Paths_HW3 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/cherepashka-ninja/\1044\1086\1082\1091\1084\1077\1085\1090\1099/\1091\1095\1091\1089\1100/haskell/\1076\1079/HW3/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/bin"
libdir     = "/home/cherepashka-ninja/\1044\1086\1082\1091\1084\1077\1085\1090\1099/\1091\1095\1091\1089\1100/haskell/\1076\1079/HW3/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/lib/x86_64-linux-ghc-7.10.3/HW3-0.1.0.0-8wvv25z80oHIqpjlWB1qJs"
datadir    = "/home/cherepashka-ninja/\1044\1086\1082\1091\1084\1077\1085\1090\1099/\1091\1095\1091\1089\1100/haskell/\1076\1079/HW3/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/share/x86_64-linux-ghc-7.10.3/HW3-0.1.0.0"
libexecdir = "/home/cherepashka-ninja/\1044\1086\1082\1091\1084\1077\1085\1090\1099/\1091\1095\1091\1089\1100/haskell/\1076\1079/HW3/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/libexec"
sysconfdir = "/home/cherepashka-ninja/\1044\1086\1082\1091\1084\1077\1085\1090\1099/\1091\1095\1091\1089\1100/haskell/\1076\1079/HW3/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HW3_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HW3_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HW3_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HW3_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HW3_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
