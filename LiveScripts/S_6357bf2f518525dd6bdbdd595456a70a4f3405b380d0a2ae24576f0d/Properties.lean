import LiveScripts.Shared
import LiveScripts.S_6357bf2f518525dd6bdbdd595456a70a4f3405b380d0a2ae24576f0d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6357bf2f518525dd6bdbdd595456a70a4f3405b380d0a2ae24576f0d.script [datum, redeemer, ctx] 10000]
