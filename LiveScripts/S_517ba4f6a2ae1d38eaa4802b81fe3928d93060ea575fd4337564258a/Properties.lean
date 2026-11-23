import CardanoLedgerApi.V3
import LiveScripts.S_517ba4f6a2ae1d38eaa4802b81fe3928d93060ea575fd4337564258a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_517ba4f6a2ae1d38eaa4802b81fe3928d93060ea575fd4337564258a.script (mintingInputs ctx) 1000)]
