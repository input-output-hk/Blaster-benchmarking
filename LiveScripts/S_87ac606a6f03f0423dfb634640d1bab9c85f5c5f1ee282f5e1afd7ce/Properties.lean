import CardanoLedgerApi.V3
import LiveScripts.S_87ac606a6f03f0423dfb634640d1bab9c85f5c5f1ee282f5e1afd7ce.Script
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
      ¬ isSuccessful (cekExecuteProgram script_87ac606a6f03f0423dfb634640d1bab9c85f5c5f1ee282f5e1afd7ce.script (mintingInputs ctx) 1000)]
