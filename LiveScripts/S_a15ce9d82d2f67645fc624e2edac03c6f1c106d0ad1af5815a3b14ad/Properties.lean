import CardanoLedgerApi.V3
import LiveScripts.S_a15ce9d82d2f67645fc624e2edac03c6f1c106d0ad1af5815a3b14ad.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a15ce9d82d2f67645fc624e2edac03c6f1c106d0ad1af5815a3b14ad.script (spendingInputs ctx) 1000)]
