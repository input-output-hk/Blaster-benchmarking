import CardanoLedgerApi.V3
import LiveScripts.S_fb5a2da943dd332c389f27df7eb3c88f5dc67477abcfb3f096a32fdd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fb5a2da943dd332c389f27df7eb3c88f5dc67477abcfb3f096a32fdd.script (spendingInputs ctx) 1000)]
