import LiveScripts.Shared
import LiveScripts.S_1df93347f2d3420c2861d2cd7f38e46ff28030b644edc62e3f77ddc3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1df93347f2d3420c2861d2cd7f38e46ff28030b644edc62e3f77ddc3.script [ctx] 10000]
