import CardanoLedgerApi.V3
import LiveScripts.S_3c76a40cd4b0e2197090db4116b1e9e31a83c6581c950a844e42e660.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3c76a40cd4b0e2197090db4116b1e9e31a83c6581c950a844e42e660.script (mintingInputs ctx) 1000)]
