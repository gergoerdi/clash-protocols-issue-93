{-# OPTIONS -fplugin=Protocols.Plugin #-}
module Main where

import Clash.Prelude
import Clash.Annotations.TH

import Protocols

foo :: Circuit (CSignal dom a) (CSignal dom a)
foo = circuit $ \x -> do
    idC -< x

topEntity
    :: "CLK_100MHZ" ::: Clock System
    -> "RESET"      ::: Reset System
    -> "RX"         ::: Signal System Bit
    -> "TX"         ::: Signal System Bit
topEntity clk rst = withClockResetEnable clk rst enableGen $ \rx ->
    let (_, tx) = toSignals foo (rx, pure ())
    in tx

makeTopEntity 'topEntity

main :: IO ()
main = pure ()
