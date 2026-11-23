import LiveScripts.Shared
import LiveScripts.S_f10726d3903431a729948deaad3fae70c9b63707978ebcc1297e6428.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f10726d3903431a729948deaad3fae70c9b63707978ebcc1297e6428.script [redeemer, ctx] 10000]
