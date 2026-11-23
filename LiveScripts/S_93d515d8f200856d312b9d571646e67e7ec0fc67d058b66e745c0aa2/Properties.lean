import CardanoLedgerApi.V3
import LiveScripts.S_93d515d8f200856d312b9d571646e67e7ec0fc67d058b66e745c0aa2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_93d515d8f200856d312b9d571646e67e7ec0fc67d058b66e745c0aa2.script (spendingInputs ctx) 1000)]
