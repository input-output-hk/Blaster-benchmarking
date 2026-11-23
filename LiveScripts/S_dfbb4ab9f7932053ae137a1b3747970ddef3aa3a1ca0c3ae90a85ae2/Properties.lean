import CardanoLedgerApi.V3
import LiveScripts.S_dfbb4ab9f7932053ae137a1b3747970ddef3aa3a1ca0c3ae90a85ae2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dfbb4ab9f7932053ae137a1b3747970ddef3aa3a1ca0c3ae90a85ae2.script (spendingInputs ctx) 1000)]
