import CardanoLedgerApi.V3
import LiveScripts.S_c9abce00738fa5815cd514cbb7b5cc7a7b007f8ff7ce54b2e597eb0d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c9abce00738fa5815cd514cbb7b5cc7a7b007f8ff7ce54b2e597eb0d.script (mintingInputs ctx) 1000)]
