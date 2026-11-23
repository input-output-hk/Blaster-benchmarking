import CardanoLedgerApi.V3
import LiveScripts.S_092eec647c1a7e0d3da2844e1ea35a1332962d7246c5feacb1071de7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_092eec647c1a7e0d3da2844e1ea35a1332962d7246c5feacb1071de7.script (mintingInputs ctx) 1000)]
