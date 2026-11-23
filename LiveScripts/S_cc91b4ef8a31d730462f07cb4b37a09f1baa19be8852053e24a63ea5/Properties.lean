import CardanoLedgerApi.V3
import LiveScripts.S_cc91b4ef8a31d730462f07cb4b37a09f1baa19be8852053e24a63ea5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cc91b4ef8a31d730462f07cb4b37a09f1baa19be8852053e24a63ea5.script (mintingInputs ctx) 1000)]
