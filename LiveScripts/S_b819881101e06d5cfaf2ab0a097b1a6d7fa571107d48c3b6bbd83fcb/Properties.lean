import CardanoLedgerApi.V3
import LiveScripts.S_b819881101e06d5cfaf2ab0a097b1a6d7fa571107d48c3b6bbd83fcb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b819881101e06d5cfaf2ab0a097b1a6d7fa571107d48c3b6bbd83fcb.script (spendingInputs ctx) 1000)]
