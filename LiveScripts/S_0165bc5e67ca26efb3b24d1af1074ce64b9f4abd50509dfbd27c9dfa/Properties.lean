import CardanoLedgerApi.V3
import LiveScripts.S_0165bc5e67ca26efb3b24d1af1074ce64b9f4abd50509dfbd27c9dfa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0165bc5e67ca26efb3b24d1af1074ce64b9f4abd50509dfbd27c9dfa.script (spendingInputs ctx) 1000)]
