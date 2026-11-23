import CardanoLedgerApi.V3
import LiveScripts.S_cc1e035a4a8eb18d3fb4d0c8d7e5fe3c8efcf6c26f05daafaf5ed707.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cc1e035a4a8eb18d3fb4d0c8d7e5fe3c8efcf6c26f05daafaf5ed707.script (mintingInputs ctx) 1000)]
