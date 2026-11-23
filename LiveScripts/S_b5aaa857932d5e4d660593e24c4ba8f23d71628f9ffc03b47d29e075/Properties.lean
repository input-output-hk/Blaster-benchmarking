import CardanoLedgerApi.V3
import LiveScripts.S_b5aaa857932d5e4d660593e24c4ba8f23d71628f9ffc03b47d29e075.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b5aaa857932d5e4d660593e24c4ba8f23d71628f9ffc03b47d29e075.script (mintingInputs ctx) 1000)]
