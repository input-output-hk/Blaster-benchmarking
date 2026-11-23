import CardanoLedgerApi.V2
import LiveScripts.S_7a35cf17f7d4fc14e9b5ba99cf9be338d0e05a9df3841de767728ae5.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_7a35cf17f7d4fc14e9b5ba99cf9be338d0e05a9df3841de767728ae5.script (mintingInputs input) 1000)]
