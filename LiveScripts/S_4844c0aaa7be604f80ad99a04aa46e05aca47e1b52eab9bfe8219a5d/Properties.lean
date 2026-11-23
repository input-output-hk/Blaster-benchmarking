import CardanoLedgerApi.V3
import LiveScripts.S_4844c0aaa7be604f80ad99a04aa46e05aca47e1b52eab9bfe8219a5d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4844c0aaa7be604f80ad99a04aa46e05aca47e1b52eab9bfe8219a5d.script (spendingInputs ctx) 1000)]
