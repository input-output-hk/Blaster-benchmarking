import CardanoLedgerApi.V3
import LiveScripts.S_960a4d8396286de6a5ef1c018229cf64c0f83003fa89247a3d8c0021.Script
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
      ¬ isSuccessful (cekExecuteProgram script_960a4d8396286de6a5ef1c018229cf64c0f83003fa89247a3d8c0021.script (spendingInputs ctx) 1000)]
