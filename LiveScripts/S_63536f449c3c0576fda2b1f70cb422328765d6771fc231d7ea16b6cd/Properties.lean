import CardanoLedgerApi.V3
import LiveScripts.S_63536f449c3c0576fda2b1f70cb422328765d6771fc231d7ea16b6cd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_63536f449c3c0576fda2b1f70cb422328765d6771fc231d7ea16b6cd.script (mintingInputs ctx) 1000)]
