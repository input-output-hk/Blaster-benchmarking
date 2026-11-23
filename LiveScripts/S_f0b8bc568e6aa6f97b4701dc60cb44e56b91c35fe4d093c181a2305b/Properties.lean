import CardanoLedgerApi.V3
import LiveScripts.S_f0b8bc568e6aa6f97b4701dc60cb44e56b91c35fe4d093c181a2305b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f0b8bc568e6aa6f97b4701dc60cb44e56b91c35fe4d093c181a2305b.script (mintingInputs ctx) 1000)]
