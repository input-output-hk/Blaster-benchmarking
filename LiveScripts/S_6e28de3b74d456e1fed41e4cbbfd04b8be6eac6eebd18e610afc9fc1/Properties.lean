import CardanoLedgerApi.V3
import LiveScripts.S_6e28de3b74d456e1fed41e4cbbfd04b8be6eac6eebd18e610afc9fc1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6e28de3b74d456e1fed41e4cbbfd04b8be6eac6eebd18e610afc9fc1.script (spendingInputs ctx) 1000)]
