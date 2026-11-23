import CardanoLedgerApi.V3
import LiveScripts.S_a6a85074e56cf486a1c6620181902cf4726a7f5bb11878ae23eb99f5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a6a85074e56cf486a1c6620181902cf4726a7f5bb11878ae23eb99f5.script (rewardingInputs ctx) 1000)]
