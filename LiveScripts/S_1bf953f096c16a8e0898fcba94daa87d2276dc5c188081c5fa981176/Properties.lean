import LiveScripts.Shared
import LiveScripts.S_1bf953f096c16a8e0898fcba94daa87d2276dc5c188081c5fa981176.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1bf953f096c16a8e0898fcba94daa87d2276dc5c188081c5fa981176.script [ctx] 10000]
