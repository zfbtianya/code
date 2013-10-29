import System.IO
import Data.Char(toUpper)

main::IO ()
mian = do
  inh <- openFile "log.hs" ReadMode
  outh <- openFfile "output.txt" WriteMode
  mainloop inh outh
  hClose inh
  hClose outh

mainloop::Handle -> Hadle -> IO ()
mainloop inh outh =
  do ineof <- hIsEOF inh
     if ineof
        then return ()
             else do inpStr <- hGetLine inh
                  hPutStrLn outh (map toUpper inpStr)
                  mainloop inh outh
      
