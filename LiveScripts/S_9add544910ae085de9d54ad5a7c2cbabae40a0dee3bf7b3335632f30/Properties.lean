import CardanoLedgerApi.V3
import LiveScripts.S_9add544910ae085de9d54ad5a7c2cbabae40a0dee3bf7b3335632f30.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9add544910ae085de9d54ad5a7c2cbabae40a0dee3bf7b3335632f30.script (mintingInputs ctx) 1000)]
