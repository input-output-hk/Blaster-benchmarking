import CardanoLedgerApi.V3
import LiveScripts.S_977bde54117ae6ce2a40551f6aeb935bc4b7372a09c76ad6979e88f6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_977bde54117ae6ce2a40551f6aeb935bc4b7372a09c76ad6979e88f6.script (mintingInputs ctx) 1000)]
