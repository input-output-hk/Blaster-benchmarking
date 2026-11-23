import CardanoLedgerApi.V3
import LiveScripts.S_c9450bfc1cc5fe4b6bf5aa5a4c1bd347aa2ac38c455f8a2ebdb1e9dc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c9450bfc1cc5fe4b6bf5aa5a4c1bd347aa2ac38c455f8a2ebdb1e9dc.script (spendingInputs ctx) 1000)]
