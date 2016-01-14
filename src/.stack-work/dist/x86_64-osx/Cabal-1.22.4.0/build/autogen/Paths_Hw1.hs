module Paths_Hw1 (
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
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/vbk/code/haskell/hw1/src/.stack-work/install/x86_64-osx/nightly-2015-09-24/7.10.2/bin"
libdir     = "/Users/vbk/code/haskell/hw1/src/.stack-work/install/x86_64-osx/nightly-2015-09-24/7.10.2/lib/x86_64-osx-ghc-7.10.2/Hw1-1.0-BIfEhqsJAjG14532ILwRDE"
datadir    = "/Users/vbk/code/haskell/hw1/src/.stack-work/install/x86_64-osx/nightly-2015-09-24/7.10.2/share/x86_64-osx-ghc-7.10.2/Hw1-1.0"
libexecdir = "/Users/vbk/.cabal/libexec"
sysconfdir = "/Users/vbk/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Hw1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Hw1_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Hw1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Hw1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Hw1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
