import LiveScripts.Shared
import LiveScripts.S_04ea363a127872366ef2d3186325a25a5cee8826ff8a79dc7c8fa671.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_04ea363a127872366ef2d3186325a25a5cee8826ff8a79dc7c8fa671.script [redeemer, ctx] 10000]
