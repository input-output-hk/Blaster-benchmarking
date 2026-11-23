import CardanoLedgerApi.V1
import LiveScripts.S_ba135e4ddc1fdb0918cb20b61b7b6f5f3707b15761719cf0047195d2.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_ba135e4ddc1fdb0918cb20b61b7b6f5f3707b15761719cf0047195d2.script (mintingInputs input) 1000)]
