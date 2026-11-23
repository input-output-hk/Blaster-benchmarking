import CardanoLedgerApi.V3
import LiveScripts.S_dcc6a744032782058554e242b23dc9d66ac287bf351d122aa8d8bd1f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dcc6a744032782058554e242b23dc9d66ac287bf351d122aa8d8bd1f.script (mintingInputs ctx) 1000)]
