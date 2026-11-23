import CardanoLedgerApi.V3
import LiveScripts.S_cb00bcdee59c8d1ff08c0cb0b75d1e47d3139122df79c14addd72ce3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cb00bcdee59c8d1ff08c0cb0b75d1e47d3139122df79c14addd72ce3.script (rewardingInputs ctx) 1000)]
