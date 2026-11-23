import CardanoLedgerApi.V3
import LiveScripts.S_4e1bc01061932c4d4692d6205e24f51cdb57feb96a09d39e72467c87.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4e1bc01061932c4d4692d6205e24f51cdb57feb96a09d39e72467c87.script (mintingInputs ctx) 1000)]
