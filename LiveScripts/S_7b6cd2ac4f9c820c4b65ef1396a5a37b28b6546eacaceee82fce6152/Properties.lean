import CardanoLedgerApi.V3
import LiveScripts.S_7b6cd2ac4f9c820c4b65ef1396a5a37b28b6546eacaceee82fce6152.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7b6cd2ac4f9c820c4b65ef1396a5a37b28b6546eacaceee82fce6152.script (spendingInputs ctx) 1000)]
