import CardanoLedgerApi.V3
import LiveScripts.S_f1933896f08d1a3dc7d80e3a64ecc9ee088bd73e4ebd57b416b655ac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f1933896f08d1a3dc7d80e3a64ecc9ee088bd73e4ebd57b416b655ac.script (spendingInputs ctx) 1000)]
