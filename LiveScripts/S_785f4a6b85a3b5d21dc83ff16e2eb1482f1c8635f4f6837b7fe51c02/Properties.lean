import CardanoLedgerApi.V3
import LiveScripts.S_785f4a6b85a3b5d21dc83ff16e2eb1482f1c8635f4f6837b7fe51c02.Script
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
      ¬ isSuccessful (cekExecuteProgram script_785f4a6b85a3b5d21dc83ff16e2eb1482f1c8635f4f6837b7fe51c02.script (spendingInputs ctx) 1000)]
