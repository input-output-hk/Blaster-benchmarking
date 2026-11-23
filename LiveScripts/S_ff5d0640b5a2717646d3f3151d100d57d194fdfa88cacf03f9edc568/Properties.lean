import LiveScripts.Shared
import LiveScripts.S_ff5d0640b5a2717646d3f3151d100d57d194fdfa88cacf03f9edc568.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ff5d0640b5a2717646d3f3151d100d57d194fdfa88cacf03f9edc568.script [ctx] 10000]
