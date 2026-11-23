import CardanoLedgerApi.V3
import LiveScripts.S_4a6391f750fdaff342906d5aabe0bd430e78c66dd15fb7c9d6cd42ff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4a6391f750fdaff342906d5aabe0bd430e78c66dd15fb7c9d6cd42ff.script (mintingInputs ctx) 1000)]
