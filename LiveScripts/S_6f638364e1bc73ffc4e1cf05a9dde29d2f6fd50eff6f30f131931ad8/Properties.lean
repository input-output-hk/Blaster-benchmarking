import LiveScripts.Shared
import LiveScripts.S_6f638364e1bc73ffc4e1cf05a9dde29d2f6fd50eff6f30f131931ad8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f638364e1bc73ffc4e1cf05a9dde29d2f6fd50eff6f30f131931ad8.script [redeemer, ctx] 10000]
