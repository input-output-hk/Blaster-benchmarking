import LiveScripts.Shared
import LiveScripts.S_c48cbb3d5e57ed56e276bc45f99ab39abe94e6cd7ac39fb402da47ad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c48cbb3d5e57ed56e276bc45f99ab39abe94e6cd7ac39fb402da47ad.script [redeemer, ctx] 10000]
