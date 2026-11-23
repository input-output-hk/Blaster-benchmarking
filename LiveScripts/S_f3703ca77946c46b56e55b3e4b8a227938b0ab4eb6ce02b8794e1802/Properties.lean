import CardanoLedgerApi.V3
import LiveScripts.S_f3703ca77946c46b56e55b3e4b8a227938b0ab4eb6ce02b8794e1802.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f3703ca77946c46b56e55b3e4b8a227938b0ab4eb6ce02b8794e1802.script (spendingInputs ctx) 1000)]
