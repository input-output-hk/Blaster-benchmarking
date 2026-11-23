import CardanoLedgerApi.V3
import LiveScripts.S_23ec83036d5274cd2a50b9ab76ae337ebec682910178cbc1813c2127.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: reward; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validRewardingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_23ec83036d5274cd2a50b9ab76ae337ebec682910178cbc1813c2127.script (rewardingInputs ctx) 1000)]
