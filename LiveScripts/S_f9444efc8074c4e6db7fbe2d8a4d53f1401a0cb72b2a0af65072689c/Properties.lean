import CardanoLedgerApi.V3
import LiveScripts.S_f9444efc8074c4e6db7fbe2d8a4d53f1401a0cb72b2a0af65072689c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f9444efc8074c4e6db7fbe2d8a4d53f1401a0cb72b2a0af65072689c.script (spendingInputs ctx) 1000)]
