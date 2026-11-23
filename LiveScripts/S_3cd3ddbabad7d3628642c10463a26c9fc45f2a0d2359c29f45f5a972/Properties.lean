import CardanoLedgerApi.V2
import LiveScripts.S_3cd3ddbabad7d3628642c10463a26c9fc45f2a0d2359c29f45f5a972.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_3cd3ddbabad7d3628642c10463a26c9fc45f2a0d2359c29f45f5a972.script (spendingInputs input) 1000)]
