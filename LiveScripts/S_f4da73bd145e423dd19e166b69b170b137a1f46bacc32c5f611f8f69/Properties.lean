import CardanoLedgerApi.V3
import LiveScripts.S_f4da73bd145e423dd19e166b69b170b137a1f46bacc32c5f611f8f69.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f4da73bd145e423dd19e166b69b170b137a1f46bacc32c5f611f8f69.script (rewardingInputs ctx) 1000)]
