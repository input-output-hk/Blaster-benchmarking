import CardanoLedgerApi.V3
import LiveScripts.S_bc7fb2f3bc457d5604f51e96c9dae1be428d3f0330a06097df488d05.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bc7fb2f3bc457d5604f51e96c9dae1be428d3f0330a06097df488d05.script (spendingInputs ctx) 1000)]
