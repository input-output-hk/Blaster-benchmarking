import CardanoLedgerApi.V3
import LiveScripts.S_4b152f565c45b7a4e3a3618ce2863f3e596864ab4cfe64991a54230b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4b152f565c45b7a4e3a3618ce2863f3e596864ab4cfe64991a54230b.script (mintingInputs ctx) 1000)]
