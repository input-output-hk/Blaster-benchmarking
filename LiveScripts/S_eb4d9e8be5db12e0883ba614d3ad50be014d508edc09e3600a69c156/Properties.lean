import LiveScripts.Shared
import LiveScripts.S_eb4d9e8be5db12e0883ba614d3ad50be014d508edc09e3600a69c156.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb4d9e8be5db12e0883ba614d3ad50be014d508edc09e3600a69c156.script [ctx] 10000]
