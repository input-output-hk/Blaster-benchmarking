import CardanoLedgerApi.V3
import LiveScripts.S_3870c0e0fc94adc0f008231b7071e7f10ce986ff3aab19a6a2f5a6b0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3870c0e0fc94adc0f008231b7071e7f10ce986ff3aab19a6a2f5a6b0.script (spendingInputs ctx) 1000)]
