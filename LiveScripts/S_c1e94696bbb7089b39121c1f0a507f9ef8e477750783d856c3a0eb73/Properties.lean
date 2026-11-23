import CardanoLedgerApi.V3
import LiveScripts.S_c1e94696bbb7089b39121c1f0a507f9ef8e477750783d856c3a0eb73.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c1e94696bbb7089b39121c1f0a507f9ef8e477750783d856c3a0eb73.script (mintingInputs ctx) 1000)]
