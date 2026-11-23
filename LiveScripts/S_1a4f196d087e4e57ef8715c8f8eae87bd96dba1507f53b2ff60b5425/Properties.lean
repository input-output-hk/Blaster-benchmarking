import CardanoLedgerApi.V3
import LiveScripts.S_1a4f196d087e4e57ef8715c8f8eae87bd96dba1507f53b2ff60b5425.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1a4f196d087e4e57ef8715c8f8eae87bd96dba1507f53b2ff60b5425.script (mintingInputs ctx) 1000)]
