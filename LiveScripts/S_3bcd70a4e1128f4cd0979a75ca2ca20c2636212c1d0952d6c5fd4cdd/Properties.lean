import CardanoLedgerApi.V3
import LiveScripts.S_3bcd70a4e1128f4cd0979a75ca2ca20c2636212c1d0952d6c5fd4cdd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3bcd70a4e1128f4cd0979a75ca2ca20c2636212c1d0952d6c5fd4cdd.script (mintingInputs ctx) 1000)]
