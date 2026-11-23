import CardanoLedgerApi.V3
import LiveScripts.S_ed97e0a1394724bb7cb94f20acf627abc253694c92b88bf8fb4b7f6f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ed97e0a1394724bb7cb94f20acf627abc253694c92b88bf8fb4b7f6f.script (spendingInputs ctx) 1000)]
