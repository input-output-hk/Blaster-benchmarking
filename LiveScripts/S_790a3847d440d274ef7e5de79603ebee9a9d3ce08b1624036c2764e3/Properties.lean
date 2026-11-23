import CardanoLedgerApi.V3
import LiveScripts.S_790a3847d440d274ef7e5de79603ebee9a9d3ce08b1624036c2764e3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_790a3847d440d274ef7e5de79603ebee9a9d3ce08b1624036c2764e3.script (spendingInputs ctx) 1000)]
