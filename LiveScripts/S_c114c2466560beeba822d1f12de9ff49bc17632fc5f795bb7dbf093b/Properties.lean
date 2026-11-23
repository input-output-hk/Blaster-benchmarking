import CardanoLedgerApi.V3
import LiveScripts.S_c114c2466560beeba822d1f12de9ff49bc17632fc5f795bb7dbf093b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c114c2466560beeba822d1f12de9ff49bc17632fc5f795bb7dbf093b.script (spendingInputs ctx) 1000)]
