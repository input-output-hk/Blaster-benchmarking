import CardanoLedgerApi.V3
import LiveScripts.S_7fc1bc177400310e7d889faaec7daa2fcd05d3c10d03e27a79646ef1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7fc1bc177400310e7d889faaec7daa2fcd05d3c10d03e27a79646ef1.script (mintingInputs ctx) 1000)]
