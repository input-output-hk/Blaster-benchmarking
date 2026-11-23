import CardanoLedgerApi.V3
import LiveScripts.S_f3ef5d4b3828678e58f4d1bc4300bbeb4b6265e08a3a4b164c468b56.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f3ef5d4b3828678e58f4d1bc4300bbeb4b6265e08a3a4b164c468b56.script (spendingInputs ctx) 1000)]
