import LiveScripts.Shared
import LiveScripts.S_b4c1189d0a5d54d47d459805da24afa2e9561cfc52329cd74719d17e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b4c1189d0a5d54d47d459805da24afa2e9561cfc52329cd74719d17e.script [datum, redeemer, ctx] 10000]
