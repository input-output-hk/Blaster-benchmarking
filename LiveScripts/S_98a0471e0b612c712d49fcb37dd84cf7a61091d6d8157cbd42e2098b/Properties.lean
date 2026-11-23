import CardanoLedgerApi.V3
import LiveScripts.S_98a0471e0b612c712d49fcb37dd84cf7a61091d6d8157cbd42e2098b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_98a0471e0b612c712d49fcb37dd84cf7a61091d6d8157cbd42e2098b.script (rewardingInputs ctx) 1000)]
