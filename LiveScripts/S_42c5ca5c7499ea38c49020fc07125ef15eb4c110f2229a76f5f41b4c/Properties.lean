import CardanoLedgerApi.V3
import LiveScripts.S_42c5ca5c7499ea38c49020fc07125ef15eb4c110f2229a76f5f41b4c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_42c5ca5c7499ea38c49020fc07125ef15eb4c110f2229a76f5f41b4c.script (mintingInputs ctx) 1000)]
