import CardanoLedgerApi.V3
import LiveScripts.S_ec0046a12a97d92a48ec49f5cf3723bd27290fcf4323a581ee4f356f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ec0046a12a97d92a48ec49f5cf3723bd27290fcf4323a581ee4f356f.script (mintingInputs ctx) 1000)]
