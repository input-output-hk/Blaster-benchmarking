import CardanoLedgerApi.V3
import LiveScripts.S_d77c0bea8bf5a2f8b3b401329ba22e77b2cd8fe88f2b8e2fc3781223.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d77c0bea8bf5a2f8b3b401329ba22e77b2cd8fe88f2b8e2fc3781223.script (spendingInputs ctx) 1000)]
