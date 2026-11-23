import LiveScripts.Shared
import LiveScripts.S_720dbe15feb2adadcce4ecdd9dfc1f7291c5fe139e7c79a0703ca5d2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_720dbe15feb2adadcce4ecdd9dfc1f7291c5fe139e7c79a0703ca5d2.script [ctx] 10000]
