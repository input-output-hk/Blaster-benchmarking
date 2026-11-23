import LiveScripts.Shared
import LiveScripts.S_07de5eb4fdb9f6bd23c7bc3c588306f03d46c8c59ee980223132c87e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07de5eb4fdb9f6bd23c7bc3c588306f03d46c8c59ee980223132c87e.script [datum, redeemer, ctx] 10000]
