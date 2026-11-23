import LiveScripts.Shared
import LiveScripts.S_6f9114681e5690c9293ade8f4a0f2856ab43d8d1b3397d4e3ae6b2c3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f9114681e5690c9293ade8f4a0f2856ab43d8d1b3397d4e3ae6b2c3.script [datum, redeemer, ctx] 10000]
