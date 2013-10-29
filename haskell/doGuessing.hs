main =
  do x <- getX
     putStrLn x
getX =
  do return "hello"
     return "aren't"
     return "returns"
     return "rather"
     return "pointless?"
