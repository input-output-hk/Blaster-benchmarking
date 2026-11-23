import CardanoLedgerApi.V3
import LiveScripts.S_0be5078592f6c1f42e38e4c7ae8d2027801aa94ac61da1e94cf118f2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0be5078592f6c1f42e38e4c7ae8d2027801aa94ac61da1e94cf118f2.script (mintingInputs ctx) 1000)]
