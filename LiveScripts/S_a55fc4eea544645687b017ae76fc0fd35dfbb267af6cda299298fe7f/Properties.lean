import LiveScripts.Shared
import LiveScripts.S_a55fc4eea544645687b017ae76fc0fd35dfbb267af6cda299298fe7f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a55fc4eea544645687b017ae76fc0fd35dfbb267af6cda299298fe7f.script [datum, redeemer, ctx] 10000]
