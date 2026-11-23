import LiveScripts.Shared
import LiveScripts.S_3b1b5477438905729a6c77940ac5c7aabec5497a148609b2670cdc6c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b1b5477438905729a6c77940ac5c7aabec5497a148609b2670cdc6c.script [datum, redeemer, ctx] 10000]
