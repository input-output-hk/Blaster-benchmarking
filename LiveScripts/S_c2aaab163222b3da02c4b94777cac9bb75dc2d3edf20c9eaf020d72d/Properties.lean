import LiveScripts.Shared
import LiveScripts.S_c2aaab163222b3da02c4b94777cac9bb75dc2d3edf20c9eaf020d72d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c2aaab163222b3da02c4b94777cac9bb75dc2d3edf20c9eaf020d72d.script [redeemer, ctx] 10000]
