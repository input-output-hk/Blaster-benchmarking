import CardanoLedgerApi.V3
import LiveScripts.S_b8f505da3995d6c81d778782bbbd3f22e4ce05bad9bbfc77f2c4f900.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b8f505da3995d6c81d778782bbbd3f22e4ce05bad9bbfc77f2c4f900.script (spendingInputs ctx) 1000)]
