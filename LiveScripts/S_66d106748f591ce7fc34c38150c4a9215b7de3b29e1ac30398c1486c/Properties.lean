import LiveScripts.Shared
import LiveScripts.S_66d106748f591ce7fc34c38150c4a9215b7de3b29e1ac30398c1486c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_66d106748f591ce7fc34c38150c4a9215b7de3b29e1ac30398c1486c.script [datum, redeemer, ctx] 10000]
