import CardanoLedgerApi.V3
import LiveScripts.S_c323f0455aa9bfa34cd79b0b748a206f40bcdf411267ca35608d25b4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c323f0455aa9bfa34cd79b0b748a206f40bcdf411267ca35608d25b4.script (spendingInputs ctx) 1000)]
