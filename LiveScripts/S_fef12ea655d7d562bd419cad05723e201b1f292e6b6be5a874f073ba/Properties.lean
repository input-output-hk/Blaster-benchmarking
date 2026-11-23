import CardanoLedgerApi.V3
import LiveScripts.S_fef12ea655d7d562bd419cad05723e201b1f292e6b6be5a874f073ba.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fef12ea655d7d562bd419cad05723e201b1f292e6b6be5a874f073ba.script (rewardingInputs ctx) 1000)]
