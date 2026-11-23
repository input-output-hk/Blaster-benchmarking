import CardanoLedgerApi.V3
import LiveScripts.S_771faa54903ca935f2785b979312d6d69f5e9ce6f10ffe8cd5d3f6e2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_771faa54903ca935f2785b979312d6d69f5e9ce6f10ffe8cd5d3f6e2.script (mintingInputs ctx) 1000)]
