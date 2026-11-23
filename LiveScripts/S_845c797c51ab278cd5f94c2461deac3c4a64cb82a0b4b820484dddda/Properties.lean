import CardanoLedgerApi.V3
import LiveScripts.S_845c797c51ab278cd5f94c2461deac3c4a64cb82a0b4b820484dddda.Script
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
      ¬ isSuccessful (cekExecuteProgram script_845c797c51ab278cd5f94c2461deac3c4a64cb82a0b4b820484dddda.script (spendingInputs ctx) 1000)]
