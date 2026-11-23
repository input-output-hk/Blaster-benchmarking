import CardanoLedgerApi.V2
import LiveScripts.S_6f638364e1bc73ffc4e1cf05a9dde29d2f6fd50eff6f30f131931ad8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f638364e1bc73ffc4e1cf05a9dde29d2f6fd50eff6f30f131931ad8.script (mintingInputs input) 1000)]
