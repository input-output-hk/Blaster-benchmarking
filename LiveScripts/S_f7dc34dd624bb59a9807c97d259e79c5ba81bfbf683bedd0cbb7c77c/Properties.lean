import CardanoLedgerApi.V3
import LiveScripts.S_f7dc34dd624bb59a9807c97d259e79c5ba81bfbf683bedd0cbb7c77c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f7dc34dd624bb59a9807c97d259e79c5ba81bfbf683bedd0cbb7c77c.script (mintingInputs ctx) 1000)]
