import LiveScripts.Shared
import LiveScripts.S_44add170f68c0463c1362899e4f1cd7401258dc0bd3ce74ecd8f878a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_44add170f68c0463c1362899e4f1cd7401258dc0bd3ce74ecd8f878a.script [ctx] 10000]
