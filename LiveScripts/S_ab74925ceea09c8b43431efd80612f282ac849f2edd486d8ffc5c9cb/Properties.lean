import CardanoLedgerApi.V3
import LiveScripts.S_ab74925ceea09c8b43431efd80612f282ac849f2edd486d8ffc5c9cb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ab74925ceea09c8b43431efd80612f282ac849f2edd486d8ffc5c9cb.script (spendingInputs ctx) 1000)]
