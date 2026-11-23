import CardanoLedgerApi.V3
import LiveScripts.S_b8b5eeaae47d63f8a1bc3592874ac849a7d5a27749d381968e2b7e32.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b8b5eeaae47d63f8a1bc3592874ac849a7d5a27749d381968e2b7e32.script (spendingInputs ctx) 1000)]
