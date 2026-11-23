import CardanoLedgerApi.V3
import LiveScripts.S_934aeec57bdef0ed0b66be2d825bf4dad838a849d9d9ba9bc89f4cc1.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_934aeec57bdef0ed0b66be2d825bf4dad838a849d9d9ba9bc89f4cc1.script (spendingInputs ctx) 1000)]
