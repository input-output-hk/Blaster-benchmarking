import CardanoLedgerApi.V3
import LiveScripts.S_6550a9e4cfd61d4996ec305da108a9e3d672e6ffacbcaa42ab51b451.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6550a9e4cfd61d4996ec305da108a9e3d672e6ffacbcaa42ab51b451.script (mintingInputs ctx) 1000)]
