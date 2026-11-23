import LiveScripts.Shared
import LiveScripts.S_05a1efe8520e7bcc27e233db5f5b504b39a14e897b56420f33f8f13f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_05a1efe8520e7bcc27e233db5f5b504b39a14e897b56420f33f8f13f.script [datum, redeemer, ctx] 10000]
