import CardanoLedgerApi.V3
import LiveScripts.S_e59c25d2e075dda30ea62bacd34ad14c751af463bdf647f7ba2b7d8b.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_e59c25d2e075dda30ea62bacd34ad14c751af463bdf647f7ba2b7d8b.script (mintingInputs ctx) 1000)]
