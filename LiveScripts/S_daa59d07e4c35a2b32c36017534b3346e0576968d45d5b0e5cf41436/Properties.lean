import CardanoLedgerApi.V3
import LiveScripts.S_daa59d07e4c35a2b32c36017534b3346e0576968d45d5b0e5cf41436.Script
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
      ¬ isSuccessful (cekExecuteProgram script_daa59d07e4c35a2b32c36017534b3346e0576968d45d5b0e5cf41436.script (mintingInputs ctx) 1000)]
