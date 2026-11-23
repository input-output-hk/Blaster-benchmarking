import LiveScripts.Shared
import LiveScripts.S_7e3ecc6f6641e1935d0b29fac0eb5ea04cd30461ea354db807d4ed4d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7e3ecc6f6641e1935d0b29fac0eb5ea04cd30461ea354db807d4ed4d.script [datum, redeemer, ctx] 10000]
