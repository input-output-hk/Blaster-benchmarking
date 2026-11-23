import CardanoLedgerApi.V3
import LiveScripts.S_6f46a396e68ef9f153d2ba55e6e921e54a339a1f1bb02b6e81169afb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f46a396e68ef9f153d2ba55e6e921e54a339a1f1bb02b6e81169afb.script (mintingInputs ctx) 1000)]
