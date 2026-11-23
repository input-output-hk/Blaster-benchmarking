import CardanoLedgerApi.V3
import LiveScripts.S_15ce3f4c28ef783419b0fb20c20ce953e509a3a121806d32112f6673.Script
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
      ¬ isSuccessful (cekExecuteProgram script_15ce3f4c28ef783419b0fb20c20ce953e509a3a121806d32112f6673.script (mintingInputs ctx) 1000)]
