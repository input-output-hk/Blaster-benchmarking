import LiveScripts.Shared
import LiveScripts.S_bf1f50283029f47a20764640c83fc7fbde7c1b3175f8913167b78a99.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bf1f50283029f47a20764640c83fc7fbde7c1b3175f8913167b78a99.script [datum, redeemer, ctx] 10000]
