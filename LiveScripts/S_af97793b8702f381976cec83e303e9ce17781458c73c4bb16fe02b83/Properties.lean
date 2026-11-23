import LiveScripts.Shared
import LiveScripts.S_af97793b8702f381976cec83e303e9ce17781458c73c4bb16fe02b83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_af97793b8702f381976cec83e303e9ce17781458c73c4bb16fe02b83.script [datum, redeemer, ctx] 10000]
