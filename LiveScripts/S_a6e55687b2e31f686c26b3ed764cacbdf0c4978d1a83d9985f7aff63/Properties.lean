import CardanoLedgerApi.V3
import LiveScripts.S_a6e55687b2e31f686c26b3ed764cacbdf0c4978d1a83d9985f7aff63.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a6e55687b2e31f686c26b3ed764cacbdf0c4978d1a83d9985f7aff63.script (rewardingInputs ctx) 1000)]
