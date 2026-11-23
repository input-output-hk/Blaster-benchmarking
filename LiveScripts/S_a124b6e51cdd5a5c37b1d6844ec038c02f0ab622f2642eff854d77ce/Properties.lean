import CardanoLedgerApi.V3
import LiveScripts.S_a124b6e51cdd5a5c37b1d6844ec038c02f0ab622f2642eff854d77ce.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a124b6e51cdd5a5c37b1d6844ec038c02f0ab622f2642eff854d77ce.script (rewardingInputs ctx) 1000)]
