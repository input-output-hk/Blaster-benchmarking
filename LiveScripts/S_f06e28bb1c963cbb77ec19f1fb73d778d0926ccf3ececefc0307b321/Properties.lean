import LiveScripts.Shared
import LiveScripts.S_f06e28bb1c963cbb77ec19f1fb73d778d0926ccf3ececefc0307b321.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f06e28bb1c963cbb77ec19f1fb73d778d0926ccf3ececefc0307b321.script [ctx] 10000]
