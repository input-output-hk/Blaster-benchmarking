import LiveScripts.Shared
import LiveScripts.S_326ad595b0991aa21b1c18ef5d3c22b7799ee4cf966797064df5f006.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_326ad595b0991aa21b1c18ef5d3c22b7799ee4cf966797064df5f006.script [redeemer, ctx] 10000]
