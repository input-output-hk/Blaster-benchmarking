import CardanoLedgerApi.V3
import LiveScripts.S_fa6c32f89e90ee3e4a66ef1025103240ea53a098443803fbce373e14.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa6c32f89e90ee3e4a66ef1025103240ea53a098443803fbce373e14.script (mintingInputs ctx) 1000)]
