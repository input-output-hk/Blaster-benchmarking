import LiveScripts.Shared
import LiveScripts.S_e1c3fc5120a1bce6bd168c21dfd474a6f2b2d46ec9a0283d0fcfbc3c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e1c3fc5120a1bce6bd168c21dfd474a6f2b2d46ec9a0283d0fcfbc3c.script [ctx] 10000]
