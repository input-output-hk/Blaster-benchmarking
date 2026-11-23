import CardanoLedgerApi.V3
import LiveScripts.S_6ca3b95015bbef6237db91322132ebd3ac0c3850f79096eb6f42e1af.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6ca3b95015bbef6237db91322132ebd3ac0c3850f79096eb6f42e1af.script (rewardingInputs ctx) 1000)]
