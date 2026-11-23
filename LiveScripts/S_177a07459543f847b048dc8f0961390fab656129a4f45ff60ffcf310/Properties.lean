import LiveScripts.Shared
import LiveScripts.S_177a07459543f847b048dc8f0961390fab656129a4f45ff60ffcf310.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_177a07459543f847b048dc8f0961390fab656129a4f45ff60ffcf310.script [ctx] 10000]
