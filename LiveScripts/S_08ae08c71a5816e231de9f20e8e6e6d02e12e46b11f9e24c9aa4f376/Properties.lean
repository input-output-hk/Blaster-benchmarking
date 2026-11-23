import CardanoLedgerApi.V3
import LiveScripts.S_08ae08c71a5816e231de9f20e8e6e6d02e12e46b11f9e24c9aa4f376.Script
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
      ¬ isSuccessful (cekExecuteProgram script_08ae08c71a5816e231de9f20e8e6e6d02e12e46b11f9e24c9aa4f376.script (spendingInputs ctx) 1000)]
