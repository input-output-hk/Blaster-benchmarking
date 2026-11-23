import CardanoLedgerApi.V3
import LiveScripts.S_5f976ad5acfe4e6e8b4f6341b9c93b5c9da3efd01da6cd67a30922b0.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_5f976ad5acfe4e6e8b4f6341b9c93b5c9da3efd01da6cd67a30922b0.script (spendingInputs ctx) 1000)]
