import CardanoLedgerApi.V3
import LiveScripts.S_63b53c319d6a0f147c925ee3f2bc1dd63636618b9261afd96e50fee0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_63b53c319d6a0f147c925ee3f2bc1dd63636618b9261afd96e50fee0.script (spendingInputs ctx) 1000)]
