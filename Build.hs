import qualified Clash.Main as Clash

main :: IO ()
main = do
    Clash.defaultMain ["-outputdir", "_build", "-isrc", "--verilog", "Main"]

    -- -- This works instead!
    -- Clash.defaultMain ["-outputdir", "_build", "-isrc", "--verilog", "Main", "-fplugin=Protocols.Plugin"]
