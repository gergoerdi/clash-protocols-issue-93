import qualified Clash.Main as Clash

main :: IO ()
main = Clash.defaultMain ["-outputdir", "_build", "-isrc", "--verilog", "Main"]
