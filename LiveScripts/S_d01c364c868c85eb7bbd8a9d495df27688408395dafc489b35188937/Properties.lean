import LiveScripts.Shared
import LiveScripts.S_d01c364c868c85eb7bbd8a9d495df27688408395dafc489b35188937.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d01c364c868c85eb7bbd8a9d495df27688408395dafc489b35188937.script [datum, redeemer, ctx] 10000]
