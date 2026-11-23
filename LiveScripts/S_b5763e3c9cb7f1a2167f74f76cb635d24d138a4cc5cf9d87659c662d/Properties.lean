import CardanoLedgerApi.V3
import LiveScripts.S_b5763e3c9cb7f1a2167f74f76cb635d24d138a4cc5cf9d87659c662d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b5763e3c9cb7f1a2167f74f76cb635d24d138a4cc5cf9d87659c662d.script (spendingInputs ctx) 1000)]
