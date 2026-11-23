import CardanoLedgerApi.V3
import LiveScripts.S_89a066f2a3d29a5b4930b3c2cf10650a98c99e6a0df5b63bca82cfb4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_89a066f2a3d29a5b4930b3c2cf10650a98c99e6a0df5b63bca82cfb4.script (rewardingInputs ctx) 1000)]
