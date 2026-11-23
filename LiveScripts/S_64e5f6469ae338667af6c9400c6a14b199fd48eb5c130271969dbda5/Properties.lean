import LiveScripts.Shared
import LiveScripts.S_64e5f6469ae338667af6c9400c6a14b199fd48eb5c130271969dbda5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_64e5f6469ae338667af6c9400c6a14b199fd48eb5c130271969dbda5.script [datum, redeemer, ctx] 10000]
