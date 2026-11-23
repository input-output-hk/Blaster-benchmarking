import CardanoLedgerApi.V3
import LiveScripts.S_45211564f6e4ee6af2f85871dbe09ccdfe58161c80e3cbea03350c1b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_45211564f6e4ee6af2f85871dbe09ccdfe58161c80e3cbea03350c1b.script (mintingInputs ctx) 1000)]
