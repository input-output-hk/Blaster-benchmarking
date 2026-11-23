import LiveScripts.Shared
import LiveScripts.S_6237228939cb4c1b4c212bfcaecdf2188ca9d8f8de5632c2acec010e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6237228939cb4c1b4c212bfcaecdf2188ca9d8f8de5632c2acec010e.script [redeemer, ctx] 10000]
