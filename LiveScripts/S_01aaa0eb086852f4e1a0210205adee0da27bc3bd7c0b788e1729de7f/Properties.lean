import CardanoLedgerApi.V3
import LiveScripts.S_01aaa0eb086852f4e1a0210205adee0da27bc3bd7c0b788e1729de7f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_01aaa0eb086852f4e1a0210205adee0da27bc3bd7c0b788e1729de7f.script (spendingInputs ctx) 1000)]
