import CardanoLedgerApi.V3
import LiveScripts.S_2af0e5cf68e1ce0ac5470cfbed9dbfebe2f8f8def35f042b17199944.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2af0e5cf68e1ce0ac5470cfbed9dbfebe2f8f8def35f042b17199944.script (spendingInputs ctx) 1000)]
