import CardanoLedgerApi.V3
import LiveScripts.S_9eefbad3d5906f56b886abfee1e4a093b303f1b1c400cda6b6b50d59.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9eefbad3d5906f56b886abfee1e4a093b303f1b1c400cda6b6b50d59.script (mintingInputs ctx) 1000)]
