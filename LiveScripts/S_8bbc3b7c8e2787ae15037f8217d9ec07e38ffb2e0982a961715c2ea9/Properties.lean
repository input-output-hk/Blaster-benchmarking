import CardanoLedgerApi.V3
import LiveScripts.S_8bbc3b7c8e2787ae15037f8217d9ec07e38ffb2e0982a961715c2ea9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8bbc3b7c8e2787ae15037f8217d9ec07e38ffb2e0982a961715c2ea9.script (spendingInputs ctx) 1000)]
