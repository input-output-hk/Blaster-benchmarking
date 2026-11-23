import LiveScripts.Shared
import LiveScripts.S_5f42994532b04f9f5bd4141c69364c5b7d33c85036146ee321799702.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5f42994532b04f9f5bd4141c69364c5b7d33c85036146ee321799702.script [redeemer, ctx] 10000]
