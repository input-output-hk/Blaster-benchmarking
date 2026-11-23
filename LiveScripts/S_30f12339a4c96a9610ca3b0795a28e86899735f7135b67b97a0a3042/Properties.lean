import LiveScripts.Shared
import LiveScripts.S_30f12339a4c96a9610ca3b0795a28e86899735f7135b67b97a0a3042.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_30f12339a4c96a9610ca3b0795a28e86899735f7135b67b97a0a3042.script [datum, redeemer, ctx] 10000]
