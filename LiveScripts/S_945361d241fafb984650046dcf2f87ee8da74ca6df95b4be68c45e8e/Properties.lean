import CardanoLedgerApi.V3
import LiveScripts.S_945361d241fafb984650046dcf2f87ee8da74ca6df95b4be68c45e8e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_945361d241fafb984650046dcf2f87ee8da74ca6df95b4be68c45e8e.script (mintingInputs ctx) 1000)]
