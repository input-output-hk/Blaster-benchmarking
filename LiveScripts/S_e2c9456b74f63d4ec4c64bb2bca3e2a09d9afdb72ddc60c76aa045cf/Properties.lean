import LiveScripts.Shared
import LiveScripts.S_e2c9456b74f63d4ec4c64bb2bca3e2a09d9afdb72ddc60c76aa045cf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e2c9456b74f63d4ec4c64bb2bca3e2a09d9afdb72ddc60c76aa045cf.script [redeemer, ctx] 10000]
