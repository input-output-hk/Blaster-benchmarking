import CardanoLedgerApi.V3
import LiveScripts.S_32ed1c6cedee2fda27d28cd18d26661e1b60662e6b450ae0b68ef596.Script
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
      ¬ isSuccessful (cekExecuteProgram script_32ed1c6cedee2fda27d28cd18d26661e1b60662e6b450ae0b68ef596.script (mintingInputs ctx) 1000)]
