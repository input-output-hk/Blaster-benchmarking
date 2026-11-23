import CardanoLedgerApi.V3
import LiveScripts.S_69976d2b117b79fedc0b16497fe37707887f9a59b9e0b4feb5ef4870.Script
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
      ¬ isSuccessful (cekExecuteProgram script_69976d2b117b79fedc0b16497fe37707887f9a59b9e0b4feb5ef4870.script (rewardingInputs ctx) 1000)]
