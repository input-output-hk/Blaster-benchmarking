import CardanoLedgerApi.V3
import LiveScripts.S_a11774152ca1a0c52a37f7da4d2ba8760a659ff8a14de97eb238edde.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a11774152ca1a0c52a37f7da4d2ba8760a659ff8a14de97eb238edde.script (rewardingInputs ctx) 1000)]
