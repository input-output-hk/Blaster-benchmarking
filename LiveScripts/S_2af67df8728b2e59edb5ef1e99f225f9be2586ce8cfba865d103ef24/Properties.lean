import CardanoLedgerApi.V3
import LiveScripts.S_2af67df8728b2e59edb5ef1e99f225f9be2586ce8cfba865d103ef24.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2af67df8728b2e59edb5ef1e99f225f9be2586ce8cfba865d103ef24.script (spendingInputs ctx) 1000)]
