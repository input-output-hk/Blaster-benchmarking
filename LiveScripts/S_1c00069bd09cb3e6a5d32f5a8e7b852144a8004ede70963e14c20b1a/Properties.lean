import CardanoLedgerApi.V3
import LiveScripts.S_1c00069bd09cb3e6a5d32f5a8e7b852144a8004ede70963e14c20b1a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1c00069bd09cb3e6a5d32f5a8e7b852144a8004ede70963e14c20b1a.script (mintingInputs ctx) 1000)]
