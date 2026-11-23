import LiveScripts.Shared
import LiveScripts.S_a59f43ee64d574c2ac959db6af83ac63481bda8964eb659d047a4868.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a59f43ee64d574c2ac959db6af83ac63481bda8964eb659d047a4868.script [ctx] 10000]
