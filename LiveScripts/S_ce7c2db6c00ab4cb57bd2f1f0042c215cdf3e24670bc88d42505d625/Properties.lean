import CardanoLedgerApi.V3
import LiveScripts.S_ce7c2db6c00ab4cb57bd2f1f0042c215cdf3e24670bc88d42505d625.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_ce7c2db6c00ab4cb57bd2f1f0042c215cdf3e24670bc88d42505d625.script (mintingInputs ctx) 1000)]
