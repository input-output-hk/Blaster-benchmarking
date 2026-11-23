import CardanoLedgerApi.V3
import LiveScripts.S_5bf0c8b1b60ba40b8ba5785de0cc334558a74b4e35e504343b17d3cc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5bf0c8b1b60ba40b8ba5785de0cc334558a74b4e35e504343b17d3cc.script (spendingInputs ctx) 1000)]
