import CardanoLedgerApi.V3
import LiveScripts.S_dcfd60b4684c03fb4b08b14a0506b03b0d22f9aba943e9101348ff5a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dcfd60b4684c03fb4b08b14a0506b03b0d22f9aba943e9101348ff5a.script (rewardingInputs ctx) 1000)]
