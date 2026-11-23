import LiveScripts.Shared
import LiveScripts.S_feaa5db64fbf8e2ec9d9913af3ceac45139ae0ca608966412eadb4f1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_feaa5db64fbf8e2ec9d9913af3ceac45139ae0ca608966412eadb4f1.script [datum, redeemer, ctx] 10000]
