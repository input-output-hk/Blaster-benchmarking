import CardanoLedgerApi.V3
import LiveScripts.S_c4dd281b20d1f8edc678f6d7dd582d16ff24d321211864a64f23bcb7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c4dd281b20d1f8edc678f6d7dd582d16ff24d321211864a64f23bcb7.script (spendingInputs ctx) 1000)]
