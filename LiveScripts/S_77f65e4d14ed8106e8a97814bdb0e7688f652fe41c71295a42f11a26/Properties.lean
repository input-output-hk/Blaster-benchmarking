import CardanoLedgerApi.V3
import LiveScripts.S_77f65e4d14ed8106e8a97814bdb0e7688f652fe41c71295a42f11a26.Script
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
      ¬ isSuccessful (cekExecuteProgram script_77f65e4d14ed8106e8a97814bdb0e7688f652fe41c71295a42f11a26.script (rewardingInputs ctx) 1000)]
