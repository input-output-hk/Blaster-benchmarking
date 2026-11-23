import CardanoLedgerApi.V3
import LiveScripts.S_7fe72f00d4e55b6b05715991971e4c5b8eb4a59ea498b8c8f80521c8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7fe72f00d4e55b6b05715991971e4c5b8eb4a59ea498b8c8f80521c8.script (spendingInputs ctx) 1000)]
