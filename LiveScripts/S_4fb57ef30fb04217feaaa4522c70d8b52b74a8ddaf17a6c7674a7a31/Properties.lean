import CardanoLedgerApi.V3
import LiveScripts.S_4fb57ef30fb04217feaaa4522c70d8b52b74a8ddaf17a6c7674a7a31.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4fb57ef30fb04217feaaa4522c70d8b52b74a8ddaf17a6c7674a7a31.script (mintingInputs ctx) 1000)]
