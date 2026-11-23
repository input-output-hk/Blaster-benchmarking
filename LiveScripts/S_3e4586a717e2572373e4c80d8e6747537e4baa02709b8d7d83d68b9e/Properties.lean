import CardanoLedgerApi.V3
import LiveScripts.S_3e4586a717e2572373e4c80d8e6747537e4baa02709b8d7d83d68b9e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3e4586a717e2572373e4c80d8e6747537e4baa02709b8d7d83d68b9e.script (mintingInputs ctx) 1000)]
