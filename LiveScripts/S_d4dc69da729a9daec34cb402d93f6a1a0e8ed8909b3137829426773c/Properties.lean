import CardanoLedgerApi.V3
import LiveScripts.S_d4dc69da729a9daec34cb402d93f6a1a0e8ed8909b3137829426773c.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: reward; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validRewardingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_d4dc69da729a9daec34cb402d93f6a1a0e8ed8909b3137829426773c.script (rewardingInputs ctx) 1000)]
