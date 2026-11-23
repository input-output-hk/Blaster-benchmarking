import LiveScripts.Shared
import LiveScripts.S_dfb1d21e529af28d82004eee5689e3304bb896c35ce8fe65c85612b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dfb1d21e529af28d82004eee5689e3304bb896c35ce8fe65c85612b0.script [ctx] 10000]
