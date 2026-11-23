import CardanoLedgerApi.V3
import LiveScripts.S_e69eba9f0ae4831bf6307a960e494ecb771bc49647d569c4db614a4a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e69eba9f0ae4831bf6307a960e494ecb771bc49647d569c4db614a4a.script (mintingInputs ctx) 1000)]
