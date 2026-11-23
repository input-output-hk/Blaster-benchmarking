import CardanoLedgerApi.V3
import LiveScripts.S_8941bf81d80e53261fbdb316ace38d7bf03ade7eab01ac7451ae149b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8941bf81d80e53261fbdb316ace38d7bf03ade7eab01ac7451ae149b.script (rewardingInputs ctx) 1000)]
