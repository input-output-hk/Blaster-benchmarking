import CardanoLedgerApi.V3
import LiveScripts.S_644b9345c054b8538644c69f9dde3cb2ea38dd0b28c82b701cc4921a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_644b9345c054b8538644c69f9dde3cb2ea38dd0b28c82b701cc4921a.script (rewardingInputs ctx) 1000)]
