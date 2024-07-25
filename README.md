Building via Stack works:

```
$ stack build
...

Installing executable bug in .stack-work/install/x86_64-linux/b906e9b40ecd2b8d7c01d804281d585d4f9e1ad6ac4247cf25a137cdbb942974/9.4.7/bin
```

Building with Clash fails because of missing Circuit plugin:

```
$ stack runhaskell -- Build.hs

src/Main.hs:11:5: error:
    • Couldn't match type: Circuit (CSignal dom a) (CSignal dom a)
                     with: t0 -> t1
      Expected: Circuit a0 a0 -> t0 -> t1
        Actual: GHC.Types.Any
    • The function ‘(-<)’ is applied to two value arguments,
        but its type ‘GHC.Types.Any’ has none
      In a stmt of a 'do' block: idC -< x
      In the expression: do idC -< x
    • Relevant bindings include
        x :: t0 (bound at src/Main.hs:10:18)
        foo :: Circuit (CSignal dom a) (CSignal dom a)
          (bound at src/Main.hs:10:1)
   |
11 |     idC -< x
   |     ^^^^^^^^
```
