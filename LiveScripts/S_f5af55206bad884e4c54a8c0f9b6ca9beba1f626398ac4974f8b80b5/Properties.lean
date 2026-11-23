import CardanoLedgerApi.V3
import LiveScripts.S_f5af55206bad884e4c54a8c0f9b6ca9beba1f626398ac4974f8b80b5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f5af55206bad884e4c54a8c0f9b6ca9beba1f626398ac4974f8b80b5.script (mintingInputs ctx) 1000)]
