import CardanoLedgerApi.V3
import LiveScripts.S_0ed72075b224ccf9ce5965a92377448e81a0475d74d90cfa7f5ac857.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0ed72075b224ccf9ce5965a92377448e81a0475d74d90cfa7f5ac857.script (spendingInputs ctx) 1000)]
