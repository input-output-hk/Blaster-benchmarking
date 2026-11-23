import CardanoLedgerApi.V3
import LiveScripts.S_797d8dbacbe2d429e1dbf40a353ef2b75f1eddbc4b896d7d2db4d4e1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_797d8dbacbe2d429e1dbf40a353ef2b75f1eddbc4b896d7d2db4d4e1.script (spendingInputs ctx) 1000)]
