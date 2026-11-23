import LiveScripts.Shared
import LiveScripts.S_a270e7d6bf6b1cdeb2ef518747281284546132d7dd21255c5b0316e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a270e7d6bf6b1cdeb2ef518747281284546132d7dd21255c5b0316e8.script [ctx] 10000]
