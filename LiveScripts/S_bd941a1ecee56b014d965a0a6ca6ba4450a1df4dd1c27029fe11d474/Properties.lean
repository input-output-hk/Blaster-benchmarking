import CardanoLedgerApi.V3
import LiveScripts.S_bd941a1ecee56b014d965a0a6ca6ba4450a1df4dd1c27029fe11d474.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bd941a1ecee56b014d965a0a6ca6ba4450a1df4dd1c27029fe11d474.script (mintingInputs ctx) 1000)]
