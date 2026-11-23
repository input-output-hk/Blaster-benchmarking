import CardanoLedgerApi.V3
import LiveScripts.S_0b61303a116a51740f9997b7e27fefa3d9b25987c111c2af9dfdb0d0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0b61303a116a51740f9997b7e27fefa3d9b25987c111c2af9dfdb0d0.script (rewardingInputs ctx) 1000)]
