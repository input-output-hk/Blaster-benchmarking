import CardanoLedgerApi.V3
import LiveScripts.S_8b53219504cd47ad9c9fb928bb58847d4683b6a6ed9f341340347cdc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8b53219504cd47ad9c9fb928bb58847d4683b6a6ed9f341340347cdc.script (mintingInputs ctx) 1000)]
