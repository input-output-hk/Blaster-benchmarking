import CardanoLedgerApi.V3
import LiveScripts.S_e1c3fc5120a1bce6bd168c21dfd474a6f2b2d46ec9a0283d0fcfbc3c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e1c3fc5120a1bce6bd168c21dfd474a6f2b2d46ec9a0283d0fcfbc3c.script (rewardingInputs ctx) 1000)]
