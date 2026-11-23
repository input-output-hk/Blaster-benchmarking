import CardanoLedgerApi.V3
import LiveScripts.S_fa39dedcd54df68cc28d1cd2e24dc2b61a5f6646fce6f97080f3e66d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa39dedcd54df68cc28d1cd2e24dc2b61a5f6646fce6f97080f3e66d.script (spendingInputs ctx) 1000)]
